<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Purchase_order extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
    $this->load->model('M_Purchaseorder');
     $this->load->model('Mastermodel');
    $this->load->helper('nominal');
  }
  public function index() 
  {     
		$data   = array(
            'content'   => 'purchase_order/purchase_order'
        );
		$this->load->view('container', $data);
  }
   public function add() 
  {     
     $this->load->library('breadcrumb');
       $this->breadcrumb->add('Purchase','')
            ->add('Purchases Order','purchase_order')
            ->add('Add New Purchase Order','purchase_order/add');
    $data   = array(
            'content'   => 'purchase_order/purchase_order_add',
            'account'  =>$this->db->query("select * from account where kode_header='1-100'")->result()
        );
      $data['user'] =$this->Mastermodel->satuan()->result();
    $this->load->view('container', $data);
  }
    public function list_request() 
  {
    $data['list'] = $this->M_Purchaseorder->list_request()->result();
    $this->load->view('purchase_order/list_request',$data);
  }
     public function get_request($no_request) 
  {
 $data['list'] = $this->M_Purchaseorder->detail_request($no_request);
    $this->load->view('purchase_order/data_request',$data);
  }
   public function cari_vendor() 
  {
       $list = array();
$query=$this->db->query("select * from tb_supplier where nama_vendor  like '%$_GET[search]%' or kode_vendor like '%$_GET[search]%'");
 $posts = $query->result(); 
  if ($query->num_rows() > 0) {
  $key=0;
  foreach ($posts as $post) {
$list[$key]['id'] = $post->kode_vendor;
$list[$key]['text'] = $post->nama_vendor;
$key++;
  }
   echo json_encode($list);
  
}else{

       echo "hasil kosong";
}
}
  public function server_side() 
  {  
        $from = $this->input->post('from');
        $to = $this->input->post('to');

        if($from!='' && $to!='')
        {
            $from = date('Y-m-d',strtotime($from));
            $to = date('Y-m-d',strtotime($to));
        }

       
        $posts = $this->M_Purchaseorder->get_datatables($from,$to); 

        $data = array();
        $no = $this->input->post('start');
       
               {{

               }
            
            $no++;
            $row = array();
            $row[] = $post->tgl_po;
            $row[] = $post->kode_po;          
            $row[] = $post->kode_pr;
            $row[] = $post->nama_vendor;
          
            $row[] = nominal($post->total_po);
             $row[] = "-";
            $data[] = $row;
        }
        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->M_Purchaseorder->count_all(),
            "recordsFiltered" => $this->M_Purchaseorder->count_filtered($from,$to),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  }

  public function simpan_po(){
      $this->load->library('form_validation');                
        $this->form_validation->set_rules('no_po', 'Nomor Po', 'trim|required');    
        $this->form_validation->set_rules('vendor', 'Nama Vendor', 'trim|required');  
         $this->form_validation->set_rules('TotalSubtotalhidden', 'Nama Barang', 'trim|required');      
        $this->form_validation->set_error_delimiters('<span class="help-block help-block-error"><span class="text-danger">', '</spa></span>');
              $this->form_validation->set_message('required','%s harus diisi !');

              if($this->form_validation->run()) { 
                      $data['success'] = true;
              }else{
                 foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
              }
               echo json_encode($data);
  }




}