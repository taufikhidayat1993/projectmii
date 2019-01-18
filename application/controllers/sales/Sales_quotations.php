<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sales_quotations extends CI_Controller {
  Public function __construct() { 
        parent::__construct(); 
    $this->load->helper('nominal');
   $this->load->helper('format_tanggal'); 
    $this->load->model('M_salesquotations');
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
		   $kode = intval($data->kode) + 1;    
		  }
		  else {      
		   $kode = 1;    
		  }
		  $kodemax = str_pad($kode,4,"0",STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
		  echo  $kodemax; 
}
public function simpan(){
	$this->load->library('form_validation');
	$this->form_validation->set_rules('costumer', 'Costumer', 'trim|required');
    $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
    $this->form_validation->set_message('required','%s harus diisi !');
    if($this->form_validation->run()==true){
    	$date=$this->input->post('date_quote');
  $row=$this->db->query("select * from sales_quotations where kode_quotations=".$this->input->post('quote_no')."");
  
        	$data1 =array(
    			'kode_quotations' =>$this->input->post('quote_no'),
    			'date_quotations' =>ymd($date),
    			'kode_costumer'   =>$this->input->post('costumer'),
    			'diskon'		  =>$this->input->post('total_diskon'),
    			'ppn'			  =>$this->input->post('ppn2'),
    			'biaya_kirim'     =>$this->input->post('biaya_pengiriman'),
    			'total_ammount'   =>$this->input->post('TotalSubtotalhidden'),
    			'status'          =>'0',
    			'keterangan'      =>$this->input->post('keterangan'),
    			'modiby'		  =>date('Y-m-d H:i:s'),
    			'modidate'		  =>$this->session->userdata('user_id')

    	   );
 if($row->num_rows() == 0){  	
        $no_array = 0;
        foreach ($_POST['kode'] as $k) {
        	if(!empty ($k)){
        		$data2=array(
        		 'kode_quotations' =>$this->input->post('quote_no'),
        		 'kode_barang'     =>$_POST['kode'][$no_array],
        		 'harga'		   =>$_POST['unit_price'][$no_array],
        		 'qty'			   =>$_POST['qty'][$no_array],
        		 'diskon'          =>$_POST['diskon'][$no_array],
        		 'satuan'		   =>$_POST['satuan'][$no_array]	
        		);

        		$this->db->insert('sales_detail_quotations',$data2);
        	}
        	$no_array++;
        }
            $this->db->insert('sales_quotations',$data1);
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
            $from = ymd($from);
            $to = ymd($to);
        }       
        $posts = $this->M_salesquotations->get_datatables($from,$to); 

        $data = array();
        $no = $this->input->post('start');
      foreach ($posts as $post) 
        {               
            $no++;
            $row = array();
            $row[] = $post->date_quotations;
            $row[] = $post->kode_quotations;        
            $row[] = $post->nama_costumer;          
            $row[] = nominal($post->diskon);
            $row[] = nominal($post->ppn);          
            $row[] = nominal($post->biaya_kirim);
               $row[] = nominal($post->nilai_faktur);
             $row[] = "-";
            $data[] = $row;
        }        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->M_salesquotations->count_all(),
            "recordsFiltered" => $this->M_salesquotations->count_filtered($from,$to),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  }
}