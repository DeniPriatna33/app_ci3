<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Crud_serverside_v1 extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		# Load User
		$this->user = $this->db->get_where('tbl_login', ['email' => $this->session->userdata('email')])->row_array();
		# Load Model
		$this->load->model('Crud_serverside_v1_model','side');
	}

	public function index()
	{
		# Data Array
		$data = [
			'sub_judul' => 'Crud Serverside V1',
			'sub_judul1' => 'List',
			'user' => $this->user,
			'isi' =>	'crud_serverside_v1/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	function ajax_list() {
		$list = $this->side->get_datatables();
		
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $item) {
			$no++;
			$row = array();
			$row[] = $no;
			$row[] = $item->nama;
			$row[] = $item->nik;
			$row[] = $item->email;
			$row[] = $item->jurusan;
			// Add more columns as needed

			// Add CRUD buttons
			$row[] = '<a href="javascript:void(0)" class="btn btn-warning btn-sm fa fa-edit" onclick="edit_data(' . $item->id . ')"></a>
                      <a href="javascript:void(0)" class="btn btn-danger btn-sm fa fa-trash-alt" onclick="delete_data(' . $item->id . ')"></a>';

			$data[] = $row;
		}

		$output = array(
			"draw" => $_POST['draw'],
			"recordsTotal" => $this->side->count_all(),
			"recordsFiltered" => $this->side->count_filtered(),
			"data" => $data,
		);

		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->side->get_by_id($id);
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$data = array(
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'email' => $this->input->post('email'),
			'jurusan' => $this->input->post('jurusan'),
			// Add more columns as needed
		);
		
		$insert = $this->side->save($data);
		echo json_encode(array("status" => TRUE));
	}

	public function ajax_update()
	{
		$id = $this->input->post('id');
		$data = array(
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'email' => $this->input->post('email'),
			'jurusan' => $this->input->post('jurusan'),
			// Add more columns as needed
		);
		$this->side->update( $data,['id'=> $id]);
		echo json_encode(array("status" => TRUE));
	}

	public function ajax_delete($id)
	{
		$this->side->delete_by_id($id);
		echo json_encode(array("status" => TRUE));
	}

}

/* End of file Crud_serverside_v1.php */
