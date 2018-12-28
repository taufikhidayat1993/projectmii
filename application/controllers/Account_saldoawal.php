<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account_saldoawal extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('Account_saldoawalmodel','', TRUE);
         $this->load->model('headermodel');
      $this->load->helper(array('form', 'url'));
      $this->load->helper('format_tanggal'); 
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'account_saldoawal/account_saldoawal',
            'account'   => $this->db->query("select a.*,b.nama_header from account a left join accheader b on a.kode_header=b.kode_header order by a.kode_account asc")->result()
        );
    $data['user'] = $this->headermodel->satuan()->result();
    $this->load->view('container', $data);
  }

public function add_account() { 
  $data['list'] = $this->headermodel->satuan()->result();
    $this->load->view('account/account_add',$data);
    }


public function edit($kode_account = NULL)
  {
    if( ! empty($kode_account))
    {    
            $dt['account'] = $this->Account_saldoawalmodel->get_id_account($kode_account)->row();
             $dt['list'] = $this->headermodel->satuan()->result();
            $this->load->view('account/account_edit', $dt);
      }
    }
  
public function simpan(){
   $no_array = 0;
           foreach($_POST['saldoawal'] as $k)
                  {
           if( ! empty($k))
                    {  
if( $_POST['saldoawal'][$no_array] > 0){
   $tgl=shortdate_uki($_POST['periode'][$no_array]);   
$row= $this->db->query("select * from  accjurnaldetail where kode_account ='".$_POST['kode_account'][$no_array]."' and source='SA'");
if($row->num_rows() == 0){
 $in_jurnal1 = array (
            'tanggal'   =>  $tgl,
            'kode_account' => $_POST['kode_account'][$no_array], 
            'source'=>   'SA',     
            'debet'=>  $_POST['saldoawal'][$no_array],         
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
             );
 $this->db->insert('accjurnaldetail',$in_jurnal1); 
}else{
 $in_jurnal = array (
            'tanggal'   =>  $tgl,
            'kode_account' => $_POST['kode_account'][$no_array], 
            'source'=>   'SA',     
            'debet'=>  $_POST['saldoawal'][$no_array],         
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
             );
   $this->db->where('kode_account',$_POST['kode_account'][$no_array]); 
    $this->db->where('source','SA'); 
   $this->db->update('accjurnaldetail',$in_jurnal); 

$update_saldo = array (
            'periode_tanggal'   =>  $tgl,
            'saldo_awal'=>  $_POST['saldoawal'][$no_array]
             );
$this->db->where('kode_account',$_POST['kode_account'][$no_array]); 
 $this->db->update('account',$update_saldo); 
}
}
        
                    }
                    $no_array++;
                  }
}
  
  public function hapus($id_account)
  { 
        $hapus = $this->Account_saldoawalmodel->hapus_account($id_account);
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