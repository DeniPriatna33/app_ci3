<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Crud_v1 extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		is_logged_in();
		# Load User
		$this->user = $this->db->get_where('tbl_login', ['email' => $this->session->userdata('email')])->row_array();
		# Load Model
		$this->load->model('Mahasiswa_model', 'mm');
	}

	public function index()
	{
		if ($this->input->post('submit')) {
			// $mahasiswa = $this->mm->cariData();
			$mahasiswa = $this->input->post('keyword');
			$this->session->set_userdata('keyword', $mahasiswa);
		} else {
			$mahasiswa = $this->session->userdata('keyword');
		}

		$this->db->like('lower(nama)', strtoupper($mahasiswa));
		$this->db->or_like('lower(jurusan)', strtoupper($mahasiswa));
		$this->db->or_like('lower(nik)', strtoupper($mahasiswa));
		$this->db->or_like('lower(email)', strtoupper($mahasiswa));
		$this->db->from('tbl_mahasiswa');
		$config['total_rows'] = $this->db->count_all_results();
		// $config['total_rows'] = $this->mm->count_all_data();

		#Pagination
		$config['base_url']	= base_url('crud/crud_v1/index');
		$total_rows = $config['total_rows'];
		$config['per_page'] = 10;
		// $config['num_links'] = 5;
		$this->pagination->initialize($config);

		# Memanggil fungsi get_all di model
		$start = $this->uri->segment(4);
		$mahasiswa = $this->mm->get_all($config['per_page'], $start, $mahasiswa);

		# Data Array
		$data = [
			'sub_judul' => 'Crud V1',
			'sub_judul1' => 'List',
			'user' => $this->user,
			'mahasiswa' => $mahasiswa,
			'start' => $start,
			'total_rows' => $total_rows,
			'isi' =>	'crud_v1/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function add()
	{
		# Form Validasi
		$this->form_validation->set_rules('nama', 'Nama', 'trim|required');
		$this->form_validation->set_rules('nik', 'NIK', 'trim|required|numeric');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');

		# Jika Form Validasi nya salah masuk ke view add
		if ($this->form_validation->run() ==  FALSE) {
			$data = [
				'sub_judul' => 'Crud V1',
				'sub_judul1' => 'Add',
				'user' => $this->user,
				'isi' =>	'crud_v1/add',
			];
			$this->load->view('layout/wrapper', $data);
		} else {
			# Jika Benar Simpan Data
			$this->mm->tambah_data();

			# Kasih Alert / info
			$this->session->set_flashdata('message', 'Ditambah!');
			redirect('crud/crud_v1');
		}
	}

	public function delete_data($id)
	{
		# Memanggil Fungsi Delete_data di Model
		$this->mm->delete_data($id);

		# Kasih Alert / info
		$this->session->set_flashdata('message', 'Dihapus!');
		redirect('crud/crud_v1');
	}

	public function show($id)
	{
		# Memanggil fungsi get id di model
		$show = $this->mm->get_id($id);

		$data = [
			'sub_judul' => 'Crud V1',
			'sub_judul1' => 'Add',
			'user' => $this->user,
			'show' => $show,
			'isi' =>	'crud_v1/show',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function update($id)
	{
		# Form Validasi
		$this->form_validation->set_rules('nama', 'Nama', 'trim|required');
		$this->form_validation->set_rules('nik', 'NIK', 'trim|required|numeric');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');

		# Jika Form Validasi nya salah masuk ke view add
		if ($this->form_validation->run() ==  FALSE) {
			$mahasiswa = $this->mm->get_id($id);
			$jurusan = ['Teknik Informatika', 'Teknik Mesin', 'Teknik Planologi', 'Teknik Pangan', 'Teknik Lingkungan'];

			$data = [
				'sub_judul' => 'Crud V1',
				'sub_judul1' => 'Edit',
				'user' => $this->user,
				'mahasiswa' => $mahasiswa,
				'jurusan' => $jurusan,
				'isi' =>	'crud_v1/update',
			];
			$this->load->view('layout/wrapper', $data);
		} else {
			# Jika Benar Simpan Data
			$this->mm->update_data();

			# Kasih Alert / info
			$this->session->set_flashdata('message', 'Diupdate!');
			redirect('crud/crud_v1');
		}
	}
}

/* End of file Crud_v1.php */
