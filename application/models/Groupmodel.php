<?php
class Groupmodel extends CI_Model{


function listgroup(){
return $this->db->get('accgroup');
}

var $table='accgroup';
  public function get_datatables($nama_group)
    {
        $this->_get_datatables_query($nama_group);       
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);        
        $query = $this->db->get();
        return $query->result();
    }
    public function count_filtered($nama_group)
    {
        $this->_get_datatables_query($nama_group);       
        $query = $this->db->get();       
        return $query->num_rows();
    }
    public function count_all()
    {
        $this->db->from($this->table);        
        return $this->db->count_all_results();
    }
    private function _get_datatables_query($nama_group)
    {
        $this->db
             ->select('*')
             ->from('accgroup');
          
			
    if($nama_group!='') // To process our custom input parameter
    {
            $this->db->where('nama_group like "%'.$nama_group.'%"');
    }
 
    }
     function get_id_group($id_group)
       {
    return $this->db
      ->select('*')
      ->where('kode_group', $id_group)

      ->limit(1)
      ->get('accgroup');
     }

function insert_all($table,$data) {
    $this->db->insert($table,$data);
}

  function update_group($id_group,$kode_group,$nama_group)
  {
    $dt = array(
      'nama_group' => $nama_group,
      'kode_group' => $kode_group   
    );
    return $this->db
      ->where('kode_group', $id_group)
      ->update('accgroup', $dt);
  }
function hapus_group($id_group)
  {
    return $this->db
        ->where('kode_group', $id_group)
        ->delete('accgroup');
  }


}