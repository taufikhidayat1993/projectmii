<?php
class Satuanbarangmodel extends CI_Model{


function listsatuanbarang(){
return $this->db->get('brgsatuan');
}

var $table='brgsatuan';
  public function get_datatables($nama_satuanbarang)
    {
        $this->_get_datatables_query($nama_satuanbarang);       
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);        
        $query = $this->db->get();
        return $query->result();
    }
    public function count_filtered($nama_satuanbarang)
    {
        $this->_get_datatables_query($nama_satuanbarang);       
        $query = $this->db->get();       
        return $query->num_rows();
    }
    public function count_all()
    {
        $this->db->from($this->table);        
        return $this->db->count_all_results();
    }
    private function _get_datatables_query($nama_satuanbarang)
    {
        $this->db
             ->select('*')
             ->from('brgsatuan');
          
			
    if($nama_satuanbarang!='') // To process our custom input parameter
    {
            $this->db->where('nama_satuan like "%'.$nama_satuanbarang.'%"');
    }
 
    }
     function get_id_satuanbarang($id_satuanbarang)
       {
    return $this->db
      ->select('*')
      ->where('satuan_id', $id_satuanbarang)
      ->limit(1)
      ->get('brgsatuan');
     }

function insert_all($table,$data) {
    $this->db->insert($table,$data);
}

  function update_satuanbarang($id_satuanbarang,$nama_satuanbarang)
  {
    $dt = array(
      'nama_satuan' => $nama_satuanbarang       
    );
    return $this->db
      ->where('satuan_id', $id_satuanbarang)
      ->update('brgsatuan', $dt);
  }
function hapus_satuanbarang($id_satuanbarang)
  {
    return $this->db
        ->where('satuan_id', $id_satuanbarang)
        ->delete('brgsatuan');
  }


}