<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Accountmodel extends CI_Model 
{

    function __construct() {
        parent::__construct();  // call model constructor    
    }
    var $table = 'account'; 
    var $order = array('nama_account' => 'asc');//specify the columns you want to fetch from table
    public function get_datatables($nama_account,$header)
    {
        $this->_get_datatables_query($nama_account,$header);       
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);        
        $query = $this->db->get();
        return $query->result();
    }
    public function count_filtered($nama_account,$header)
    {
        $this->_get_datatables_query($nama_account,$header);       
        $query = $this->db->get();       
        return $query->num_rows();
    }
    public function count_all()
    {
        $this->db->from($this->table);        
        return $this->db->count_all_results();
    }
    private function _get_datatables_query($nama_account,$header)
    {
        $this->db
             ->select('kode_account,nama_account,tipe,accheader.nama_header')
             ->from($this->table)
             ->join('accheader', 'accheader.kode_header=account.kode_header','left');
			
    if($nama_account!='') // To process our custom input parameter
    {
            $this->db->where('nama_account like "%'.$nama_account.'%"');
    }
    if($header!='') // To process our custom input parameter
    {
            $this->db->where('account.kode_header ="'.$header.'"');
    }
    }
     function get_id_account($id_account)
       {
    return $this->db
      ->select('*')
      ->where('kode_account', $id_account)

      ->limit(1)
      ->get('account');
     }
    function buat_kode()   {
          $this->db->select('RIGHT(kode_account,4) as kode', FALSE);     
         $this->db->order_by('kode_account','DESC');
          $this->db->limit(1);     
          $query = $this->db->get('tb_supplier');     
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
          $kodejadi = 'S'.$kodemax;    // S0001
          return $kodejadi;  
    }
function insert_all($table,$data) {
    $this->db->insert($table,$data);
}

  function update_account($kode_header,$kode_account,$nama_account,$tipe)
  {
    $dt = array(
      'nama_account' => $nama_account,
      'kode_account' => $kode_account,
      'tipe' => $tipe,
      'kode_header' => $kode_header
    );
    return $this->db
      ->where('kode_account', $kode_account)
      ->update('account', $dt);
  }
function hapus_account($id_account)
  {
    return $this->db
        ->where('kode_account', $id_account)
        ->delete('account');
  }
}

?>