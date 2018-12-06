<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Costumermodel extends CI_Model 
{
    function __construct() {
        parent::__construct();  // call model constructor    
    }
    var $table = 'tb_costumer'; 

    var $select = array('kode_costumer','id_costumer','nama_costumer','alamat','email','telepon'); 
    var $order = array('nama_costumer' => 'asc');//specify the columns you want to fetch from table
 // var $column_order = array('no_faktur','tgl_beli','nama_kasir','tb_pembelian.timestmp'); //set column field database for datatable orderable
//  var $column_search = array('no_faktur','tgl_beli','nama_kasir','tb_pembelian.timestmp'); //set column field database for datatable searchable
     // default order

    public function get_datatables($name_costumer)
    {
        $this->_get_datatables_query($name_costumer);       
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);        
        $query = $this->db->get();
        return $query->result();
    }
    public function count_filtered($name_costumer)
    {
        $this->_get_datatables_query($name_costumer);       
        $query = $this->db->get();       
        return $query->num_rows();
    }
    public function count_all()
    {
        $this->db->from($this->table);        
        return $this->db->count_all_results();
    }
    private function _get_datatables_query($name_costumer)
    {
        $this->db
             ->select($this->select)
             ->from($this->table);
      
    if($name_costumer!='') // To process our custom input parameter
    {
            $this->db->where('nama_costumer like "%'.$name_costumer.'%"');
    }
   
    }
     function get_id_costumer($id_costumer)
       {
    return $this->db
      ->select('kode_costumer, id_costumer, nama_costumer, alamat, email, telepon,deskripsi')
      ->where('id_costumer', $id_costumer)
      ->limit(1)
      ->get('tb_costumer');
     }
    function buat_kode()   {
          $this->db->select('RIGHT(kode_costumer,4) as kode', FALSE);     
         $this->db->order_by('kode_costumer','DESC');
          $this->db->limit(1);     
          $query = $this->db->get('tb_costumer');     
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
  function update_costumer($id_costumer, $nama, $alamat, $telepon, $deskripsi,$email)
  {
    $dt = array(
      'nama_costumer' => $nama,
      'alamat' => $alamat,
      'telepon' => $telepon,
      'deskripsi' => $deskripsi,
      'email'=>$email
    );

    return $this->db
      ->where('id_costumer', $id_costumer)
      ->update('tb_costumer', $dt);
  }
function hapus_costumer($id_costumer)
  {
    return $this->db
        ->where('id_costumer', $id_costumer)
        ->delete('tb_costumer');
  }
}

?>