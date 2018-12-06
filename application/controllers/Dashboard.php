<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {
		function __construct(){
  parent::__construct();

}
	public function index()
	{
        $data   = array(
            'content'   => 'dashboard'
        );	
		$this->load->view('container', $data);		
	}
		public function orderanbaru()
	{
		$where =4;
			$data['user'] = $this->orderan_baru->vieworder($where)->result();
				$this->load->view('orderan_baru',$data);
	}
		public function paymentbaru()
	{
		$where =1;
			$data['user'] = $this->orderan_baru->vieworder($where)->result();
				$this->load->view('orderan_baru',$data);
	}
		public function notiforder()
	{
			$where =4;
		$data = $this->orderan_baru->vieworder($where);
		echo $data->num_rows();
		
	}
	public function notifpayment()
	{
			$where =1;
		$data = $this->orderan_baru->vieworder($where);
		echo $data->num_rows();
		
	}
}
