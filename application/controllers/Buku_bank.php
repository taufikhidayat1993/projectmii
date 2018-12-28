<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Buku_bank extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
     
      $this->load->helper(array('form', 'url'));
        $this->load->helper('format_tanggal'); 
  }
  public function index() 
  {
  	$data=array(
          'content' =>  'buku_bank/buku_bank',
          'list_bank'=> $this->db->query("select * from account where kas=1")->result()
  	);
  	  $this->load->view('container', $data);
  }
  public function list_bukubank() 
  {
$bank=$this->input->post('account');
$dari=shortdate_uki($this->input->post('from'));
$sampai=shortdate_uki($this->input->post('to'));
  $data=array(
         'list_bukubank'=> $this->db->query("select a.*,b.nama_source from accjurnaldetail a left join accsource b on a.source=b.kode_source where a.kode_account='".$bank."' and a.tanggal between  '".$dari."' and '".$sampai."' order by tanggal asc")->result(),
         'saldo'  =>$this->db->query("select ifnull(sum(debet-kredit),0) as saldo from accjurnaldetail where kode_account='".$bank."' and tanggal < '".$dari."'")->row()
    );
      $this->load->view('buku_bank/list_bukubank', $data);
  }
}