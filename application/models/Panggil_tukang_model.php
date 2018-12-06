<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Panggil_tukang_model extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		
	}

	function tes() {
		$query = $this->db->get('user');
		return $query->result_array();
	}

	function insert_user($data,$user_type) {
		
		$query = $this->db->get_where($user_type, array('email' => $data['email'] ));
		$check_email = $query->num_rows(); 

		if ($check_email > 0) {
			return 1;
		} else if ($check_email == 0) {
			$this->db->insert($user_type,$data);
			return ($this->db->affected_rows() > 0) ? 2 : 3;
		} else {
			return 4;
		}
	}

	function do_login($data) {
		if ($data['user_type'] == 1) {
			$query = $this->db->get_where('user', array('email' => $data['email'],'password' => $data['password']));	
			return $query->row();
		} else if ($data['user_type'] == 2) {
			$query = $this->db->get_where('coordinator', array('email' => $data['email'],'password' => $data['password']));	
			return $query->row();
		} else {
			return null;
		}
		
	}

	function do_update_user($id,$field_id,$table,$data) {
		$query = $this->db->where($field_id,$id)
						->update($table,$data);

		if ($query != null) {
			$query2 = $this->db->get_where($table, array($field_id => $id));
			$query_result = $query2->row();
			if ($query_result != null) {
				return $query_result;
			} else {
				return null;
			}
		} else {
			return null;
		}

	}

	function insert_survey_order($data) {
		$this->db->insert('survey_order',$data);
		return $this->db->insert_id();
	}

	function get_survey_order($user_id) {
		$query = $this->db->query("SELECT * FROM survey_order where user_id = $user_id and (survey_order_status = 0 or survey_order_status = 1 or survey_order_status = 2)");
		return $query->result_array();
	}

	function get_survey_order_by_id($survey_order_id) {
		$query = $this->db->query("SELECT * FROM survey_order JOIN bank_account ON survey_order.bank_id = bank_account.bank_id
									WHERE survey_order.survey_order_id = $survey_order_id");
		return $query->row();
	}


	function get_bank_list() {
		$query = $this->db->get('bank_account');
		return $query->result_array();
	}

	function get_bank_list_by_id($id_bank) {
		$query = $this->db->get_where('bank_account', array('bank_id' => $id_bank));	
			return $query->row();
	}

	function update_survey_order($survey_order_id,$data) {
		$query = $this->db->where('survey_order_id',$survey_order_id)
						->update('survey_order',$data);
		if ($query != null) {
			return true;
		} else {
			return false;
		}

	}

	function update_survey_order_repair($survey_order_id,$data) {
		$query = $this->db->where('survey_order_id',$survey_order_id)
						->update('repair_order',$data);
		if ($query != null) {
			return true;
		} else {
			return false;
		}

	}

	function get_survey_order_coor() {
		$query = $this->db->query("select a.*, b.*, c.* from survey_order a, user b, sub_service c where a.user_id = b.user_id and a.sub_service_id = c.sub_service_id and a.survey_order_status = 2 and a.coor_id is NULL");
		return $query->result_array();
	}


	function get_coor_data($coor_id) {
		$query = $this->db->get_where('coordinator', array('coor_id' => $coor_id));	
		return $query->row();
	}
	
	function get_survey_order_by_coor_id($coor_id) {
		$query = $this->db->query("select a.*, b.*, c.* from survey_order a, user b, sub_service c where a.user_id = b.user_id and a.sub_service_id = c.sub_service_id and a.survey_order_status = 2 and a.coor_id = $coor_id");
		//$query = $this->db->query("SELECT * FROM survey_order where coor_id = $coor_id and survey_order_status = 2");
		return $query->result_array();
	}

	function confirm_job($survey_order_id,$data) {
		$query = $this->db->where('survey_order_id',$survey_order_id)
						->update('survey_order',$data);
		if ($query != null) {
			return true;
		} else {
			return false;
		}
	}

	// function get_survey_order_on_progress($coor_id) {
	// 	$query = $this->db->query("select a.*, b.*, c.* from survey_order a, user b, sub_service c where a.user_id = b.user_id and a.sub_service_id = c.sub_service_id and a.survey_order_status = 2 and a.coor_id = $coor_id");
	// 	return $query->result_array();
	// }
	function insert_repair_order($data) {
		$this->db->insert('repair_order',$data);
		return $this->db->insert_id();
	}	

	function get_repair_order_by_coor_id($coor_id,$survey_order_id) {
		$query = $this->db->query("select a.*, b.* from survey_order a, repair_order b where a.survey_order_id = b.survey_order_id and a.coor_id = $coor_id and a.survey_order_id = $survey_order_id");
		return $query->row();
	}

	function get_repair_order_by_user_id($user_id) {
		$query = $this->db->query("select a.*, b.* from survey_order a, repair_order b where a.survey_order_id = b.survey_order_id and a.survey_order_status = 3 and b.repair_order_status <> 0 and a.user_id = $user_id");
		return $query->result_array();
	}	

	function delete_survey_order($survey_order_id) {
		return $this->db->delete('survey_order', array('survey_order_id' => $survey_order_id));
	}

	function get_survey_image($survey_order_id) {
		$query = $this->db->get_where('order_image', array('survey_order_id' => $survey_order_id));	
		return $query->result_array();
	}



}