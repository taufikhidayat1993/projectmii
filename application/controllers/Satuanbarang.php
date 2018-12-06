<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Satuanbarang extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('satuanbarangmodel','', TRUE);  
        $this->load->helper(array('form', 'url'));
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'satuanbarang/satuanbarang_data'
        );
    $this->load->view('container', $data);
  }
  public function server_side() { 
    $name_satuanbarang = $this->input->post('name_satuanbarang');
        $posts = $this->satuanbarangmodel->get_datatables($name_satuanbarang); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {            
            $no++;
            $row = array();
            $row[] = $no;          
            $row[] = $post->nama_satuan;           
            $row[] = "<a href='".site_url('satuanbarang/satuanbarang_edit/'.$post->satuan_id)."' id='Editsatuanbarang' class='btn btn-xs blue'><i class='fa fa-edit'></i></a>
                         <a href='".site_url('satuanbarang/hapus/'.$post->satuan_id)."' id='hapussatuanbarang'class='btn btn-xs red' ><i class='fa fa-trash'></i></a>";
            $data[] = $row;
        }        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->satuanbarangmodel->count_all(),
            "recordsFiltered" => $this->satuanbarangmodel->count_filtered($name_satuanbarang),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
}
public function tambah_satuanbarang() { 
    $this->load->view('satuanbarang/satuanbarang_add');
    }

public function satuanbarang_edit_data($id_satuanbarang = NULL)
  {
     if( ! empty($id_satuanbarang))
    {
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_satuan', 'Nama Kategori', 'trim|required');
        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run() == TRUE)
            {

              $nama_satuanbarang      = $this->input->post('nama_satuan');                  
              $update    = $this->satuanbarangmodel->update_satuanbarang($id_satuanbarang,$nama_satuanbarang);
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
public function satuanbarang_edit($id_satuanbarang = NULL)
  {
    if( ! empty($id_satuanbarang))
    {    
            $dt['satuanbarang'] = $this->satuanbarangmodel->get_id_satuanbarang($id_satuanbarang)->row();
            $this->load->view('satuanbarang/satuanbarang_edit', $dt);
      }
    }
  
public function add_satuanbarang(){
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_satuanbarang', 'Nama Kategori Barang', 'trim|required');
        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run()) { 
           
             $data = array (
                      'nama_satuan' => $this->input->post('nama_satuanbarang'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' =>  $this->session->userdata('user_id')                  
             );
            $this->satuanbarangmodel->insert_all('brgsatuan',$data);
            $data['success'] = true;
    }else{

                    foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
         }
         echo json_encode($data);
}
  
  public function hapus($id_satuanbarang)
  { 
        $hapus = $this->satuanbarangmodel->hapus_satuanbarang($id_satuanbarang);
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