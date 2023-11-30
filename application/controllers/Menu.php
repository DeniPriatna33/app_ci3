<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Menu extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->load->model('Menu_model', 'menu');
		is_logged_in();
	}

	public function index()
	{
		$user = $this->db->get_where('tbl_login', [
			'email' => $this->session->userdata('email')
		])->row_array();

		$menu = $this->db->get('tbl_login_menu')->result_array();

		$this->form_validation->set_rules('menu', 'menu', 'trim|required');


		if ($this->form_validation->run() == FALSE) {
			$data = [
				'sub_judul' => 'Menu Management',
				'sub_judul1' => 'menu',
				'user' => $user,
				'menu' => $menu,
				'isi' =>	'menu/index',
			];
			$this->load->view('layout/wrapper', $data);
		} else {
			$id = $this->input->post('id');
			$menu = $this->input->post('menu');

			# Bila Tidak Aad id dia tambah data
			if (!$id) {
				$data = [
					'menu' => $menu,
				];
				$this->db->insert('tbl_login_menu', $data);

				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">New Menu Add!</div>');
			} else {
				#Bila Ada datanya di update
				$this->db->set('menu', $menu);
				$this->db->where('id', $id);
				$this->db->update('tbl_login_menu');
				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Menu has been change!</div>');
			}
			redirect('menu');
		}
	}

	public function delete_menu($id)
	{
		$this->db->delete('tbl_login_menu', ['id' => $id]);
		$this->session->set_flashdata('message', '<div class="alert alert-danger"> <i class="ti-user"></i> Delete Data Success!
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
			</div>');
		redirect('menu');
	}

	function submenu()
	{
		$user = $this->db->get_where('tbl_login', [
			'email' => $this->session->userdata('email')
		])->row_array();

		$subMenu = $this->menu->getSubMenu();

		$menu = $this->db->get('tbl_login_menu')->result_array();

		$this->form_validation->set_rules('title', 'Title', 'required');
		$this->form_validation->set_rules('menu_id', 'Menu', 'required');
		$this->form_validation->set_rules('url', 'URL', 'required');
		$this->form_validation->set_rules('icon', 'icon', 'required');
		if ($this->form_validation->run() ==  FALSE) {
			$data = [
				'sub_judul' => 'subMenu Management',
				'sub_judul1' => 'menu',
				'user' => $user,
				'subMenu' => $subMenu,
				'menu' => $menu,
				'isi' =>	'menu/submenu',
			];
			$this->load->view('layout/wrapper', $data);
		} 
		// else {
		// 	$data = [
		// 		'title' => $this->input->post('title'),
		// 		'menu_id' => $this->input->post('menu_id'),
		// 		'url' => $this->input->post('url'),
		// 		'icon' => $this->input->post('icon'),
		// 		'is_active' => $this->input->post('is_active'),
		// 		'urutan' => $this->input->post('urutan')
		// 	];
		// 	$this->db->insert('tbl_login_sub_menu', $data);
		// 	$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">New sub menu added!</div>');
		// 	redirect('menu/submenu');
		// }
	}

	function read_id()
	{
		$id = $this->input->post('id');
		$edit = $this->db->query("SELECT * FROM tbl_login_sub_menu WHERE id = '$id'")->row();
		echo json_encode($edit);
	}

	function tambah_sub_menu() {
		$data = [
			'title' => $this->input->post('title'),
			'menu_id' => $this->input->post('menu_id'),
			'url' => $this->input->post('url'),
			'icon' => $this->input->post('icon'),
			'is_active' => $this->input->post('is_active'),
			'urutan' => $this->input->post('urutan')
		];


		$result = $this->db->insert('tbl_login_sub_menu', $data);
		
		if ($result) {
			echo json_encode(array('status' => true, 'message' => 'Record updated successfully.'));
		} else {
			echo json_encode(array('status' => false, 'message' => 'Failed to update record.'));
		}
	}
	function update_sub_menu() {
		$id = $this->input->post('id');
		$data = [
			'title' => $this->input->post('title'),
			'menu_id' => $this->input->post('menu_id'),
			'url' => $this->input->post('url'),
			'icon' => $this->input->post('icon'),
			'is_active' => $this->input->post('is_active'),
			'urutan' => $this->input->post('urutan')
		];
		

		$this->db->where('id', $id);
		$result = $this->db->update('tbl_login_sub_menu', $data);
		
		if ($result) {
			echo json_encode(array('status' => true, 'message' => 'Record updated successfully.'));
		} else {
			echo json_encode(array('status' => false, 'message' => 'Failed to update record.'));
		}
	}

	public function delete_submenu($id)
	{
		$this->db->delete('tbl_login_sub_menu', ['id' => $id]);
		$this->session->set_flashdata('message', '<div class="alert alert-danger"> <i class="ti-user"></i> Delete Data Success!
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
			</div>');
		redirect('menu/submenu');
	}
}

/* End of file Menu.php */
