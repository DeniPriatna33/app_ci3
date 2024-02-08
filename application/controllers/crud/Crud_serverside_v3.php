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
			$row[] = '<a class="btn btn-warning btn-sm" href="javascript:void(0)" title="Edit" onclick="edit_data('."'".$dt->id."','edit'".')"><i class="fa fa-edit"></i></a>
					  <a class="btn btn-danger btn-sm" href="javascript:void(0)" title="Hapus" onclick="delete_data('."'".$dt->id."'".')"><i class="fa fa-trash"></i></a>';
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

	public function add() {
		$this->_validation();
		$nama = $this->input->post('nama', true);
		$nik = $this->input->post('nik', true);
		$email = $this->input->post('email', true);
		$jurusan = $this->input->post('jurusan', true);

		$data = [
			'nama' => $nama,
			'nik' => $nik,
			'email' => $email,
			'jurusan' => $jurusan,
		];
		
		$insert = $this->side->add_data($data);

		if ($insert) {
			$output = ['status' => true, 'message' => 'Berhasil menambahkan data'];
		} else {
			$output = ['status' => false, 'message' => 'Gagal menambahkan data'];
		}

		$this->output->set_content_type('application/json')->set_output(json_encode($output));
	}

	public function byid($id) {
		$data = $this->side->get_data_by_id($id);
		
		if ($data) {
			$output = ['status' => true, 'data' => $data];
		} else {
			$output = ['status' => false, 'message' => 'Data tidak ditemukan'];
		}

		$this->output->set_content_type('application/json')->set_output(json_encode($output));
	}

	public function update() {
		$this->_validation();

		$id = $this->input->post('id', true);
		$nama = $this->input->post('nama', true);
		$nik = $this->input->post('nik', true);
		$email = $this->input->post('email', true);
		$jurusan = $this->input->post('jurusan', true);

		$data = [
			'nama' => $nama,
			'nik' => $nik,
			'email' => $email,
			'jurusan' => $jurusan,
		];
		
		$update = $this->side->update_data($id, $data);

		if ($update >= 0) {
			$output = ['status' => true, 'message' => 'Data berhasil diperbarui'];
		} else {
			$output = ['status' => false, 'message' => 'Gagal memperbarui data'];
		}

		$this->output->set_content_type('application/json')->set_output(json_encode($output));
	}

	
	public function delete($id) {
		$delete = $this->side->delete_data($id);

		if ($delete) {
			$output = ['status' => true, 'message' => 'Data berhasil dihapus'];
		} else {
			$output = ['status' => false, 'message' => 'Gagal menghapus data'];
		}

		$this->output->set_content_type('application/json')->set_output(json_encode($output));
	}
	
	
	public function _validation() {
		$data = array();
		$data['error_string'] = array();
		$data['inputerror'] = array();
		$data['status'] = true;

		if ($this->input->post('nama') == '') {
			$data['inputerror'][] = 'nama';
			$data['error_string'][] = 'Nama Wajib Diisi';
			$data['status'] = false;
		}

		if ($this->input->post('nik') == '') {
			$data['inputerror'][] = 'nik';
			$data['error_string'][] = 'Nik Wajib Diisi';
			$data['status'] = false;
		}

		if ($this->input->post('email') == '') {
			$data['inputerror'][] = 'email';
			$data['error_string'][] = 'Email Wajib Diisi';
			$data['status'] = false;
		}

		if ($this->input->post('jurusan') == '') {
			$data['inputerror'][] = 'jurusan';
			$data['error_string'][] = 'Jurusan Wajib Diisi';
			$data['status'] = false;
		}

		if ($data['status'] == false) {
			echo json_encode($data);
			exit();
		}
	}
	

}

/* End of file Crud_serverside_v3.php */
