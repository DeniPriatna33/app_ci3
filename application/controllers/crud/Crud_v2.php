<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Crud_v2 extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		is_logged_in();
		# Load User
		$this->user = $this->db->get_where('tbl_login', ['email' => $this->session->userdata('email')])->row_array();
		# Load Model
		
	}

	public function index()
	{
		$mahasiswa = $this->db->get('tbl_mahasiswa')->result_array();
		# Data Array
		$data = [
			'sub_judul' => 'Crud V2',
			'sub_judul1' => 'List',
			'user' => $this->user,
			'mahasiswa' => $mahasiswa,
			'isi' =>	'crud_v2/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function add()
	{
		# Data Array
		$data = [
			'sub_judul' => 'Crud V2',
			'sub_judul1' => 'Add',
			'user' => $this->user,
			'isi' =>	'crud_v2/add',
		];
		$this->load->view('layout/wrapper', $data);
	}


	public function store()
	{
		$data = array(
			'nama' 		=> $this->input->post('nama', true),
			'nik' 		=> $this->input->post('nik', true),
			'email' 	=> $this->input->post('email', true),
			'jurusan' 	=> $this->input->post('jurusan', true),
		);

		$this->db->insert('tbl_mahasiswa', $data);
		redirect('crud/crud_v2');
	}

	function edit($id) {
		# Data Array
		$mahasiswa = $this->db->query("SELECT * FROM tbl_mahasiswa WHERE id = '$id'")->row_array();
		$jurusan = ['Teknik Informatika', 'Teknik Mesin', 'Teknik Planologi', 'Teknik Pangan', 'Teknik Lingkungan'];
		$data = [
			'sub_judul' => 'Crud V2',
			'sub_judul1' => 'Add',
			'user' => $this->user,
			'mahasiswa' => $mahasiswa,
			'jurusan' => $jurusan,
			'isi' =>	'crud_v2/edit',
		];
		$this->load->view('layout/wrapper', $data);
		
	}

	public function update()
	{
		$data = [
			'nama' 		=> $this->input->post('nama', true),
			'nik' 		=> $this->input->post('nik', true),
			'email' 	=> $this->input->post('email', true),
			'jurusan' 	=> $this->input->post('jurusan', true),
		];
		$this->db->where('id', $this->input->post('id'));
		$this->db->update('tbl_mahasiswa', $data);
		redirect('crud/crud_v2');
	}

	public function delete($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('tbl_mahasiswa');
		redirect('crud/crud_v2');
	}
}

/* End of file Crud_v1.php */
