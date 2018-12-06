<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Serverajax extends CI_Controller {
		Public function __construct() { 
        parent::__construct(); 
         
        $this->load->model('Purchaserequest');
         
	} 
	public function purchase_request()
	{
		$from = $this->input->post('from');
        $to = $this->input->post('to');

        if($from!='' && $to!='')
        {
            $from = date('Y-m-d',strtotime($from));
            $to = date('Y-m-d',strtotime($to));
        }

        $posts = $this->Purchaserequest->get_datatables($from,$to); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {
            
            $no++;
            $row = array();
            $row[] = $post->kode_pr;
          
            $row[] = $post->tgl_pr;
			  $row[] = $post->nama_lengkap;
            $row[] = date('d/m/Y h:i:s',strtotime($post->modidate));
            $row[] = $post->kode_pr;
            $data[] = $row;
        }
        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->Purchaserequest->count_all(),
            "recordsFiltered" => $this->Purchaserequest->count_filtered($from,$to),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
	}

}

?>