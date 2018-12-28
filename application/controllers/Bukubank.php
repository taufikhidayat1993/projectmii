<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Buku_bank extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('accountmodel','', TRUE);
         $this->load->model('headermodel');
      $this->load->helper(array('form', 'url'));
  }
  public function index() 
  {
  	$data=array(
          'content' =>  'buku_bank/buku_bank',          
          'list_bank'=> $this->db->query("select * from account ")->result()
  	);
  	  $this->load->view('container', $data);
  }
}