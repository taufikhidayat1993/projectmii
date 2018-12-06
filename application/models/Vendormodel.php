<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Vendormodel extends CI_Model 
{
    function __construct() {
        parent::__construct();  // call model constructor    
    }
    var $table = 'tb_supplier'; 

    var $select = array('kode_vendor','id_vendor','nama_vendor','alamat','email','telepon'); 
    var $order = array('nama_vendor' => 'asc');//specify the columns you want to fetch from table
 // var $column_order = array('no_faktur','tgl_beli','nama_kasir','tb_pembelian.timestmp'); //set column field database for datatable orderable
//  var $column_search = array('no_faktur','tgl_beli','nama_kasir','tb_pembelian.timestmp'); //set column field database for datatable searchable
     // default order

    public function get_datatables($name_vendor)
    {
        $this->_get_datatables_query($name_vendor);       
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);        
        $query = $this->db->get();
        return $query->result();
    }
    public function count_filtered($name_vendor)
    {
        $this->_get_datatables_query($name_vendor);       
        $query = $this->db->get();       
        return $query->num_rows();
    }
    public function count_all()
    {
        $this->db->from($this->table);        
        return $this->db->count_all_results();
    }
    private function _get_datatables_query($name_vendor)
    {
        $this->db
             ->select($this->select)
             ->from($this->table);
			
    if($name_vendor!='') // To process our custom input parameter
    {
            $this->db->where('nama_vendor like "%'.$name_vendor.'%"');
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
     function get_id_vendor($id_vendor)
       {
    return $this->db
      ->select('kode_vendor, id_vendor, nama_vendor, alamat, email, telepon,deskripsi')
      ->where('id_vendor', $id_vendor)
      ->limit(1)
      ->get('tb_supplier');
     }
    function buat_kode()   {
          $this->db->select('RIGHT(kode_vendor,4) as kode', FALSE);     
         $this->db->order_by('kode_vendor','DESC');
          $this->db->limit(1);     
          $query = $this->db->get('tb_supplier');     
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
          $kodejadi = 'S'.$kodemax;    // S0001
          return $kodejadi;  
    }
function insert_all($table,$data) {
    $this->db->insert($table,$data);
}
function update_pelanggan($id_pelanggan, $nama, $alamat, $telepon, $info)
  {
    $dt = array(
      'nama' => $nama,
      'alamat' => $alamat,
      'telp' => $telepon,
      'info_tambahan' => $info
    );

    return $this->db
      ->where('id_pelanggan', $id_pelanggan)
      ->update('pj_pelanggan', $dt);
  }
  function update_vendor($id_vendor, $nama, $alamat, $telepon, $deskripsi,$email)
  {
    $dt = array(
      'nama_vendor' => $nama,
      'alamat' => $alamat,
      'telepon' => $telepon,
      'deskripsi' => $deskripsi,
      'email'=>$email
    );

    return $this->db
      ->where('id_vendor', $id_vendor)
      ->update('tb_supplier', $dt);
  }
function hapus_vendor($id_vendor)
  {
    return $this->db
        ->where('id_vendor', $id_vendor)
        ->delete('tb_supplier');
  }
}

?>