<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Crud_serverside_v2 extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		# Load User
		$this->user = $this->db->get_where('tbl_login', ['email' => $this->session->userdata('email')])->row_array();
		# Load Model
		$this->load->model('Crud_serverside_v2_model','side');
	}

	public function index()
	{
		# Data Array
		$data = [
			'sub_judul' => 'Crud Serverside V2',
			'sub_judul1' => 'List',
			'user' => $this->user,
			'isi' =>	'crud_serverside_v2/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function get_records()
	{
		// Buat Order BY
		$columns = [
			0 => 'id',
			1 => 'nama',
			2 => 'nik',
			3 => 'email',
			4 => 'jurusan',
			5 => '',
		];

		$limit 	= $this->input->post('length');
		$start 	= $this->input->post('start');
		$order 	= $columns[$this->input->post('order')[0]['column']];
		$dir 	= $this->input->post('order')[0]['dir'];
		$q      = $this->input->post('search')['value'];

		$total_records = $this->side->get_total_records($q);

		$records = $this->side->get_records($limit, $start, $order, $dir,$q);

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
		$data = array(
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'email' => $this->input->post('email'),
			'jurusan' => $this->input->post('jurusan'),
		);

		$this->side->create_record($data);
		echo json_encode(array('status' => true, 'message' => 'Record created successfully'));
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
			'nama' => $this->input->post('nama',true),
			'nik' => $this->input->post('nik',true),
			'email' => $this->input->post('email',true),
			'jurusan' => $this->input->post('jurusan',true),
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

/* End of file Crud_serverside_v2.php */
