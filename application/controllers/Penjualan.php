<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * ------------------------------------------------------------------------
 * CLASS NAME : Penjualan
 * ------------------------------------------------------------------------
 *
 * @author     Muhammad Akbar <muslim.politekniktelkom@gmail.com>
 * @copyright  2016
 * @license    http://aplikasiphp.net
 *
 */

class Penjualan extends CI_Controller
{
	public function ajax_kode()
	{
		if($this->input->is_ajax_request())
		{
			$keyword 	= $this->input->post('keyword');
			$registered	= $this->input->post('registered');

			$this->load->model('m_barang');

			$barang = $this->m_barang->cari_kode($keyword, $registered);

			if($barang->num_rows() > 0)
			{
				$json['status'] 	= 1;
				$json['datanya'] 	= "<ul id='daftar-autocomplete'>";
				foreach($barang->result() as $b)
				{
					$json['datanya'] .= "
						<li>
							<span id='kodenya'>".$b->kode_barang."</span>:
							<span id='barangnya'>".$b->nama_barang."</span>
							<span id='nama_satuan' style='display:none;'>".$b->nama_satuan."</span>
							<span id='satuan_id' style='display:none;'>".$b->satuan."</span>
							<span id='harga_jual' style='display:none;'>".$b->harga_jual."</span>

							
						</li>
					";
				}
				$json['datanya'] .= "</ul>";
			}
			else
			{
				$json['status'] 	= 0;
			}

			echo json_encode($json);
		}
	}
	public function transaksi()
	{
		if($_POST)
			{
				if( ! empty($_POST['kode_barang']))
				{
					$total = 0;
					foreach($_POST['nama_barang'] as $k)
					{
						if( ! empty($k)){ $total++; }
					}

					if($total > 0)
					{
						$this->load->library('form_validation');
						$this->form_validation->set_rules('pr_no','Nomor Nota','trim|required|max_length[40]|alpha_numeric|callback_cek_nota[nomor_nota]');
						$this->form_validation->set_rules('tgl_pr','tgl_pr','trim|required');
						
						$no = 0;
						foreach($_POST['kode_barang'] as $d)
						{
							if( ! empty($d))
							{
								$this->form_validation->set_rules('kode_barang['.$no.']','Kode Barang #'.($no + 1), 'trim|required|max_length[40]|callback_cek_kode_barang[kode_barang['.$no.']]');
								$this->form_validation->set_rules('jumlah_beli['.$no.']','Qty #'.($no + 1), 'trim|numeric|required|callback_cek_nol[jumlah_beli['.$no.']]');
							}

							$no++;
						}
						
						$this->form_validation->set_rules('cash','Total Bayar', 'trim|numeric|required|max_length[17]');
						$this->form_validation->set_rules('catatan','Catatan', 'trim|max_length[1000]');

						$this->form_validation->set_message('required', '%s harus diisi');
						$this->form_validation->set_message('cek_kode_barang', '%s tidak ditemukan');
						$this->form_validation->set_message('cek_nota', '%s sudah ada');
						$this->form_validation->set_message('cek_nol', '%s tidak boleh nol');
						$this->form_validation->set_message('alpha_numeric', '%s Harus huruf / angka !');

						if($this->form_validation->run() == TRUE)
						{
							$nomor_nota 	= $this->input->post('nomor_nota');
							$tanggal		= $this->input->post('tanggal');
							$id_kasir		= $this->input->post('id_kasir');
							$id_pelanggan	= $this->input->post('id_pelanggan');
							$bayar			= $this->input->post('cash');
							$grand_total	= $this->input->post('grand_total');
							$catatan		= $this->clean_tag_input($this->input->post('catatan'));

							if($bayar < $grand_total)
							{
								$this->query_error("Cash Kurang");
							}
							else
							{
								$this->load->model('m_penjualan_master');
								$master = $this->m_penjualan_master->insert_master($nomor_nota, $tanggal, $id_kasir, $id_pelanggan, $bayar, $grand_total, $catatan);
								if($master)
								{
									$id_master 	= $this->m_penjualan_master->get_id($nomor_nota)->row()->id_penjualan_m;
									$inserted	= 0;

									$this->load->model('m_penjualan_detail');
									$this->load->model('m_barang');

									$no_array	= 0;
									foreach($_POST['kode_barang'] as $k)
									{
										if( ! empty($k))
										{
											$kode_barang 	= $_POST['kode_barang'][$no_array];
											$jumlah_beli 	= $_POST['jumlah_beli'][$no_array];
											$harga_satuan 	= $_POST['harga_satuan'][$no_array];
											$sub_total 		= $_POST['sub_total'][$no_array];
											$id_barang		= $this->m_barang->get_id($kode_barang)->row()->id_barang;
											
											$insert_detail	= $this->m_penjualan_detail->insert_detail($id_master, $id_barang, $jumlah_beli, $harga_satuan, $sub_total);
											if($insert_detail)
											{
												$this->m_barang->update_stok($id_barang, $jumlah_beli);
												$inserted++;
											}
										}

										$no_array++;
									}

									if($inserted > 0)
									{
										echo json_encode(array('status' => 1, 'pesan' => "Transaksi berhasil disimpan !"));
									}
									else
									{
										$this->query_error();
									}
								}
								else
								{
									$this->query_error();
								}
							}
						}
						else
						{
							echo json_encode(array('status' => 0, 'pesan' => validation_errors("<font color='red'>- ","</font><br />")));
						}
					}
					else
					{
						$this->query_error("Harap masukan minimal 1 kode barang !");
					}
				}
				else
				{
					$this->query_error("Harap masukan minimal 1 kode barang !");
				}
			}
	}










	




}