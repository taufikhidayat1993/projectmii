<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Pencarian extends CI_Controller {

    public function __construct(){
        parent::__construct();
      
            $this->load->model('cari_barang');

    }


    public function get_data() {    
        $keyword = $this->uri->segment(3);
        $data = $this->db->from('countries')->like('list_name',$keyword)->get();            

        foreach($data->result() as $row)
        {
            $arr['query'] = $keyword;
            $arr['suggestions'][] = array(
                'value'    =>$row->list_name
            );
        }
        echo json_encode($arr);
    }
}