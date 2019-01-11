<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bukti_jurnalumum extends CI_Controller {
  Public function __construct() { 
        parent::__construct(); 
    $this->load->helper('nominal');
   $this->load->helper('format_tanggal'); 
  }
  public function index() 
  {     
		$data   = array(
            'content'   => 'bukti_jurnalumum/bukti_jurnalumum'
        );
		$this->load->view('container', $data);
  }
  public function simpan(){
      $this->load->library('form_validation');                
        $this->form_validation->set_rules('jurnal_no', 'Nomor Jurnal', 'trim|required');    
        $this->form_validation->set_rules('date_jurnal', 'Tanggal Jurnal', 'trim|required');  
         if  ($this->form_validation->run()) {  
         $dataku2 = array (
                            'id_jurnal'   =>  $this->input->post('jurnal_no'),
                            'date_jurnal' => $this->input->post('date'),            
                            'description' => $this->input->post('description'),
                            'modidate'    =>  date('Y-m-d H:i:s'),
                            'modiby'      => $this->input->post('TotalSubtotalhidden')           
                            );
                        $this->db->insert('tb_detail_po',$dataku2);  
                 $no_array = 0;
           foreach($_POST['kode'] as $k)
                  {
                    if( ! empty($k))
                    {
                       $dataku = array (
                         'source_no' =>  $this->input->post('jurnal_no'),
                         'source'   => 'BJ',
                         'tanggal'   => $this->input->post('date'),
                         'kode_account' => $_POST['kode_akun'][$no_array], 
                         'keterangan'=>  $_POST['keterangan'],             
                         'debet' =>  $_POST['subtotal'][$no_array],
                         'modiby' => $this->session->userdata('user_id'),
                         'modidate' => date('Y-m-d H:i:s')
          );
        $this->db->insert('accjurnaldetail',$dataku); 
                    }
                    $no_array++;
                  }
         }
  }
  public function ajax_kode(){
    
      $keyword  = $this->input->post('keyword');
          $this->load->model('m_barang');
      $barang = $this->db->query("select * from account where nama_account like '%".$keyword."%' ");
      if($barang->num_rows() > 0)
      {
        $json['status']   = 1;
        $json['datanya']  = "<ul id='daftar-autocomplete'>";
        foreach($barang->result() as $b)
        {
          $json['datanya'] .= "
            <li>
              <span id='kodenya'>".$b->kode_account."</span>:
              <span id='barangnya'>".$b->nama_account."</span>
             
              
            </li>
          ";
        }
        $json['datanya'] .= "</ul>";
      }
      else
      {
        $json['status']   = "lllll";
      }

      echo json_encode($json);
    
  }
}