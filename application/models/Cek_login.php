<?php
class Cek_login extends CI_Model{

function login($username,$password){
return	$this->db
			->select('usernm,id_user,nama_lengkap,level')
			->where('usernm', $username)
			->where('passwd', md5($password))
			->limit(1)
			->get('user');

}
}