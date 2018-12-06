<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Costumer extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('costumermodel','', TRUE);
  
              $this->load->helper(array('form', 'url'));
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'costumer/costumer'
        );
    $this->load->view('container', $data);
  }
  public function server_side() { 
    $name_costumer = $this->input->post('name_costumer');
        $posts = $this->costumermodel->get_datatables($name_costumer); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {            
            $no++;
            $row = array();
            $row[] = $post->kode_costumer;          
            $row[] = $post->nama_costumer;
            $row[] = $post->alamat;
            $row[] = $post->telepon;
            $row[] = $post->email;
            $row[] = "<a href='".site_url('costumer/costumer_edit/'.$post->id_costumer)."' id='Editcostumer' class='btn btn-xs blue'><i class='fa fa-edit'></i></a>
                         <a href='".site_url('costumer/hapus/'.$post->id_costumer)."' id='hapuscostumer'class='btn btn-xs red' ><i class='fa fa-trash'></i></a>";
            $data[] = $row;
        }        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->costumermodel->count_all(),
            "recordsFiltered" => $this->costumermodel->count_filtered($name_costumer),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  

}
public function tambah_costumer() { 
    $this->load->view('costumer/costumer_add');
    }

public function costumer_edit_data($id_costumer = NULL)
  {
     if( ! empty($id_costumer))
    {
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_costumer', 'Nama costumer', 'trim|required');
        $this->form_validation->set_rules('no_telp', 'No Telp', 'trim|required|numeric|max_length[40]');         
        $this->form_validation->set_rules('alamat', 'Alamat', 'trim|required');        

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run() == TRUE)
            {

              $nama      = $this->input->post('nama_costumer');
              $alamat    = $this->input->post('alamat');
              $telepon   = $this->input->post('no_telp');
              $email     = $this->input->post('email');
              $deskripsi = $this->input->post('deskripsi');
              $update    = $this->costumermodel->update_costumer($id_costumer, $nama, $alamat, $telepon, $deskripsi,$email);
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
public function costumer_edit($id_costumer = NULL)
  {
    if( ! empty($id_costumer))
    {    
            $dt['costumer'] = $this->costumermodel->get_id_costumer($id_costumer)->row();
            $this->load->view('costumer/costumer_edit', $dt);
      }
    }
  
public function add_costumer(){
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_costumer', 'Nama costumer', 'trim|required');
        $this->form_validation->set_rules('no_telp', 'No Telp', 'trim|required|numeric|max_length[40]');         
        $this->form_validation->set_rules('alamat', 'Alamat', 'trim|required');        

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run()) { 
           
             $data = array (
                      'kode_costumer'  =>$this->costumermodel->buat_kode(),
                      'nama_costumer' => $this->input->post('nama_costumer'),
                      'telepon' => $this->input->post('no_telp'),
                      'alamat' => $this->input->post('alamat'),
                      'email' => $this->input->post('email'),
                      'deskripsi' => $this->input->post('deskripsi'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' =>  $this->session->userdata('user_id')                  
             );
            $this->costumermodel->insert_all('tb_costumer',$data);
            $data['success'] = true;
    }else{

                    foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
         }
         echo json_encode($data);
}
  
  public function hapus($id_costumer)
  { 
        $hapus = $this->costumermodel->hapus_costumer($id_costumer);
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