<?php
class Cari_barang extends CI_Model{

function vieworder($where){
  $query =  $this->db->query("SELECT * FROM survey_order JOIN user ON survey_order.user_id = user.user_id JOIN sub_service ON sub_service.sub_service_id = survey_order.sub_service_id where survey_order.survey_order_status=$where ");
 return  $query;
}
}