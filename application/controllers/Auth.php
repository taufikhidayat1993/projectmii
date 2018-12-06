<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {
	public function index()
	{
		$this->load->view('login');
	}
	function __construct(){
  parent::__construct();
  $this->load->model('cek_login');
}
	 public function user_login()
 {
	   $username = $this->input->post('username');
      $password = $this->input->post('password');
	 $berhasil = $this->cek_login->login($username,$password);

  		$user=  $berhasil->row();
	  if($berhasil->num_rows() == 1){

		
 $newdata = array( 
 'user_id'=>$user->id_user,
                    'nama_lengkap'=>$user->nama_lengkap,
                   'username'  => $username,
                   'logged_in' => TRUE
               );
   $this->session->set_userdata($newdata);
   echo "1";
	 }else {
		 echo "0";
	 }
 }
 function logout(){
    $this->session->sess_destroy();
    redirect('auth');
 }
}
