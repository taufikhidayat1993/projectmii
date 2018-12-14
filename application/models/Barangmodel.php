<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Barangmodel extends CI_Model 
{
    function __construct() {
        parent::__construct();  // call model constructor    
    }
    var $table = 'tb_barang'; 
 
    var $order = array('nama_barang' => 'asc');
    public function get_datatables($name_barang)
    {
        $this->_get_datatables_query($name_barang);       
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);        
        $query = $this->db->get();
        return $query->result();
    }
    public function count_filtered($name_barang)
    {
        $this->_get_datatables_query($name_barang);       
        $query = $this->db->get();       
        return $query->num_rows();
    }
    public function count_all()
    {
        $this->db->from($this->table);        
        return $this->db->count_all_results();
    }
    private function _get_datatables_query($name_barang)
    {
        $this->db
             ->select('kode_barang, id_barang, nama_barang,tb_barang_satuan.nama_satuan,nama_account')
             ->from($this->table)
             ->join('tb_barang_satuan', 'tb_barang_satuan.id_satuan=tb_barang.satuan','left')
					 ->join('account', 'account.kode_account=tb_barang.kode_account','left');
      
    if($name_barang!='') // To process our custom input parameter
    {
            $this->db->where('nama_barang like "%'.$name_barang.'%"');
    }
   
    }
     function get_id_barang($id_barang)
       {
    return $this->db
      ->select('a.kode_barang, a.id_barang, a.nama_barang,b.nama_satuan')
      ->where('id_barang', $id_barang)
      ->limit(1)
      ->get('barang');
     }
    function buat_kode()   {
          $this->db->select('RIGHT(kode_barang,4) as kode', FALSE);     
         $this->db->order_by('kode_barang','DESC');
          $this->db->limit(1);     
          $query = $this->db->get('tb_barang');     
          //cek dulu apakah ada sudah ada kode di tabel.    
          if($query->num_rows() <> 0){      
           //jika kode ternyata sudah ada.      
           $data = $query->row();      
           $kode = intval($data->kode) + 1;    
          }
          else {      
           //jika kode belum ada      
           $kode = 1;    
          }
          $kodemax = str_pad($kode, 4, "0", STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
          $kodejadi = 'C'.$kodemax;    // S0001
          return $kodejadi;  
    }
function insert_all($table,$data) {
    $this->db->insert($table,$data);
}
function update_pelanggan($id_pelanggan, $nama, $alamat, $telepon, $info)
  {
    $dt = array(
      'nama' => $nama,
      'alamat' => $alamat,
      'telp' => $telepon,
      'info_tambahan' => $info
    );

    return $this->db
      ->where('id_pelanggan', $id_pelanggan)
      ->update('pj_pelanggan', $dt);
  }
  function update_barang($id_barang, $nama, $alamat, $telepon, $deskripsi,$email)
  {
    $dt = array(
      'nama_barang' => $nama,
      'alamat' => $alamat,
      'telepon' => $telepon,
      'deskripsi' => $deskripsi,
      'email'=>$email
    );

    return $this->db
      ->where('id_barang', $id_barang)
      ->update('tb_barang', $dt);
  }
function hapus_barang($id_barang)
  {
    return $this->db
        ->where('id_barang', $id_barang)
        ->delete('tb_barang');
  }
}

?>