<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Purchases extends CI_Controller {
   	Public function __construct() { 
        parent::__construct(); 
          $this->load->model('mdata', '', TRUE);
        $this->load->model('Mastermodel');
		 $this->load->model('Purchaserequest');
           $this->load->helper(array('form', 'url'));
	} 
	public function purchase_request()
	{
        $data   = array(
            'content'   => 'purchase_request'
        );
		$this->load->view('container', $data);
	}
	public function purchase_order(){
		$data   = array(
            'content'   => 'purchase_order/purchase_order'
        );
		$this->load->view('container', $data);
	}
	
    	public function purchase_request_add()
	{
  $this->load->library('breadcrumb');
  $this->breadcrumb->add('Purchases','')
            ->add('Purchases Request','purchase_request')
            ->add('Add New Purchase Request','purchase_request/purchase_request_add');
        $data   = array(
            'content'   => 'purchases/purchase_request_add'
        );
		$data['user'] =$this->Mastermodel->satuan()->result();
		 $data['kodeunik'] = $this->Purchaserequest->buat_kode();
		$this->load->view('container',$data);
	
	}
	  	public function purchase_request_simpan()
	{
		
$data = array ('success' => false, 'messages' => array());
if( ! empty($_POST['kode_barang']))
				{
					$total = 0;
					foreach($_POST['kode_barang'] as $k)
					{
						if( ! empty($k)){ $total++; }
					}

					if($total > 0)
					{
		$this->load->library('form_validation');				
		$this->form_validation->set_rules('pr_no', 'No PR', 'trim|required');
	    $this->form_validation->set_rules('tgl_pr', 'PR DATE', 'trim|required');			
		$this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
		if($this->form_validation->run()) {		
				$data = array (
					  'kode_pr' => $_POST['pr_no'],
					  'tgl_pr' => $this->input->post('tgl_pr'),
					  'keterangan' => $this->input->post('keterangan'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' => $this->session->userdata('user_id')					  
					);
				$this->mdata->insert_all('request_order',$data);
			$kode_pr=$_POST['pr_no'];
		
				$no_array	= 0;
									foreach($_POST['kode_barang'] as $k)
									{
										if( ! empty($k))
										{
										  $data = array (
					  'kode_pr' =>  $kode_pr,
					   'kode_barang' => $_POST['kode'][$no_array],
					  'nama_barang' => $_POST['kode_barang'][$no_array],					  
					  'satuan' =>  $_POST['satuan'][$no_array],
  'qty' => $_POST['jumlah_beli'][$no_array]					  
					);
				$this->mdata->insert_all('detail_request_order',$data);
                       
										}
										$no_array++;
									}
									$data['success'] = true;
		} else {
			foreach ($_POST as $key => $value) {
			 	$data['messages'][$key] = form_error($key);
			}		
		}
		echo json_encode($data);
					}
				}else{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('kode_barang', 'Nama Barang', 'trim|required');
					}
				
}
    public function payment()
	{
        $data   = array(
            'content'   => 'payment'
        );
		$this->load->view('container', $data);
	}
    
    public function survey_result(){
        $data   = array(
            'content'   => 'survey_result'
        );
		$this->load->view('container', $data);
    }
    
    public function surveyDetail($id){
        $data   = array(
            'content'   => 'surveyOrderDetail',
            'survey'    => $this->db->query("SELECT * FROM survey_order JOIN user ON survey_order.user_id = user.user_id JOIN sub_service ON sub_service.sub_service_id = survey_order.sub_service_id WHERE survey_order_id = ".$id."")->row(),
            'image'     => $this->db->query("SELECT * FROM order_image WHERE survey_order_id = ".$id."")->result()
        );
		$this->load->view('container', $data);
    }
    
    public function setStatus(){
        $id = $this->input->post('ID');
        $this->db->where('survey_order_id', $id);
        $this->db->update('survey_order', array('survey_order_status' => $this->input->post('STATUS')));
        echo ($this->db->affected_rows() > 0) ? 'success' : 'failed';
    }
      public function  purchase_request_detail_pr() {
   $iparr = explode (",",$this->input->post('kode_pr') ); 
		  
		$kode=$iparr[0];
        $data=$this->Purchaserequest->detail_pr($kode);
        echo json_encode($data);
	}
    public function repairDetail($id){
        $data   = array(
            'content'   => 'survey_detail',
            'survey'    => $this->db->query("SELECT * FROM repair_order JOIN survey_order ON repair_order.survey_order_id = survey_order.survey_order_id JOIN user ON survey_order.user_id = user.user_id JOIN sub_service ON sub_service.sub_service_id = survey_order.sub_service_id JOIN coordinator WHERE repair_order_id = ".$id."")->row(),
            'image'     => $this->db->query("SELECT * FROM order_image WHERE survey_order_id = ".$id."")->result()
        );
		$this->load->view('container', $data);
    }
    
    public function update(){
        $id_survey  = $this->input->post('id_survey');
        $id         = $this->input->post('id');
        $data   = array(
            'schedule'              => $this->input->post('schedule'),
            'repair_order_status'   => 1,
            'repair_cost'           => $this->input->post('repair_cost')
        );
        
        $this->db->where('repair_order_id', $id);
        $this->db->update('repair_order', $data);
        
        if($this->db->affected_rows() > 0){
            $this->db->where('survey_order_id', $id_survey);
            $this->db->update('survey_order', array('survey_order_status' => 3));
            
            echo ($this->db->affected_rows() > 0) ? 'success' : 'failed';
        } else {
            echo 'failed';
        }
    }
}
