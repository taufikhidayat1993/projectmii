<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_jurnalumum extends CI_Model 
{
    function __construct() {
        parent::__construct();  // call model constructor    
    }

    var $table = 'accjurnaldetail'; 

    var $select = array('accjurnaldetail.*','sum(accjurnaldetail.debet) as debet','account.nama_account','accsource.nama_source'); 
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
			  ->join('accsource', 'accsource.kode_source=accjurnaldetail.source','left')
               ->join('account', 'accjurnaldetail.kode_account=account.kode_account','left')
              ->group_by('account.nama_account, accjurnaldetail.source_no, accjurnaldetail.kode_account')
                ->order_by('accjurnaldetail.source_no','desc');
        if($from!='' && $to!='' || $from!= NULL) // To process our custom input parameter
        {

            $this->db->where('accjurnaldetail.tgl_po BETWEEN "'. date('Y-m-d', strtotime($from)). '" and "'. date('Y-m-d', strtotime($to)).'"');
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
		  $query = $this->db->get('accjurnaldetail'); 

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