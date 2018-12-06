<?php
class Headermodel extends CI_Model{


function satuan(){
return $this->db->get('accheader');
}
var $table='accheader';
  public function get_datatables($nama_header,$group)
    {
        $this->_get_datatables_query($nama_header,$group);       
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);        
        $query = $this->db->get();
        return $query->result();
    }
    public function count_filtered($nama_header,$group)
    {
        $this->_get_datatables_query($nama_header,$group);       
        $query = $this->db->get();       
        return $query->num_rows();
    }
    public function count_all()
    {
        $this->db->from($this->table);        
        return $this->db->count_all_results();
    }
    private function _get_datatables_query($nama_header,$group)
    {
        $this->db
             ->select('headerid,kode_header,nama_header,keterangan,accgroup.nama_group')
             ->from('accheader')
             ->join('accgroup', 'accgroup.kode_group=accheader.kode_group','left');
			
    if($nama_header!='') // To process our custom input parameter
    {
            $this->db->where('nama_header like "%'.$nama_header.'%"');
    }
    if($group!='') // To process our custom input parameter
    {
            $this->db->where('accheader.kode_group ="'.$group.'"');
    }
    }
     function get_id_header($id_header)
       {
    return $this->db
      ->select('*')
      ->where('headerid', $id_header)

      ->limit(1)
      ->get('accheader');
     }

function insert_all($table,$data) {
    $this->db->insert($table,$data);
}

  function update_header($id_header,$groupid,$kode_header,$nama_header,$keterangan)
  {
    $dt = array(
      'nama_header' => $nama_header,
      'kode_header' => $kode_header,
      'groupid' => $groupid,
      'keterangan' => $keterangan
    );
    return $this->db
      ->where('headerid', $id_header)
      ->update('accheader', $dt);
  }
function hapus_header($id_header)
  {
    return $this->db
        ->where('headerid', $id_header)
        ->delete('accheader');
  }
}