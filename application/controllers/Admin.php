<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
	}

	public function index()
	{
		$user = $this->db->get_where('tbl_login', [
			'email' => $this->session->userdata('email')
		])->row_array();

		$data = [
			'sub_judul' => 'My Profile',
			'sub_judul1' => 'Dashboard',
			'user' => $user,
			'isi' =>	'admin/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	public function role()
	{

		$user = $this->db->get_where('tbl_login', [
			'email' => $this->session->userdata('email')
		])->row_array();

		$role = $this->db->get('tbl_login_role')->result_array();

		$data = [
			'sub_judul' => 'Role',
			'sub_judul1' => 'Access',
			'user' => $user,
			'role' => $role,
			'isi' =>	'admin/role',
		];
		$this->load->view('layout/wrapper', $data);
	}

	function role_access($role_id)
	{
		$user = $this->db->get_where('tbl_login', [
			'email' => $this->session->userdata('email')
		])->row_array();

		$role = $this->db->get_where('tbl_login_role', ['id' => $role_id])->row_array();

		$this->db->where('id !=', '1');
		$menu = $this->db->get('tbl_login_menu')->result_array();


		$data = [
			'sub_judul' => 'Role Access',
			'sub_judul1' => 'Access',
			'user' => $user,
			'role' => $role,
			'menu' => $menu,
			'isi' =>	'admin/role_access',
		];

		$this->load->view('layout/wrapper', $data);
	}

	public function changeAccess()
	{
		$menu_id = $this->input->post('menuId');
		$role_id = $this->input->post('roleId');

		$data = [
			'role_id' => $role_id,
			'menu_id' => $menu_id
		];

		$result = $this->db->get_where('tbl_login_access_menu', $data);

		if ($result->num_rows() < 1) {
			$this->db->insert('tbl_login_access_menu', $data);
		} else {
			$this->db->delete('tbl_login_access_menu', $data);
		}

		$this->session->set_flashdata('message', '<div class="alert alert-success"> <i class="ti-user"></i> Access Changed!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
		</div>');
	}
}

/* End of file Admin.php */
