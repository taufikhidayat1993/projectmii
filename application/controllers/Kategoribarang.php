<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kategoribarang extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('kategoribarangmodel','', TRUE);  
        $this->load->helper(array('form', 'url'));
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'kategoribarang/kategoribarang_data'
        );
    $this->load->view('container', $data);
  }
  public function server_side() { 
    $name_kategoribarang = $this->input->post('name_kategoribarang');
        $posts = $this->kategoribarangmodel->get_datatables($name_kategoribarang); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {            
            $no++;
            $row = array();
            $row[] = $no;          
            $row[] = $post->nama_kategori;
           
            $row[] = "<a href='".site_url('kategoribarang/kategoribarang_edit/'.$post->kategori_id)."' id='Editkategoribarang' class='btn btn-xs blue'><i class='fa fa-edit'></i></a>
                         <a href='".site_url('kategoribarang/hapus/'.$post->kategori_id)."' id='hapuskategoribarang'class='btn btn-xs red' ><i class='fa fa-trash'></i></a>";
            $data[] = $row;
        }        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->kategoribarangmodel->count_all(),
            "recordsFiltered" => $this->kategoribarangmodel->count_filtered($name_kategoribarang),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  

}
public function tambah_kategoribarang() { 
    $this->load->view('kategoribarang/kategoribarang_add');
    }

public function kategoribarang_edit_data($id_kategoribarang = NULL)
  {
     if( ! empty($id_kategoribarang))
    {
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_kategori', 'Nama Kategori', 'trim|required');
        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run() == TRUE)
            {

              $nama_kategoribarang      = $this->input->post('nama_kategori');                  
              $update    = $this->kategoribarangmodel->update_kategoribarang($id_kategoribarang,$nama_kategoribarang);
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
public function kategoribarang_edit($id_kategoribarang = NULL)
  {
    if( ! empty($id_kategoribarang))
    {    
            $dt['kategoribarang'] = $this->kategoribarangmodel->get_id_kategoribarang($id_kategoribarang)->row();
            $this->load->view('kategoribarang/kategoribarang_edit', $dt);
      }
    }
  
public function add_kategoribarang(){
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_kategoribarang', 'Nama Kategori Barang', 'trim|required');
        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run()) { 
           
             $data = array (
                      'nama_kategori' => $this->input->post('nama_kategoribarang'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' =>  $this->session->userdata('user_id')                  
             );
            $this->kategoribarangmodel->insert_all('brgkategori',$data);
            $data['success'] = true;
    }else{

                    foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
         }
         echo json_encode($data);
}
  
  public function hapus($id_kategoribarang)
  { 
        $hapus = $this->kategoribarangmodel->hapus_kategoribarang($id_kategoribarang);
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