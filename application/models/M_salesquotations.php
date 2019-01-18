<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_salesquotations extends CI_Model 
{
    function __construct() {
        parent::__construct();  // call model constructor    
    }
function list_request(){
    $query = $this->db->where('status',1);
return $this->db->get('request_order');
}
function detail_request($no_request){

     $query = $this->db->query("select tb_barang.nama_barang,tb_barang.kode_account,tb_barang.satuan,detail_request_order.* from detail_request_order left join tb_barang on tb_barang.kode_barang=detail_request_order.kode_barang where 
        detail_request_order.kode_pr='".$no_request."'");        
     return $query->result();
}
    var $table = 'sales_quotations'; 
    var $select = array('tb_po.*','tb_supplier.nama_vendor'); //specify the columns you want to fetch from table
 // var $column_order = array('no_faktur','tgl_beli','nama_kasir','tb_pembelian.timestmp'); //set column field database for datatable orderable
//  var $column_search = array('no_faktur','tgl_beli','nama_kasir','tb_pembelian.timestmp'); //set column field database for datatable searchable
   
    public function get_datatables($from, $to)
    {
        $this->_get_datatables_query($from, $to);       
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);        
        $query = $this->db->get();
        
        return $query->result();
    }
    public function count_filtered($from, $to)
    {
        $this->_get_datatables_query($from, $to);
       
        $query = $this->db->get();
       
        return $query->num_rows();
    }

    public function count_all()
    {
        $this->db->from($this->table);
        
        return $this->db->count_all_results();
    }

    private function _get_datatables_query($from,$to)
    {
        $this->db
             ->select('date_quotations,kode_quotations,ppn,diskon,biaya_kirim,status,b.nama_costumer,(total_ammount-diskon-biaya_kirim+ppn) as nilai_faktur')
             ->from('sales_quotations a')
			  ->join('tb_costumer b', 'a.kode_costumer=b.kode_costumer','left');
        if($from !='' && $to !='' ) // To process our custom input parameter
        {

            $this->db->where('a.date_quotations BETWEEN "'.$from. '" and "'.$to.'"');
        }
    }
	  public function detail_pr($kode)
    {
	 $hasil=$this->db->query("SELECT * FROM detail_request_order WHERE kode_pr='$kode'");
        return $hasil->result();
	}
 public function buat_kode()   {
		  $this->db->select('RIGHT(no_po,3) as kode', FALSE);
		  $this->db->where('YEAR(tgl_po)', date('Y'));
		  $this->db->limit(1);    
          $this->db->order_by("no_po", "desc"); 
		  $query = $this->db->get('tb_po'); 

		  //cek dulu apakah ada sudah ada kode di tabel.    
		  if($query->num_rows() <> 0){       
		   $data = $query->row();      
		   $kode = intval($data->kode) + 1;    
		  }
		  else {      
		   $kode = 1;    
		  }
		  $kodemax = str_pad($kode,3,"0",STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
		  return $kodemax;  
	}
	function tambah_pr($kode_pr,$nama_barang,$jumlah,$satuan)
	{
		$dt = array(
			'kode_pr' => $kode,
			'nama_barang' => $nama_barang,
			'qty' => $jumlah,
			'satuan' => $satuan
		);

		return $this->db->insert('detail_request_order', $dt);
	}
   
}