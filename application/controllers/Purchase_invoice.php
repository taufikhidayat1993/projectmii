<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Purchase_invoice extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
    $this->load->model('M_Purchaseinvoice');
     $this->load->model('Mastermodel');
    $this->load->helper('nominal');
   $this->load->helper('format_tanggal'); 
  }
  public function index() 
  {     
		$data   = array(
            'content'   => 'purchase_invoice/purchase_invoice'
        );
		$this->load->view('container', $data);
  }
   public function add() 
  {     
     $this->load->library('breadcrumb');
       $this->breadcrumb->add('Purchase','')
            ->add('Purchases Order','purchase_invoice')
            ->add('Add New Purchase Order','purchase_invoice/add');
    $data   = array(
            'content'   => 'purchase_invoice/purchase_invoice_add',
            'account'  =>$this->db->query("select * from account where kode_account='2-110'")->result(),
            'kode_pi'  =>  $this->M_Purchaseinvoice->buat_kode()
        );

    $this->load->view('container', $data);
  }
    public function list_po($vendor = NULL) 
  {
if(!empty($vendor)){
    $data['list'] = $this->M_Purchaseinvoice->list_po($vendor)->result();
    $this->load->view('purchase_invoice/list_po',$data);
}
  }
     public function get_po($no_po) 
  {
 $data['list'] = $this->M_Purchaseinvoice->detail_po($no_po);
    $this->load->view('purchase_invoice/data_po',$data);
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
public function purchase_invoice_simpan(){
error_reporting(0);
         $this->load->library('form_validation');                
        $this->form_validation->set_rules('no_pi', 'Nomor Invoice', 'trim|required');    
        $this->form_validation->set_rules('vendor', 'Nama Vendor', 'trim|required');  
        $this->form_validation->set_rules('TotalSubtotalhidden', 'Nama Barang', 'trim|required');      
        $this->form_validation->set_error_delimiters('<span class="help-block help-block-error"><span class="text-danger">', '</spa></span>');
        $this->form_validation->set_message('required','%s harus diisi !');
       $tgl_pi=shortdate_uki($this->input->post('tanggal_pi'));  
        $tgl_jatuh_tempo=shortdate_uki($this->input->post('tgl_jatuhtempo'));   
        $no_pi=no_pi($this->input->post('form_no'),$this->input->post('tanggal_pi'));
         $kode_pi=$this->input->post('form_no"');
         $inv=$this->input->post('no_pi');
              if  ($this->form_validation->run()) {
            if($this->input->post('ppn2')!=0){
     $status_ppn=1;
            }else{
$status_ppn=0;

            }          
                $data = array (
            'kode_po' => $this->input->post('kode_po'),
            'kode_pi' => $no_pi,
            'no_pi'  =>  $kode_pi,
            'tgl_pi'  => $tgl_pi,
            'inv_no'  =>$inv,
            'total_ppn'    => $this->input->post('ppn2'),
            'ppn'    => $status_ppn,
           // 'tunai'   => $this->input->post('val_tunai'),
           // 'uang_muka' =>$this->input->post('uang_muka'),
            'kode_vendor' =>$this->input->post('vendor'),
            'keterangan' =>$this->input->post('keterangan'),
            'jatuh_tempo' =>$tgl_jatuh_tempo,
            'modiby'  =>$this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s'),
            'total_pi' =>  $this->input->post('TotalSubtotalhidden')     
                );
        $this->db->insert('tb_pi',$data);
              $inputakunkredit = array (
            'source_no' =>  $no_pi,
            'tanggal'   => $tgl_pi,
            'source'   => 'PI',
            'kode_account' => $_POST['kas_bayar'], 
            'keterangan'=>  $_POST['keterangan'],         
            'kredit' =>  $_POST['TotalSubtotalhidden'],
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
          );
        $this->db->insert('accjurnaldetail',$inputakunkredit); 

        //input ppn

        if($this->input->post('ppn2')!=0){
 $inputakunppn1 = array (
            'source_no' =>  $no_pi,
            'tanggal'   => $tgl_pi,
            'source'   => 'PI',
            'kode_account' => '2-130',            
            'debet' =>  $_POST['ppn2'],
            'keterangan'=> $_POST['keterangan'],  
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
          );
        $this->db->insert('accjurnaldetail',$inputakunppn1); 
          $inputppn = array (
            'source_no' =>  $no_pi,
            'tanggal1'   => $tgl_pi,
            'source'   => 'PI',
            'kode_account' => $_POST['kas_bayar'], 
            'keterangan'=>  $_POST['keterangan'],         
            'kredit' =>  $_POST['ppn2'],
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
          );
        $this->db->insert('accjurnaldetail',$inputppn); 

        }
            $no_array = 0;
           foreach($_POST['kode'] as $k)
                  {
                    if( ! empty($k))
                    {
              $dataku = array (
            'source_no' =>  $no_pi,
            'source'   => 'PI',
            'tanggal'   => $tgl_pi,
            'kode_account' => $_POST['account'][$no_array], 
            'keterangan'=>  $_POST['keterangan'],             
            'debet' =>  $_POST['subtotal'][$no_array],
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
          );
        $this->db->insert('accjurnaldetail',$dataku); 
         $dataku = array (
            'kode_pi' =>  $no_pi,
            'kode_barang' => $_POST['kode'][$no_array],            
            'satuan' =>  $_POST['satuan'][$no_array],
            'qty' => $_POST['jumlah_order'][$no_array],
            'harga'=>$_POST['harga'][$no_array]           
          );
        $this->db->insert('tb_pi_detail',$dataku);
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

       
        $posts = $this->M_Purchaseinvoice->get_datatables($from,$to); 

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
            "recordsTotal" => $this->M_Purchaseinvoice->count_all(),
            "recordsFiltered" => $this->M_Purchaseinvoice->count_filtered($from,$to),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  }

 




}