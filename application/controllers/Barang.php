<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Barang extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('barangmodel','', TRUE);
        $this->load->helper(array('form', 'url'));
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'barang/barang_data'
     );
    $this->load->view('container', $data);
  }
  public function server_side() { 
        $nama_barang = $this->input->post('nama_barang');
        $posts = $this->barangmodel->get_datatables($nama_barang); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {            
            $no++;
            $row = array();
            $row[] = $post->kode_barang;          
            $row[] = $post->nama_barang;
            $row[] = $post->nama_satuan;
            $row[] = $post->nama_account;
            $row[] = "<a href='".site_url('barang/barang_edit/'.$post->id_barang)."' id='Editbarang' class='btn btn-xs blue'><i class='fa fa-edit'></i></a>
                         <a href='".site_url('barang/hapus/'.$post->id_barang)."' id='hapusbarang'class='btn btn-xs red' ><i class='fa fa-trash'></i></a>";
            $data[] = $row;
        }        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->barangmodel->count_all(),
            "recordsFiltered" => $this->barangmodel->count_filtered($nama_barang),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  

}
public function tambah_barang() { 
    $this->load->view('barang/barang_add');
    }

public function barang_edit_data($id_barang = NULL)
  {
     if( ! empty($id_barang))
    {
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_barang', 'Nama barang', 'trim|required');
        $this->form_validation->set_rules('no_telp', 'No Telp', 'trim|required|numeric|max_length[40]');         
        $this->form_validation->set_rules('alamat', 'Alamat', 'trim|required');        

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run() == TRUE)
            {

              $nama      = $this->input->post('nama_barang');
              $alamat    = $this->input->post('alamat');
              $telepon   = $this->input->post('no_telp');
              $email     = $this->input->post('email');
              $deskripsi = $this->input->post('deskripsi');
              $update    = $this->barangmodel->update_barang($id_barang, $nama, $alamat, $telepon, $deskripsi,$email);
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
public function barang_edit($id_barang = NULL)
  {
    if( ! empty($id_barang))
    {    
            $dt['barang'] = $this->barangmodel->get_id_barang($id_barang)->row();
            $this->load->view('barang/barang_edit', $dt);
      }
    }
  
public function add_barang(){
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_barang', 'Nama barang', 'trim|required');
        $this->form_validation->set_rules('no_telp', 'No Telp', 'trim|required|numeric|max_length[40]');         
        $this->form_validation->set_rules('alamat', 'Alamat', 'trim|required');        

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run()) { 
           
             $data = array (
                      'kode_barang'  =>$this->barangmodel->buat_kode(),
                      'nama_barang' => $this->input->post('nama_barang'),
                      'telepon' => $this->input->post('no_telp'),
                      'alamat' => $this->input->post('alamat'),
                      'email' => $this->input->post('email'),
                      'deskripsi' => $this->input->post('deskripsi'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' =>  $this->session->userdata('user_id')                  
             );
            $this->barangmodel->insert_all('tb_barang',$data);
            $data['success'] = true;
    }else{

                    foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
         }
         echo json_encode($data);
}
  
  public function hapus($id_barang)
  { 
        $hapus = $this->barangmodel->hapus_barang($id_barang);
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