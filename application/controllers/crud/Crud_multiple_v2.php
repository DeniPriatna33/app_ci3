<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Crud_multiple_v2 extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		# Load User
		$this->user = $this->db->get_where('tbl_login', ['email' => $this->session->userdata('email')])->row_array();
		# Load Model
		$this->load->model('Crud_multiple_v2_model','side');
	}

	public function index()
	{
		# Data Array
		$data = [
			'sub_judul' => 'Crud Multiple V2',
			'sub_judul1' => 'List',
			'user' => $this->user,
			'isi' =>	'crud_multiple_v2/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function get_records()
	{
		
		$limit = $this->input->post('length');
		$start = $this->input->post('start');
		$order = isset($this->input->post('order')[0]['column'])? $this->input->post('order')[0]['column']:'';
		$dir = isset($this->input->post('order')[0]['dir'])? $this->input->post('order')[0]['dir']:'';
		$q      = $this->input->post('search')['value'];


		$total_records = $this->side->get_total_records($q);

		$records = $this->side->get_records($limit, $start, $order, $dir,$q);
		$data = array();
		$no = $_POST['start'];
		foreach ($records as $record) {
			$no++;
			$data[] = array(
				// $record->id,
				"<td><input type='checkbox' class='check-item' name='id[]' onclick='click_check()' value='".$record->id."' data-id='".$record->id."' data-nama='".$record->nama."' data-nik='".$record->nik."' data-email='".$record->email."' data-jurusan='".$record->jurusan."' ></td>",
				$no,
				$record->nama,
				$record->nik,
				$record->email,
				$record->jurusan,
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

	public function create_all()
	{
		$nama = $this->input->post('nama'); // Ambil data nama  dan masukkan ke variabel nama 
		$nik = $this->input->post('nik'); 
		$email = $this->input->post('email');
		$jurusan = $this->input->post('jurusan');

		# Save Multiple V2
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
		echo json_encode(array('status' => true, 'message' => 'Record updated successfully'));
	}

	public function edit_all()
	{
		$data['data'] = $this->input->post('data');
		$data['jurusan'] = ['Teknik Informatika', 'Teknik Mesin', 'Teknik Planologi', 'Teknik Pangan', 'Teknik Lingkungan','Teknik Industri'];
		echo json_encode($data);

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

	public function update_all()
	{
		$id = $this->input->post('id');
		$nama = $this->input->post('nama'); // Ambil data nama  dan masukkan ke variabel nama 
		$nik = $this->input->post('nik'); 
		$email = $this->input->post('email');
		$jurusan = $this->input->post('jurusan');
		$type = $this->input->post('type');

		$arrayku1 = [];
		$arrayku2 = [];
		foreach ($nama as $row => $data) {
			if (!($nama[$row] == '')) {
				if ($type[$row]=='edit') {
					$arraytmp = array(
						"id"   			=> $id[$row],
						"nama"   		=> $nama[$row],
						"nik"    		=> $nik[$row],
						"email"         => $email[$row],
						"jurusan"       => $jurusan[$row],
					);
					array_push($arrayku2, (object)$arraytmp);
				}else{
					$arraytmp = array(
						"nama"   		=> $nama[$row],
						"nik"    		=> $nik[$row],
						"email"         => $email[$row],
						"jurusan"       => $jurusan[$row],
					);
					array_push($arrayku1, (object)$arraytmp);
				}
			}
		}
		$this->side->create_record($arrayku1);
		$this->side->update_record_all($id, $arrayku2, 'id');
		echo json_encode(array('status' => true, 'message' => 'Record Updated all successfully'));
		
	}


	function delete_all() {
		$id = $this->input->post('id');
		$this->side->delete_record_all($id);
		echo json_encode(array('status' => true, 'message' => 'Record deleted all successfully'));
	}

	public function delete()
	{
		$id = $this->input->post('id');
		$this->side->delete_record($id);
		echo json_encode(array('status' => true, 'message' => 'Record deleted successfully'));
	}

}

/* End of file Crud_multiple_v2.php */
