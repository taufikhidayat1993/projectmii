<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Barang extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('barangmodel','', TRUE);
        $this->load->helper(array('form', 'url'));
         $this->load->helper('format_tanggal'); 
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'barang/barang_data'
     );
    $this->load->view('container', $data);
  }
  public function server_side() { 
        $nama_barang = $this->input->post('name_barang');
        $posts = $this->barangmodel->get_datatables($nama_barang); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {            
            $no++;
            $row = array();
            $row[] = $post->kode_barang;          
            $row[] = $post->nama_barang;
            $row[] = $post->nama_satuan;
            $row[] = $post->nama_account;
            $row[] = $post->jml_stok;
            $row[] = "
                                                            <div class='actions'>
                                                                <div class='btn-group'>
                                                                            <a class='btn green-haze btn-outline btn-circle btn-sm' href='javascript:;' data-toggle='dropdown'>
                                                                                <i class='fa  fa-cogs'></i> Action
                                                                                <i class='fa fa-angle-down'></i>
                                                                            </a>
                                                                            <ul class='dropdown-menu pull-right'>
                                                                                <li>
                                                                                    <a href='".site_url('barang/barang_edit/'.$post->id_barang)."' id='Editbarang'>
                                                                                        <i class='fa fa-pencil'></i> Edit </a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href='".site_url('barang/hapus/'.$post->id_barang)."' id='hapusbarang'>
                                                                                        <i class='fa fa-trash-o'></i> Delete </a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href='".site_url('barang/list_stok/'.$post->kode_barang)."' id='Liststok'>
                                                                                        <i class='fa fa-list-alt'></i> Hostory Stok</a>
                                                                                </li>
                                                                               
                                                                            </ul>
                                                                        </div>
                                                                      </div>
         ";
            $data[] = $row;
        }        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->barangmodel->count_all(),
            "recordsFiltered" => $this->barangmodel->count_filtered($nama_barang),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  

}
public function tambah_barang() { 
    $this->load->view('barang/barang_add');
    }

public function barang_edit_data($id_barang = NULL)
  {
     if( ! empty($id_barang))
    {
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_barang', 'Nama barang', 'trim|required');
        $this->form_validation->set_rules('no_telp', 'No Telp', 'trim|required|numeric|max_length[40]');         
        $this->form_validation->set_rules('alamat', 'Alamat', 'trim|required');        

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run() == TRUE)
            {

              $nama      = $this->input->post('nama_barang');
              $alamat    = $this->input->post('alamat');
              $telepon   = $this->input->post('no_telp');
              $email     = $this->input->post('email');
              $deskripsi = $this->input->post('deskripsi');
              $update    = $this->barangmodel->update_barang($id_barang, $nama, $alamat, $telepon, $deskripsi,$email);
               $data['success'] = true;
            }
            else
            {
               foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
            }
                echo json_encode($data);
              }

  }
public function barang_edit($id_barang = NULL)
  {
    if( ! empty($id_barang))
    {    
            $dt['barang'] = $this->barangmodel->get_id_barang($id_barang)->row();
            $this->load->view('barang/barang_edit', $dt);
      }
    }
  public function list_stok($id_barang = NULL)
  {
    if( ! empty($id_barang))
    {    
        $dt['kode'] = $id_barang;
        $this->load->view('barang/list_stok',$dt);
    }
  }
   public function list_stokbarang()
  {
        $kode_barang=$this->input->post('kode_barang');
        $dari=shortdate_uki($this->input->post('from'));
        $sampai=shortdate_uki($this->input->post('to'));
        
        $data = array(
                  'list' =>$this->db->query("SELECT * FROM (
SELECT 0 AS ROWNUMBER, '' AS TRANS_ID, '' AS TRANS_DATE, 'SALDO AWAL' AS TRANS_DESCRIPTION, 0 AS QTY_IN, 0 AS QTY_OUT, 
ifnull(SUM(QUANTITY),0) AS QTY_BALANCE
FROM TABLE_STOCK A 
INNER JOIN tb_barang B ON A.kode_barang = B.kode_barang
INNER JOIN accjurnaldetail C ON A.source_no = C.source_no
WHERE a.kode_barang='$kode_barang' AND A.tanggal < '$dari'
UNION ALL
SELECT 1 AS ROWNUMBER, C.source_no, A.tanggal, C.keterangan AS TRANS_DESCRIPTION, 
SUM(CASE WHEN A.TRANS_TYPE='IN' THEN A.QUANTITY ELSE 0 END) AS QTY_IN, 
SUM(CASE WHEN A.TRANS_TYPE='OUT' THEN A.QUANTITY*-1 ELSE 0 END) AS QTY_OUT, 
SUM(QUANTITY) AS QTY_BALANCE
FROM TABLE_STOCK A 
INNER JOIN tb_barang B ON A.kode_barang = B.kode_barang
INNER JOIN accjurnaldetail C ON A.source_no = C.source_no
WHERE a.kode_barang='$kode_barang' AND a.tanggal BETWEEN '$dari' AND '$sampai'
GROUP BY C.source_no, A.tanggal
) A
ORDER BY ROWNUMBER, TRANS_DATE")->result()
                );
                 
        $this->load->view('barang/data_stok',$data);    
  }
public function add_barang(){
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_barang', 'Nama barang', 'trim|required');
        $this->form_validation->set_rules('no_telp', 'No Telp', 'trim|required|numeric|max_length[40]');         
        $this->form_validation->set_rules('alamat', 'Alamat', 'trim|required');        

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run()) { 
           
             $data = array (
                      'kode_barang'  =>$this->barangmodel->buat_kode(),
                      'nama_barang' => $this->input->post('nama_barang'),
                      'telepon' => $this->input->post('no_telp'),
                      'alamat' => $this->input->post('alamat'),
                      'email' => $this->input->post('email'),
                      'deskripsi' => $this->input->post('deskripsi'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' =>  $this->session->userdata('user_id')                  
             );
            $this->barangmodel->insert_all('tb_barang',$data);
            $data['success'] = true;
    }else{

                    foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
         }
         echo json_encode($data);
}
  
  public function hapus($id_barang)
  { 
        $hapus = $this->barangmodel->hapus_barang($id_barang);
        if($hapus)
        {
          echo json_encode(array(
            "pesan" => "<font color='green'><i class='fa fa-check'></i> Data berhasil dihapus !</font>
          "));
        }
        else
        {
          echo json_encode(array(
            "pesan" => "<font color='red'><i class='fa fa-warning'></i> Terjadi kesalahan, coba lagi !</font>
          "));
        }
      
  }
}