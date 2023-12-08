<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Crud_multiple_v1 extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		# Load User
		$this->user = $this->db->get_where('tbl_login', ['email' => $this->session->userdata('email')])->row_array();
		# Load Model
		$this->load->model('Crud_multiple_v1_model','side');
	}

	public function index()
	{
		# Data Array
		$data = [
			'sub_judul' => 'Crud Multiple V1',
			'sub_judul1' => 'List',
			'user' => $this->user,
			'isi' =>	'crud_multiple_v1/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function add()
	{
		# Data Array
		$data = [
			'sub_judul' => 'Crud Multiple V1',
			'sub_judul1' => 'Tambah',
			'user' => $this->user,
			'isi' =>	'crud_multiple_v1/add',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function get_records()
	{
		
		$limit = $this->input->post('length');
		$start = $this->input->post('start');
		$order = $this->input->post('order')[0]['column'];
		$dir = $this->input->post('order')[0]['dir'];

		$total_records = $this->side->get_total_records();

		$records = $this->side->get_records($limit, $start, $order, $dir);

		$data = array();
		$no = $_POST['start'];
		foreach ($records as $record) {
			$no++;
			$data[] = array(
				// $record->id,
				$no,
				$record->nama,
				$record->nik,
				$record->email,
				$record->jurusan,
				// Add more fields as needed
				'<a href="javascript:void(0)" class="btn btn-warning btn-sm fa fa-edit" onclick="edit_data(' . $record->id . ')"></a>
				<a href="javascript:void(0)" class="btn btn-danger btn-sm fa fa-trash-alt" onclick="delete_data(' . $record->id . ')"></a>'
			);
		}

		$response = array(
			'draw' => $this->input->post('draw'),
			'recordsTotal' => $total_records,
			'recordsFiltered' => $total_records,
			'data' => $data
		);

		echo json_encode($response);
	}

	public function create()
	{
		

		$nama = $this->input->post('nama'); // Ambil data nis dan masukkan ke variabel nis
		$nik = $this->input->post('nik'); 
		$email = $this->input->post('email');
		$jurusan = $this->input->post('jurusan');

		$arrayku = [];
		foreach ($nama as $row=>$data) {
			$arraytmp = array(
				"nama"   		=> $nama[$row],
				"nik"    		=> $nik[$row],
				"email"         => $email[$row],
				"jurusan"       => $jurusan[$row],
			);
			array_push($arrayku, (object)$arraytmp);
		}

		
		$this->side->create_record($arrayku);
		# Kasih Alert / info
		$this->session->set_flashdata('message', 'Ditambah!');
		redirect('crud/crud_multiple_v1');
	}

	public function ajax_edit($id)
	{
		$data = $this->side->get_by_id($id);
		echo json_encode($data);
	}

	public function update()
	{
		$id = $this->input->post('id');
		$data = array(
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'email' => $this->input->post('email'),
			'jurusan' => $this->input->post('jurusan'),
		);

		$this->side->update_record($id, $data);
		echo json_encode(array('status' => true, 'message' => 'Record updated successfully'));
	}

	public function delete()
	{
		$id = $this->input->post('id');
		$this->side->delete_record($id);
		echo json_encode(array('status' => true, 'message' => 'Record deleted successfully'));
	}

}

/* End of file Crud_multiple_v1.php */
