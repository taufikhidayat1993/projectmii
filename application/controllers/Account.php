<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('accountmodel','', TRUE);
         $this->load->model('headermodel');
      $this->load->helper(array('form', 'url'));
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'account/account'
        );
    $data['user'] = $this->headermodel->satuan()->result();
    $this->load->view('container', $data);
  }
  public function server_side() { 
    $nama_account = $this->input->post('nama_account');
     $header = $this->input->post('header');
        $posts = $this->accountmodel->get_datatables($nama_account,$header); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {            
            $no++;
            $row = array();
            $row[] = $post->kode_account;          
            $row[] = $post->nama_account;
            $row[] = $post->tipe;
            $row[] = $post->nama_header;
            $row[] = "<a href='".site_url('account/edit/'.$post->kode_account)."' id='Editaccount' class='btn btn-xs blue'><i class='fa fa-edit'></i></a>
                         <a href='".site_url('account/hapus/'.$post->kode_account)."' id='hapusaccount'class='btn btn-xs red' ><i class='fa fa-trash'></i></a>";
            $data[] = $row;
        }
        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->accountmodel->count_all(),
            "recordsFiltered" => $this->accountmodel->count_filtered($nama_account,$header),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
  

}
public function add_account() { 
  $data['list'] = $this->headermodel->satuan()->result();
    $this->load->view('account/account_add',$data);
    }

public function account_edit_data($id_account = NULL)
  {
     if( ! empty($id_account))
    {
        $this->load->library('form_validation');                
           $this->form_validation->set_rules('nama_account', 'Nama Account', 'trim|required');
        $this->form_validation->set_rules('kode_account', 'No Account', 'trim|required');                  
        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run() == TRUE)
            {
              $headerid      = $this->input->post('headerid');
              $kode_account      = $this->input->post('kode_account');
              $nama_account    = $this->input->post('nama_account');
              $tipe            = $this->input->post('tipe');
              $update          = $this->accountmodel->update_account($headerid,$kode_account,$nama_account,$tipe);
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
public function edit($kode_account = NULL)
  {
    if( ! empty($kode_account))
    {    
            $dt['account'] = $this->accountmodel->get_id_account($kode_account)->row();
             $dt['list'] = $this->headermodel->satuan()->result();
            $this->load->view('account/account_edit', $dt);
      }
    }
  
public function account_add(){
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_account', 'Nama Account', 'trim|required');
        $this->form_validation->set_rules('kode_account', 'No Account', 'trim|required');         
         

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run()) {            
             $data = array (
                      'nama_account' => $this->input->post('nama_account'),
                      'kode_account' => $this->input->post('kode_account'),
                      'headerid' => $this->input->post('headerid'),
                      'tipe' => $this->input->post('tipe'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' => ""                   
             );
            $this->accountmodel->insert_all('account',$data);
            $data['success'] = true;
    }else{

                    foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
         }
         echo json_encode($data);
}
  
  public function hapus($id_account)
  { 
        $hapus = $this->accountmodel->hapus_account($id_account);
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