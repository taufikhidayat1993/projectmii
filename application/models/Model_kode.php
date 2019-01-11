<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_kode extends CI_Model 
{
    function __construct() {
        parent::__construct();  // call model constructor    
    }

    public function kode_belakang()   {
		  $this->db->select('RIGHT(no_pi,3) as kode', FALSE);
		  $this->db->where('YEAR(tgl_pi)', date('Y'));
		  $this->db->limit(1);    
          $this->db->order_by("no_pi", "desc"); 
		  $query = $this->db->get('tb_pi'); 

		  //cek dulu apakah ada sudah ada kode di tabel.    
		  if($query->num_rows() <> 0){       
		   $data = $query->row();      
		   $kode = intval($data->kode) + 1;    
		  }
		  else {      
		   $kode = 1;    
		  }
		  $kodemax = str_pad($kode,3,"0",STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
		  return $kodemax;  
	}
}