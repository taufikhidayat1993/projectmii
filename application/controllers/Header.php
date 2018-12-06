<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Header extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('headermodel','', TRUE);
         $this->load->model('groupmodel');
      $this->load->helper(array('form', 'url'));
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'header/header'
        );
    $data['user'] = $this->groupmodel->listgroup()->result();
    $this->load->view('container', $data);
  }
  public function server_side() { 
    $nama_header = $this->input->post('nama_header');
     $group = $this->input->post('group');
        $posts = $this->headermodel->get_datatables($nama_header,$group); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {            
            $no++;
            $row = array();
            $row[] = $post->kode_header;          
            $row[] = $post->nama_header;
             $row[] = $post->nama_group;
            $row[] = $post->keterangan;           
            $row[] = "<a href='".site_url('header/edit/'.$post->kode_header)."' id='Editheader' class='btn btn-xs blue'><i class='fa fa-edit'></i></a>
                         <a href='".site_url('header/hapus/'.$post->kode_header)."' id='hapusheader'class='btn btn-xs red' ><i class='fa fa-trash'></i></a>";
            $data[] = $row;
        }
        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->headermodel->count_all(),
            "recordsFiltered" => $this->headermodel->count_filtered($nama_header,$group),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  

}
public function add_header() { 
  $data['list'] = $this->groupmodel->listgroup()->result();
    $this->load->view('header/header_add',$data);
    }

public function header_edit_data($id_header = NULL)
  {
     if( ! empty($id_header))
    {
        $this->load->library('form_validation');                
           $this->form_validation->set_rules('nama_header', 'Nama Account', 'trim|required');
        $this->form_validation->set_rules('kode_header', 'No Account', 'trim|required');                  
        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run() == TRUE)
            {
              $kode_header      = $this->input->post('kode_header');
              $kode_group      = $this->input->post('kode_group');
              $nama_header    = $this->input->post('nama_header');
              $keterangan            = $this->input->post('keterangan');
              $update          = $this->headermodel->update_header($id_header,$kode_group,$kode_header,$nama_header,$keterangan);
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
public function edit($kode_header = NULL)
  {
    if( ! empty($kode_header))
    {    
            $dt['header'] = $this->headermodel->get_id_header($kode_header)->row();
             $dt['list'] = $this->groupmodel->listgroup()->result();
            $this->load->view('header/header_edit', $dt);
      }
    }
  
public function header_add(){
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_header', 'Nama Header', 'trim|required');
        $this->form_validation->set_rules('kode_header', 'No Header', 'trim|required');     
        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run()) {            
             $data = array (
                      'nama_header' => $this->input->post('nama_header'),
                      'kode_header' => $this->input->post('kode_header'),
                      'kode_group' => $this->input->post('kode_group'),
                      'keterangan' => $this->input->post('keterangan'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' => $this->session->userdata('user_id')                   
             );
            $this->headermodel->insert_all('accheader',$data);
            $data['success'] = true;
    }else{

                    foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
         }
         echo json_encode($data);
}
  
  public function hapus($id_header)
  { 
        $hapus = $this->headermodel->hapus_header($id_header);
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