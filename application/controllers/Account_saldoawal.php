<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account_saldoawal extends CI_Controller {
    Public function __construct() { 
        parent::__construct(); 
        $this->load->model('Account_saldoawalmodel','', TRUE);
         $this->load->model('headermodel');
      $this->load->helper(array('form', 'url'));
  }
  public function index() 
  {
     $data   = array(
            'content'   => 'account_saldoawal/account_saldoawal',
            'account'   => $this->db->query("select a.*,b.nama_header from account a left join accheader b on a.kode_header=b.kode_header order by a.kode_account asc")->result()
        );
    $data['user'] = $this->headermodel->satuan()->result();
    $this->load->view('container', $data);
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
              $update          = $this->Account_saldoawalmodel->update_account($headerid,$kode_account,$nama_account,$tipe);
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
            $dt['account'] = $this->Account_saldoawalmodel->get_id_account($kode_account)->row();
             $dt['list'] = $this->headermodel->satuan()->result();
            $this->load->view('account/account_edit', $dt);
      }
    }
  
public function simpan(){
   $no_array = 0;
           foreach($_POST['kode_account'] as $k)
                  {
           if( ! empty($k))
                    {  
     $in_payment = array (
            'tanggal'   => $tgl_po,
            'no_pi' => $_POST['kode_pi'][$no_array], 
            'form_no'=>   $no_po,     
            'auto_form_no'=>   $this->input->post('no_po'),         
            'kode_vendor' =>  $_POST['vendor'],
            'total_payment' =>  $_POST['jml_payment'][$no_array],
            'modiby' => $this->session->userdata('user_id'),
            'modidate' => date('Y-m-d H:i:s')
             );
        $this->db->insert('purchase_payment',$in_payment);  
                    }
                  }
}
  
  public function hapus($id_account)
  { 
        $hapus = $this->Account_saldoawalmodel->hapus_account($id_account);
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