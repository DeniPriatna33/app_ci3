<?php

defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
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
			'isi' =>	'user/index',
		];
		$this->load->view('layout/wrapper', $data);
	}

	function edit()
	{
		$user = $this->db->get_where('tbl_login', [
			'email' => $this->session->userdata('email')
		])->row_array();

		$this->form_validation->set_rules('name', 'Full Name', 'required');


		if ($this->form_validation->run() == FALSE) {
			$data = [
				'sub_judul' => 'Edit Profile',
				'sub_judul1' => 'edit',
				'user' => $user,
				'isi' =>	'user/edit',
			];
			$this->load->view('layout/wrapper', $data);
		} else {
			$name = $this->input->post('name');
			$email = $this->input->post('email');

			// Cek jika ada gambar yang akan diupload
			$upload_image = $_FILES['image'];
			if ($upload_image) {
				$config['upload_path']          = 'assets/images/profile';
				$config['allowed_types']        = 'gif|jpg|png|jpeg';
				$config['max_size']             = '2048';
				$this->load->library('upload', $config);

				if ($this->upload->do_upload('image')) {
					$old_image = $user['image'];
					if ($old_image != 'default.jpg') {
						unlink(FCPATH . 'assets/images/profile/' . $old_image);
					}
					$new_image = $this->upload->data('file_name');
					$this->db->set('image', $new_image);
				} else {
					echo $this->upload->display_errors();
				}
			}


			$this->db->set('name', $name);
			$this->db->where('email', $email);
			$this->db->update('tbl_login');

			$this->session->set_flashdata('message', '<div class="alert alert-success"> <i class="ti-user"></i> Your profile has been update! 
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
			</div>');
			redirect('user/edit');
		}
	}

	function changepassword()
	{
		$user = $this->db->get_where('tbl_login', [
			'email' => $this->session->userdata('email')
		])->row_array();

		$this->form_validation->set_rules('current_password', 'Current Password', 'required|trim');
		$this->form_validation->set_rules('new_password1', 'New Password', 'required|trim|min_length[3]|matches[new_password2]');
		$this->form_validation->set_rules('new_password2', 'Confirm New Password', 'required|trim|min_length[3]|matches[new_password1]');


		if ($this->form_validation->run() == FALSE) {
			$data = [
				'sub_judul' => 'Change Password',
				'sub_judul1' => 'edit',
				'user' => $user,
				'isi' =>	'user/change_password',
			];
			$this->load->view('layout/wrapper', $data);
		} else {
			$current_password = $this->input->post('current_password');
			$new_password = $this->input->post('new_password1');

			#password_verify adalah fungsi untuk mencocokkan data asli dengan data yang sudah terhash.
			if ($current_password == $new_password) {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">New password cannot be the same as current password!</div>');
				redirect('user/changepassword');
			} else {
				// password sudah ok
				$password_hash = password_hash($new_password, PASSWORD_DEFAULT);
				$this->db->set('password', $password_hash);
				$this->db->where('email', $this->session->userdata('email'));
				$this->db->update('tbl_login');

				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Password changed!</div>');
				redirect('user/changepassword');
			}
		}
	}
}

/* End of file User.php */
