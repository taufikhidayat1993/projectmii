<?php
class M_barang extends CI_Model 
{
	
	

	function hapus_barang($id_barang)
	{
		$dt['dihapus'] = 'ya';
		return $this->db
				->where('id_barang', $id_barang)
				->update('pj_barang', $dt);
	}

	function tambah_baru($kode, $nama, $id_kategori_barang, $size, $id_merk_barang, $stok, $harga, $keterangan)
	{
		$dt = array(
			'kode_barang' => $kode,
			'nama_barang' => $nama,
			'total_stok' => $stok,
			'harga' => $harga,
			'id_kategori_barang' => $id_kategori_barang,
			'size' => $size,
			'id_merk_barang' => (empty($id_merk_barang)) ? NULL : $id_merk_barang,
			'keterangan' => $keterangan,
			'dihapus' => 'tidak'
		);

		return $this->db->insert('pj_barang', $dt);
	}

	function cek_kode($kode)
	{
		return $this->db
			->select('id_barang')
			->where('kode_barang', $kode)
			->where('dihapus', 'tidak')
			->limit(1)
			->get('pj_barang');
	}

	function get_baris($id_barang)
	{
		return $this->db
			->select('id_barang, kode_barang, nama_barang, size, total_stok, harga, id_kategori_barang, id_merk_barang, keterangan')
			->where('id_barang', $id_barang)
			->limit(1)
			->get('pj_barang');
	}

	function update_barang($id_barang, $kode_barang, $nama, $id_kategori_barang, $size, $id_merk_barang, $stok, $harga, $keterangan)
	{
		$dt = array(
			'kode_barang' => $kode_barang,
			'nama_barang' => $nama,
			'total_stok' => $stok,
			'harga' => $harga,
			'size' => $size,
			'id_kategori_barang' => $id_kategori_barang,
			'id_merk_barang' => (empty($id_merk_barang)) ? NULL : $id_merk_barang,
			'keterangan' => $keterangan
		);

		return $this->db
			->where('id_barang', $id_barang)
			->update('pj_barang', $dt);
	}

	function cari_kode($keyword, $registered)
	{
		$not_in = '';

		$koma = explode(',', $registered);
		if(count($koma) > 1)
		{
			$not_in .= " AND `kode_barang` NOT IN (";
			foreach($koma as $k)
			{
				$not_in .= " '".$k."', ";
			}
			$not_in = rtrim(trim($not_in), ',');
			$not_in = $not_in.")";
		}
		if(count($koma) == 1)
		{
			$not_in .= " AND `kode_barang` != '".$registered."' ";
		}

		$sql = "
			SELECT 
				`kode_barang`, `nama_barang`,`satuan`,`nama_satuan`,harga_jual
			FROM 
				tb_barang left join tb_barang_satuan on tb_barang.satuan=tb_barang_satuan.id_satuan
			WHERE 
				 ( 
					`kode_barang` LIKE '%".$this->db->escape_like_str($keyword)."%' 
					OR `nama_barang` LIKE '%".$this->db->escape_like_str($keyword)."%' 
				) 
				".$not_in." 
		";

		return $this->db->query($sql);
	}

	function get_stok($kode)
	{
		return $this->db
			->select('nama_barang, total_stok')
			->where('kode_barang', $kode)
			->limit(1)
			->get('pj_barang');
	}

	function get_id($kode_barang)
	{
		return $this->db
			->select('id_barang, nama_barang')
			->where('kode_barang', $kode_barang)
			->limit(1)
			->get('pj_barang');
	}

	function update_stok($id_barang, $jumlah_beli)
	{
		$sql = "
			UPDATE `pj_barang` SET `total_stok` = `total_stok` - ".$jumlah_beli." WHERE `id_barang` = '".$id_barang."'
		";

		return $this->db->query($sql);
	}
}