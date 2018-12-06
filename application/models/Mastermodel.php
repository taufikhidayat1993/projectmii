<?php
class Mastermodel extends CI_Model{

function satuan(){
return $this->db->get('tb_barang_satuan');
}
}