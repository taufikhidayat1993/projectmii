<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Purchase_order extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
    $this->load->model('M_Purchaseorder');
     $this->load->model('Mastermodel');
    $this->load->helper('nominal');
   $this->load->helper('format_tanggal'); 
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
            'account'  =>$this->db->query("select * from account where kode_account='2-110'")->result(),
            'kode_po'  =>  $this->M_Purchaseorder->buat_kode()
        );

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
public function purchase_order_simpan(){

         $this->load->library('form_validation');                
        $this->form_validation->set_rules('no_po', 'Nomor Po', 'trim|required');    
        $this->form_validation->set_rules('vendor', 'Nama Vendor', 'trim|required');  
        $this->form_validation->set_rules('TotalSubtotalhidden', 'Nama Barang', 'trim|required');      
        $this->form_validation->set_error_delimiters('<span class="help-block help-block-error"><span class="text-danger">', '</spa></span>');
        $this->form_validation->set_message('required','%s harus diisi !');
        $tgl_po=shortdate_uki($this->input->post('tanggal_po'));


        
         
      if($this->input->post('ppn2') >0){
$cek=1;
} else {
$cek=0;
}
        $no_po=no_po($this->input->post('no_po'),$this->input->post('tanggal_po'));
              if  ($this->form_validation->run()) {                    
                $data = array (
            'kode_pr' => $this->input->post('no_request'),
            'kode_po' => $no_po,
            'no_po'   => $this->input->post('no_po'),
            'tgl_po'  => $tgl_po,
           // 'tunai'   => $this->input->post('val_tunai'),
           // 'uang_muka' =>$this->input->post('uang_muka'),
            'kode_vendor' =>$this->input->post('vendor'),
            'keterangan' =>$this->input->post('keterangan'),
            'ppn' =>$cek,
            'total_ppn' =>$this->input->post('ppn2'),
            'modiby'  =>$this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s'),
            'total_po' =>  $this->input->post('TotalSubtotalhidden')     
                );
        $this->db->insert('tb_po',$data);
/*
              $inputakunkredit = array (
            'source_no' =>  $no_po,
            'tanggal'   => $tgl_po,
            'kode_account' => $_POST['kas_bayar'], 
            'keterangan'=>  $_POST['keterangan'],         
            'kredit' =>  $_POST['TotalSubtotalhidden'],
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
          );
        $this->db->insert('accjurnaldetail',$inputakunkredit); 

        //input ppn

        if($this->input->post('ppn')>0){
 $inputakunppn1 = array (
            'source_no' =>  $no_po,
            'tanggal'   => $tgl_po,
            'kode_account' => '2-130',            
            'debet' =>  $_POST['ppn'],
            'keterangan'=> $_POST['keterangan'],  
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
          );
        $this->db->insert('accjurnaldetail',$inputakunppn1); 
         $inputakunppn2 = array (
            'source_no' =>  $no_po,
            'tanggal'   => $tgl_po,
            'kode_account'=> $_POST['kas_bayar'],            
            'kredit' =>  $_POST['ppn'],
            'keterangan'=> $_POST['keterangan'],  
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
          );
        $this->db->insert('accjurnaldetail',$inputakunppn2); 

        }
        */
            $no_array = 0;
           foreach($_POST['kode'] as $k)
                  {
                    if( ! empty($k))
                    {
                      /*
              $dataku1 = array (
            'source_no' =>  $no_po,
            'tanggal'   => $tgl_po,
            'kode_account' => $_POST['account'][$no_array], 
            'keterangan'=>  $_POST['keterangan'],             
            'debet' =>  $_POST['subtotal'][$no_array],
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
          );
        $this->db->insert('accjurnaldetail',$dataku1); 



 Select b.nama_account, a.source_no, a.kode_account, sum(a.debet) as debet
From accjurnaldetail a
Inner join  account b on a.kode_account = b.kode_account
Group by b.nama_account, a.source_no, a.kode_account
Order by b.nama_account, a.source_no, a.kode_account
*/
         $dataku2 = array (
            'kode_po' =>  $no_po,
            'kode_barang' => $_POST['kode'][$no_array],            
            'satuan' =>  $_POST['satuan'][$no_array],
            'qty' => $_POST['jumlah_order'][$no_array],
            'harga'=>$_POST['harga'][$no_array]           
          );
        $this->db->insert('tb_detail_po',$dataku2);
                   }                        
                    $no_array++;
                  }     

                                
                      $data['success'] = true;
              }else{

                   
                 foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
              }
               echo json_encode($data);
         
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
       
           foreach ($posts as $post) 
        {   
            
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

 




}