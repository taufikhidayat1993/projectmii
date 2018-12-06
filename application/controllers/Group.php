<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Group extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('groupmodel','', TRUE);
  
              $this->load->helper(array('form', 'url'));
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'group/group_data'
        );
    $this->load->view('container', $data);
  }
  public function server_side() { 
    $name_group = $this->input->post('name_group');
        $posts = $this->groupmodel->get_datatables($name_group); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {            
            $no++;
            $row = array();
            $row[] = $post->kode_group;          
            $row[] = $post->nama_group;
           
            $row[] = "<a href='".site_url('group/group_edit/'.$post->groupid)."' id='Editgroup' class='btn btn-xs blue'><i class='fa fa-edit'></i></a>
                         <a href='".site_url('group/hapus/'.$post->groupid)."' id='hapusgroup'class='btn btn-xs red' ><i class='fa fa-trash'></i></a>";
            $data[] = $row;
        }        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->groupmodel->count_all(),
            "recordsFiltered" => $this->groupmodel->count_filtered($name_group),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  

}
public function tambah_group() { 
    $this->load->view('group/group_add');
    }

public function group_edit_data($id_group = NULL)
  {
     if( ! empty($id_group))
    {
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_group', 'Nama group', 'trim|required');
        $this->form_validation->set_rules('kode_group', 'No Group', 'trim|required');         
   
        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run() == TRUE)
            {

              $nama_group      = $this->input->post('nama_group');
              $kode_group    = $this->input->post('kode_group');          
              $update    = $this->groupmodel->update_group($id_group, $kode_group, $nama_group);
               $data['success'] = true;
            }
            else
            {
               foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
            }
                echo json_encode($data);
              }

  }
public function group_edit($id_group = NULL)
  {
    if( ! empty($id_group))
    {    
            $dt['group'] = $this->groupmodel->get_id_group($id_group)->row();
            $this->load->view('group/group_edit', $dt);
      }
    }
  
public function add_group(){
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_group', 'Nama group', 'trim|required');
        $this->form_validation->set_rules('kode_group', 'No Group', 'trim|required|max_length[40]');         
     

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run()) { 
           
             $data = array (
                      'kode_group'  =>$this->input->post('kode_group'),
                      'nama_group' => $this->input->post('nama_group'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' =>  $this->session->userdata('user_id')                  
             );
            $this->groupmodel->insert_all('accgroup',$data);
            $data['success'] = true;
    }else{

                    foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
         }
         echo json_encode($data);
}
  
  public function hapus($id_group)
  { 
        $hapus = $this->groupmodel->hapus_group($id_group);
        if($hapus)
        {
          echo json_encode(array(
            "pesan" => "<font color='green'><i class='fa fa-check'></i> Data berhasil dihapus !</font>
          "));
        }
        else
        {
          echo json_encode(array(
            "pesan" => "<font color='red'><i class='fa fa-warning'></i> Terjadi kesalahan, coba lagi !</font>
          "));
        }
      
  }
}