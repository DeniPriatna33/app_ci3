<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
        
class Crud_ajax_v2 extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
		is_logged_in();
		# Load User
		$this->user = $this->db->get_where('tbl_login', ['email' => $this->session->userdata('email')])->row_array();
		# Load Model
		$this->load->model('crud_ajax_v2_model', 'crud_ajax_v2');
		
    }

    public function index(){
		# Data Array
		$data = [
			'sub_judul' => 'Crud Ajax V2',
			'sub_judul1' => 'List',
			'user' => $this->user,
			'isi' =>	'crud_ajax_v2/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	function save_data(){
		$data = [
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'email' => $this->input->post('email'),
			'jurusan' => $this->input->post('jurusan'),
			// Add more fields as per your table structure
		];
		
		$insert_id = $this->crud_ajax_v2->create($data);
		if ($insert_id) {
			echo json_encode(array('status' => true, 'message' => 'Record created successfully.'));
		} else {
			echo json_encode(array('status' => false, 'message' => 'Failed to create record.'));
		}
	}

	public function read()
	{
		$data = $this->crud_ajax_v2->read();
		echo json_encode($data);
	}

	public function read_id()
	{
		$id = $this->input->post('id');
		$data = $this->crud_ajax_v2->read_id($id);
		echo json_encode($data);
	}

	public function update_data() {
		$id = $this->input->post('id');
		
		$data = [
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'email' => $this->input->post('email'),
			'jurusan' => $this->input->post('jurusan'),	
		];
		$result = $this->crud_ajax_v2->update($id, $data);
		if ($result) {
			echo json_encode(array('status' => true, 'message' => 'Record updated successfully.'));
		} else {
			echo json_encode(array('status' => false, 'message' => 'Failed to update record.'));
		}
	}

	function delete() {
		$id = $this->input->post('id');
		$result = $this->crud_ajax_v2->delete($id);
		if ($result) {
			echo json_encode(array('status' => true, 'message' => 'Record deleted successfully.'));
		} else {
			echo json_encode(array('status' => false, 'message' => 'Failed to delete record.'));
		}
	}
}


/* End of file crud_ajax_v2.php and path \application\controllers\crud_ajax\crud_ajax_v2.php */
