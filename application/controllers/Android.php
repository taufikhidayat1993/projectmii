<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Android extends CI_Controller {

	public function date($datetime)
	{
		$month = array(1 => 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember' );
		$date  = substr($datetime, 0, 10);
		$split = explode('-', $date);
		return $split[2] . ' ' . $month[ (int)$split[1] ] . ' ' . $split[0];
	}

	public function time($datetime)
	{
		$time = substr($datetime, 11, 5);
		return $time;
	}

	public function index()
	{
		$query = $this->db->get('magazine');
			$query_result = $query->result_array();
			$data = array();
			$path = '';
			$cover = '';
			foreach ($query_result as $key) {
				if ($key['type'] == 1) {
					$path =  base . '/uploads/cover/';
					$cover = $key['cover'];
				}
				else {
					$path = base;
					$cover = substr($key['cover'],0,-4);
				}
					$data[] = array(
						'post_id'		=> $key['id_magazine'],
						'title'			=> $key['title'],
						'bln_edisi'		=> $key['bln_edisi'],
						'thn_edisi'		=> $key['thn_edisi'],
						'categories'	=> $key['type'],
						'source'		=> $path . $cover,
						'smallImage'	=> base . '/uploads/cover/' . $key['image'],
						'largeImage'	=> base . '/uploads/cover/' . $key['image'],
						'publishedDate'	=> $this->date($key['date']).', '.$this->time($key['date']));
				}	


			$array  = array(
					'totalItems' => count($data),
					'items' 	 => $data);
			echo json_encode($array);

	}

	function detail($id)
	{
		$query = $this->db->select('*')
						  ->from('magazine_detail')
						  ->where('id_magazine',$id)
						  ->order_by('page','asc')
						  ->get();

			$query_result = $query->result_array();
			$data = array();
			foreach ($query_result as $key) {
				$data[] = array(
					'post_id' 		=> $key['id_magz_detail'],
					'title' 		=> $key['title'],
					'rubrikasi'		=> $key['rubrikasi'],
					'authors' 		=> $key['author'],
					'authors_image' => base .'/uploads/' . $id . '/img/' .  $key['author_image'],
					'author_title'	=> $key['author_title'],
					'category'  	=> $key['type_berita'],
					'smallImage'	=> base . '/uploads/' . $id . '/img/' . $key['image'],
					'content'		=> $key['content'],
					'publishedDate'	=> ''
				);
			}
			$array  = array(
				'totalItems' => count($data),
				'items' 	 => $data);
			echo json_encode($array);
	}

	public function attachment($id2)
	{
		$query = $this->db->get_where('magazine_detail', array('id_magz_detail' => $id2));
		$query_result = $query->row();
		$query2 = $this->db->get_where('attachment', array('id_magz_detail' => $id2));
		$query2_result = $query2->result_array();
		if ($query_result->type_berita == 3)
		{
			$data = array();
			foreach ($query2_result as $key) {
				$data[] = array(
					'id' 		=> $key['id_attachment'],
					'attachment'=> base . '/uploads/' . $query_result->id_magazine . '/img/' . $key['attachment'],
					'caption'	=> $key['caption']
					);
			}
			$array = array(
				'totalItems' => count($data),
				'items'		 => $data );
			echo json_encode($array);
		}else if ($query_result->type_berita == 1) {
			$data = array();
			foreach ($query2_result as $key) {
				$data[] = array(
					'id' 		=> $key['id_attachment'],
					'attachment'=> base . $key['attachment'],
					'caption'	=> $key['caption']
					);
		}
		$array = array(
				'totalItems' => count($data),
				'items'		 => $data );
			echo json_encode($array);
	}
		else if ($query_result->type_berita == 2) {
			$data = array();
			foreach ($query2_result as $key) {
				$data[] = array(
					'id' 		=> $key['id_attachment'],
					'attachment'=> base . '/uploads/' . $query_result->id_magazine . '/vid/' . $key['attachment'],
					'caption'	=> $key['caption']
					);}
				$array = array(
				'totalItems' => count($data),
				'items'		 => $data );
			echo json_encode($array);
		}	
		else{

		$data = array();
			foreach ($query2_result as $key) {
				$data[] = array(
					'id' 		=> $key['id_attachment'],
					'attachment'=> base . '/uploads/' . $query_result->id_magazine . '/img/' . $key['attachment'],
					'caption'	=> $key['caption']
					);	
		}	
		$array = array(
				'totalItems' => count($data),
				'items'		 => $data );
		echo json_encode($array);
		}
	}

	function rrmdir($dir) {
  		if (is_dir($dir)) {
   			$objects = scandir($dir);
    		foreach ($objects as $object) {
      			if ($object != "." && $object != "..") {
        			if (filetype($dir."/".$object) == "dir") 
        	   			$this->rrmdir($dir."/".$object); 
        			else unlink   ($dir."/".$object);
      			}
    		}
   			reset($objects);
    		rmdir($dir);
  		}
 	}

 	function verifikasi() {
 		$query = $this->db->get_where('user', array('email' => $this->input->post('email')));
 		$query_result = $query->row();
 		$data = array(
					'email' 	=> $query_result->email,
					'nama' 		=> $query_result->nama,
					'status'	=> $query_result->approve_status
			);
			/*$array  = array(
				'totalItems' => count($data),
				'items' 	 => $data);*/
			echo json_encode($data);
 	}

 	function add_komen() {

 		$data = 'erda@rol.republika.co.id';

 		$query = $this->db->get_where('user', array('email' => $this->input->post('email')));
 		$query_result = $query->row();

 		if ($query_result->approve_status == 1) {
	 		$data = array(
	 			'id_magz_detail' => $this->input->post('id_magz_detail'),
	 			'komentar' => $this->input->post('komentar'),
	 			'email' => $this->input->post('email'),
	 			'time' => date('Y-m-d H:i:s'),
	 			'approval' => 0);
	 		$query2 = $this->db->insert('komentar',$data);
 		}
 		else if ($query_result->approve_status == 0) {
 			$data = array(
					'email' 		=> $query_result->email,
					'nama' 		=> $query_result->nama,
					'status' 		=> $query_result->approve_status
			);
			/*$array  = array(
				'totalItems' => count($data),
				'items' 	 => $data);*/
			echo json_encode($data);
 		}

 	} 

 	function login() {
 		$query = $this->db->get_where('user', array('email' => $this->input->post('email')));
 		$query_result = $query->result_array();

 		if (count($query_result) == 0) {
	 		$data = array(
	 			'nama' => $this->input->post('nama'),
	 			'email' => $this->input->post('email'),
	 			'picture' => $this->input->post('picture'),
	 			'approve_status' => 1);
	 		$query1 = $this->db->insert('user',$data);
 		}
 		print_r($_POST);

 	}

 	function show_komen($id) {
 		$query = $this->db->query("SELECT * from komentar inner join user on komentar.email = user.email where id_magz_detail = $id and approval = 1 order by time desc");
 		/*$query = $this->db->select('*')
						  ->from('komentar')
						  ->where( array('id_magz_detail' => $id, 'approval' => 1))
						  ->order_by('time','desc')
						  ->get();
*/
		$query_result = $query->result_array();
		$data = array();
			foreach ($query_result as $key) {
				$data[] = array(
					'id_komentar' 		=> $key['id_komen'],
					'id_magz_detail' 	=> $key['id_magz_detail'],
					'email' 			=> $key['email'],
					'time'  			=> $this->date($key['time']).', '.$this->time($key['time']) ,
					'konten'		 	=>	$key['komentar'],
					'nama' 				=> $key['nama'],
					'picture'			=> $key['picture'],
					);
			}
			$array  = array(
				'totalItems' => count($data),
				'komentar' 	 => $data,
				'items'		 => null);
			echo json_encode($data);

 	}

 	function about() {
 		$query = $this->db->get('about');
			$query_result = $query->row();
			if (count($query_result) != null) {
				$data = array(
				'id_about'	=> $query_result->id_about,
				'redaksi'	=> $query_result->redaksi,
				'info'		=> $query_result->info,
				'alamat'	=> $query_result->alamat,
				'email'		=> $query_result->email,
				'telpon'	=> $query_result->telpon,
				'facebook'	=> $query_result->facebook,
				'twitter'	=> $query_result->twitter,
				'instagram'	=> $query_result->instagram,
				'youtube'	=> $query_result->youtube,
				'facebook_link'	=> $query_result->facebook_link,
				'twitter_link'	=> $query_result->twitter_link,
				'instagram_link'	=> $query_result->instagram_link,
				'youtube_link'	=> $query_result->youtube_link,
				'versi'		=> $query_result->versi);
			
			echo json_encode($data);	
			}
			
 	}
}