<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {
    
	public function customer()
	{
        $data   = array(
            'content'   => 'customer'
        );
		$this->load->view('container', $data);
	}
    
    public function mandor()
	{
        $data   = array(
            'content'   => 'mandor'
        );
		$this->load->view('container', $data);
	}
    
    public function addUser() {
        $config['upload_path']          = 'upload/';
        $config['allowed_types']        = 'jpg|png|gif';
        $config['image_width']          = 5000;
        $config['image_height']         = 5000;

        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        
        if ( $this->upload->do_upload('ktp') ){
            $ktp         = $this->upload->data('file_name');

            if( $this->upload->do_upload('kk') ){
                $kk     = $this->upload->data('file_name');
                
                if( $this->upload->do_upload('skck') ){
                    $skck     = $this->upload->data('file_name');
                    
                    $data = array(
                        "name"              =>  $this->input->post('name'),
                        "nik"               =>  $this->input->post('nik'),
                        "email"             =>  $this->input->post('email'),
                        "password"          =>  md5($this->input->post('password')),
                        "phone"             =>  $this->input->post('phone'),
                        "address"           =>  $this->input->post('address'),
                        "birth_date"        =>  $this->input->post('birth_date'),
                        "birth_address"     =>  $this->input->post('birth_place'),
                        "ktp"               =>  $ktp,
                        "join_date"         =>  date('Y-m-d'),
                        "kk"                =>  $kk,
                        "skck"              =>  $skck,
                        "pengalaman_kerja"  =>  $this->input->post('pengalaman_kerja')
                    );

                    $this->db->insert('coordinator', $data); 

                    echo ($this->db->affected_rows() > 0) ? 'success' : 'failed';
                } else {
                    echo $this->upload->display_errors().'1';
                }
            } else{
               echo $this->upload->display_errors().'2';
            }
        } else {
            echo $this->upload->display_errors().'3';
        }
    }
}
