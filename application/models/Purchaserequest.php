<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Purchaserequest extends CI_Model 
{
    function __construct() {
        parent::__construct();  // call model constructor    
    }

    var $table = 'request_order'; 

    var $select = array('tgl_pr','user.nama_lengkap','request_order.modidate','kode_pr'); //specify the columns you want to fetch from table
 // var $column_order = array('no_faktur','tgl_beli','nama_kasir','tb_pembelian.timestmp'); //set column field database for datatable orderable
//  var $column_search = array('no_faktur','tgl_beli','nama_kasir','tb_pembelian.timestmp'); //set column field database for datatable searchable
    var $order = array('timestmp' => 'desc'); // default order

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
			  ->join('user', 'request_order.modiby=user.id_user','left');
        if($from!='' && $to!='' || $from!= NULL) // To process our custom input parameter
        {

            $this->db->where('request_order.tgl_pr BETWEEN "'. date('Y-m-d', strtotime($from)). '" and "'. date('Y-m-d', strtotime($to)).'"');
        }
/*
 $i = 0;
        foreach ($this->column_search as $item) // loop column
        {
            if($_POST['search']['value']) // if datatable send POST for search
            {
                if($i===0) // first loop
                {
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
                if(count($this->column_search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }
*/
    //    if(isset($_POST['order'])) // here order processing
    //    {
     //       $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);

      //  }
    //    elseif (isset($this->order)) // default order processing
     //   {
       //     $order = $this->order;

      //      $this->db->order_by(key($order), $order[key($order)]);

      //  }
    }
	  public function detail_pr($kode)
    {
	 $hasil=$this->db->query("SELECT * FROM detail_request_order WHERE kode_pr='$kode'");
        return $hasil->result();
	}
 public function buat_kode()   {
		  $this->db->select('RIGHT(kode_pr,4) as kode', FALSE);
		  $this->db->where('YEAR(tgl_pr)', date('Y'));
		  $this->db->limit(1);    
    
		  $query = $this->db->get('request_order'); 	
		  //cek dulu apakah ada sudah ada kode di tabel.    
		  if($query->num_rows() <> 0){      
		   //jika kode ternyata sudah ada.      
		   $data = $query->row();      
		   $kode = intval($data->kode) + 1;    
		  }
		  else {      
		   //jika kode belum ada      
		   $kode = 1;    
		  }
		  $kodemax = str_pad($kode, 4, "0", STR_PAD_LEFT); // angka 4 menunjukkan jumlah digit angka 0
		  $kodejadi = date('Y').''.$kodemax;    // hasilnya ODJ-9921-0001 dst.
		  return $kodejadi;  
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