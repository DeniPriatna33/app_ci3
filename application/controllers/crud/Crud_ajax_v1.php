<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
        
class Crud_ajax_v1 extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
		is_logged_in();
		# Load User
		$this->user = $this->db->get_where('tbl_login', ['email' => $this->session->userdata('email')])->row_array();
		# Load Model
		$this->load->model('crud_ajax_v1_model', 'crud_ajax_v1');
		
    }

    public function index(){
		# Data Array
		$data = [
			'sub_judul' => 'Crud Ajax V1',
			'sub_judul1' => 'List',
			'user' => $this->user,
			'isi' =>	'crud_ajax_v1/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function tampilMahasiswa() {
		$data = [
			'mahasiswa' => $this->crud_ajax_v1->get_all()
		];
		$this->load->view('crud_ajax_v1/data-mahasiswa', $data);
	}

	function tambah()
	{
		$data = [
			'aksi' =>	$this->input->post('aksi'),
			'isi' =>	'crud_ajax_v1/tambah',
		];
		$this->load->view('crud_ajax_v1/tambah-mahasiswa', $data);
	}

	function save_data(){
		$data = [
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'email' => $this->input->post('email'),
			'jurusan' => $this->input->post('jurusan'),
		];
		$this->db->insert('tbl_mahasiswa', $data);
	}

	public function edit() {

		$id	= $this->input->post('id');
		$jurusan = ['Teknik Informatika', 'Teknik Mesin', 'Teknik Planologi', 'Teknik Pangan', 'Teknik Lingkungan'];
		$data = [
			'mahasiswa' => $this->crud_ajax_v1->get_id($id),
			'jurusan' => $jurusan,
			'isi' =>	'crud_ajax_v1/edit',
		];
		$this->load->view('crud_ajax_v1/edit-mahasiswa', $data);
	}

	public function update_data() {
		$id = $this->input->post('id');
		
		$data = [
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'email' => $this->input->post('email'),
			'jurusan' => $this->input->post('jurusan'),	
		];
		$this->db->where('id', $id);
		$this->db->update('tbl_mahasiswa', $data);
	}

	function hapus() {
		$id = $this->input->post('id');
		$this->db->delete('tbl_mahasiswa',['id'=>$id]);
	}
}


/* End of file Crud_ajax_v1.php and path \application\controllers\crud_ajax\Crud_ajax_v1.php */
