<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Vendor extends CI_Controller {
   	Public function __construct() { 
        parent::__construct(); 
        $this->load->model('vendormodel','', TRUE);
        $this->load->model('Purchaserequest');
              $this->load->helper(array('form', 'url'));
	}
	public function index() 
	{
		 $data   = array(
            'content'   => 'vendor/vendor'
        );
		$this->load->view('container', $data);
	}
	public function server_side() {	

		$name_vendor = $this->input->post('name_vendor');
        

        
        $posts = $this->vendormodel->get_datatables($name_vendor); 

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {
            
            $no++;
            $row = array();
            $row[] = $post->kode_vendor;
          
            $row[] = $post->nama_vendor;
			  $row[] = $post->alamat;
            $row[] = $post->telepon;
            $row[] = $post->email;
               $row[] = "<a href='".site_url('vendor/vendor_edit/'.$post->id_vendor)."' id='Editvendor' class='btn btn-xs blue'><i class='fa fa-edit'></i></a>
                         <a href='".site_url('vendor/hapus/'.$post->id_vendor)."' id='hapusvendor'class='btn btn-xs red' ><i class='fa fa-trash'></i></a>";
            $data[] = $row;
        }
        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->vendormodel->count_all(),
            "recordsFiltered" => $this->vendormodel->count_filtered($name_vendor),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
	

}
public function tambah_vendor() { 
    $this->load->view('vendor/vendor_add');
    }

public function vendor_edit_data($id_vendor = NULL)
  {
     if( ! empty($id_vendor))
    {
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_vendor', 'Nama Vendor', 'trim|required');
        $this->form_validation->set_rules('no_telp', 'No Telp', 'trim|required|numeric|max_length[40]');         
        $this->form_validation->set_rules('alamat', 'Alamat', 'trim|required');        

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run() == TRUE)
            {

              $nama      = $this->input->post('nama_vendor');
              $alamat    = $this->input->post('alamat');
              $telepon   = $this->input->post('no_telp');
              $email     = $this->input->post('email');
              $deskripsi = $this->input->post('deskripsi');
              $update    = $this->vendormodel->update_vendor($id_vendor, $nama, $alamat, $telepon, $deskripsi,$email);
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
public function vendor_edit($id_vendor = NULL)
  {
    if( ! empty($id_vendor))
    {    
            $dt['vendor'] = $this->vendormodel->get_id_vendor($id_vendor)->row();
            $this->load->view('vendor/vendor_edit', $dt);
      }
    }
  
public function add_vendor(){
        $this->load->library('form_validation');                
        $this->form_validation->set_rules('nama_vendor', 'Nama Vendor', 'trim|required');
        $this->form_validation->set_rules('no_telp', 'No Telp', 'trim|required|numeric|max_length[40]');         
        $this->form_validation->set_rules('alamat', 'Alamat', 'trim|required');        

        $this->form_validation->set_error_delimiters('<span class=help-block help-block-error">', '</span>');
              $this->form_validation->set_message('required','%s harus diisi !');
                $this->form_validation->set_message('numeric','%s harus angka !');
            if($this->form_validation->run()) { 
           
             $data = array (
                      'kode_vendor'  =>$this->vendormodel->buat_kode(),
                      'nama_vendor' => $this->input->post('nama_vendor'),
                      'telepon' => $this->input->post('no_telp'),
                      'alamat' => $this->input->post('alamat'),
                      'email' => $this->input->post('email'),
                      'deskripsi' => $this->input->post('deskripsi'),
                      'modidate'=> date('Y-m-d H:i:s'),
                      'modiby' => ""                   
             );
            $this->vendormodel->insert_all('tb_supplier',$data);
            $data['success'] = true;
    }else{

                    foreach ($_POST as $key => $value) {
                       $data['messages'][$key] = form_error($key);
                     }
         }
         echo json_encode($data);
}
	
  public function hapus($id_vendor)
  { 
        $hapus = $this->vendormodel->hapus_vendor($id_vendor);
        if($hapus)
        {
          echo json_encode(array(
            "pesan" => " Data berhasil dihapus 
          "));
        }
        else
        {
          echo json_encode(array(
            "pesan" => "Terjadi kesalahan, coba lagi
          "));
        }
      
  }
}