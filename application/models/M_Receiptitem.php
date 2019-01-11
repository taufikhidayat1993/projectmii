<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_Receiptitem extends CI_Model 
{
    function __construct() {
        parent::__construct();  // call model constructor    
    }
function list_po($vendor){
        $query = $this->db->select('tb_po.*,(total_ppn+total_po) as ammount');
    $query = $this->db->where('status',0);
    $query = $this->db->where('kode_vendor',$vendor);
return $this->db->get('tb_po');
}
function detail_invoice($no_po){
     $query = $this->db->query("selct * from tb_pi where kode_vendor='".$no_po."'");        
     return $query->result();
}
function detail_po($no_po){

     $query = $this->db->query("select tb_barang.nama_barang,tb_barang.kode_account,tb_barang_satuan.nama_satuan,tb_detail_po.* from tb_detail_po left join tb_barang on tb_barang.kode_barang=tb_detail_po.kode_barang left join tb_barang_satuan on tb_detail_po.satuan= tb_barang_satuan.id_satuan where 
        tb_detail_po.kode_po='".$no_po."'");        
     return $query->result();
}
    var $table = 'tb_pi'; 

    var $select = array('tb_pi.*','tb_supplier.nama_vendor'); //specify the columns you want to fetch from table
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
             ->select($this->select)
             ->from($this->table)
			  ->join('tb_supplier', 'tb_pi.kode_vendor=tb_supplier.kode_vendor','left');
        if($from!='' && $to!='' || $from!= NULL) // To process our custom input parameter
        {

            $this->db->where('tb_pi.tgl_po BETWEEN "'. date('Y-m-d', strtotime($from)). '" and "'. date('Y-m-d', strtotime($to)).'"');
        }
    }
	  public function detail_pr($kode)
    {
	 $hasil=$this->db->query("SELECT * FROM detail_request_order WHERE kode_pr='$kode'");
        return $hasil->result();
	}
 public function buat_kode()   {
		  $this->db->select('RIGHT(no_pi,3) as kode', FALSE);
		  $this->db->where('YEAR(tgl_pi)', date('Y'));
		  $this->db->limit(1);    
          $this->db->order_by("no_pi", "desc"); 
		  $query = $this->db->get('tb_pi'); 

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