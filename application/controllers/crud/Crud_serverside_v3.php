<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Crud_serverside_v3 extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		# Load User
		$this->user = $this->db->get_where('tbl_login', ['email' => $this->session->userdata('email')])->row_array();
		# Load Model
		$this->load->model('Crud_serverside_v3_model','side');
	}

	public function index()
	{
		# Data Array
		$data = [
			'sub_judul' => 'Crud Serverside V3',
			'sub_judul1' => 'List',
			'user' => $this->user,
			'isi' =>	'crud_serverside_v3/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function get_data() {
		$result = $this->side->getDataTable();
		$data = [];
		$no = $_POST['start'];
		foreach ($result as $dt) {
			$row = [];
			$row[] = ++$no;
			$row[] = $dt->nama;
			$row[] = $dt->nik;
			$row[] = $dt->email;
			$row[] = $dt->jurusan;
			$row[] = 'aksi';
			$data[] = $row;
		}

		$output = [
			"draw" => $_POST['draw'],
			"recordsTotal" => $this->side->count_all_data(),
            "recordsFiltered" => $this->side->count_filltered_data(),
            "data" => $data,
		];

		$this->output->set_content_type("application/json")->set_output(json_encode($output));
	}

	

	

}

/* End of file Crud_serverside_v3.php */
