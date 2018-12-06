<?php
class Kategoribarangmodel extends CI_Model{


function listkategoribarang(){
return $this->db->get('brgkategori');
}

var $table='brgkategori';
  public function get_datatables($nama_kategoribarang)
    {
        $this->_get_datatables_query($nama_kategoribarang);       
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);        
        $query = $this->db->get();
        return $query->result();
    }
    public function count_filtered($nama_kategoribarang)
    {
        $this->_get_datatables_query($nama_kategoribarang);       
        $query = $this->db->get();       
        return $query->num_rows();
    }
    public function count_all()
    {
        $this->db->from($this->table);        
        return $this->db->count_all_results();
    }
    private function _get_datatables_query($nama_kategoribarang)
    {
        $this->db
             ->select('*')
             ->from('brgkategori');
          
			
    if($nama_kategoribarang!='') // To process our custom input parameter
    {
            $this->db->where('nama_kategori like "%'.$nama_kategoribarang.'%"');
    }
 
    }
     function get_id_kategoribarang($id_kategoribarang)
       {
    return $this->db
      ->select('*')
      ->where('kategori_id', $id_kategoribarang)
      ->limit(1)
      ->get('brgkategori');
     }

function insert_all($table,$data) {
    $this->db->insert($table,$data);
}

  function update_kategoribarang($id_kategoribarang,$nama_kategoribarang)
  {
    $dt = array(
      'nama_kategori' => $nama_kategoribarang       
    );
    return $this->db
      ->where('kategori_id', $id_kategoribarang)
      ->update('brgkategori', $dt);
  }
function hapus_kategoribarang($id_kategoribarang)
  {
    return $this->db
        ->where('kategori_id', $id_kategoribarang)
        ->delete('brgkategori');
  }


}