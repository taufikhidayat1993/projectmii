<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sales_quotations extends CI_Controller {
  Public function __construct() { 
        parent::__construct(); 
    $this->load->helper('nominal');
   $this->load->helper('format_tanggal'); 
     $this->load->library('breadcrumb');
  }
  public function index(){  
  $this->breadcrumb->add('Sales','')
            ->add('Sales Quotations','Sales_quotations');
  	$data   = array(
            'content'   => 'Sales_quotations/view_data'
        );
		$this->load->view('container', $data);
  }
  public function add(){
  	  $this->breadcrumb->add('Sales','')
            ->add('Sales Quotations','sales/Sales_quotations')
            ->add('Add','sales/Sales_quotations/add');
  		$data   = array(
            'content'   => 'sales_quotations/quotations_add'
        );
        $this->load->view('container', $data);;
  }
  public function cari_costumer() 
  {
       $list = array();
  $query=$this->db->query("select * from tb_costumer where nama_costumer  like '%$_GET[search]%'");
  $posts = $query->result(); 
  if ($query->num_rows() > 0) {
  $key=0;
  foreach ($posts as $post) {
$list[$key]['id'] = $post->kode_costumer;
$list[$key]['text'] = $post->nama_costumer;
$key++;
  }
   echo json_encode($list);
  
}else{

       echo "hasil kosong";
}
}
public function get_quote_to(){
	$row=$this->db->query("select * from tb_costumer where kode_costumer='".$_POST['kode_costumer']."'")->row();
	echo $row->nama_costumer.'
'.$row->alamat;
}

public function get_quote_no(){
	$query=$this->db->query("select RIGHT(kode_quotations,4) as kode from sales_quotations order by kode_quotations desc");
	 if($query->num_rows() <> 0){       
		   $data = $query->row();      
		   $kode = intval($data->kode_quotations) + 1;    
		  }
		  else {      
		   $kode = 1;    
		  }
		  $kodemax = str_pad($kode,4,"0",STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
		  echo  $kodemax; 
}
}