<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
	}

	public function index()
	{
		if ($this->session->userdata('email')) {
			redirect('user');
		}
		#Membuat Validasi (List di Dokumentasi codeigniter)
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');


		if ($this->form_validation->run() == FALSE) {
			$data['title'] = 'Login Page';
			$this->load->view('auth/auth_layout/auth_header', $data);
			$this->load->view('auth/login');
			$this->load->view('auth/auth_layout/auth_footer');
		} else {
			#Validasi Sukses
			$this->_login();
		}
	}

	public function _login()
	{
		$email = $this->input->post('email');
		$password = $this->input->post('password');

		$login = $this->db->get_where('tbl_login', ['email' => $email])->row_array();
		#User nya ada
		if ($login) {
			# Jika usernya aktif
			if ($login['is_active'] == 1) {
				# Cek Passwordnya
				if (password_verify($password, $login['password'])) {
					$data = [
						'email' => $login['email'],
						'role_id' => $login['role_id'],
					];
					$this->session->set_userdata($data);
					if ($login['role_id'] == 1) {
						redirect('admin');
					} else {
						redirect('user');
					}
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger"> <i class="ti-user"></i> Wrong password!
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
					</div>');
					redirect('auth');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger"> <i class="ti-user"></i> This email has not been actived!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
				</div>');
				redirect('auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger"> <i class="ti-user"></i>Email is not registered!
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
			</div>');
			redirect('auth');
		}
	}

	public function registration()
	{
		if ($this->session->userdata('email')) {
			redirect('user');
		}
		#Membuat Validasi (List di dokumentasi codeigniter)
		$this->form_validation->set_rules('name', 'Name', 'trim|required');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email|is_unique[tbl_login.email]', [
			'is_unique' => 'This Email has already registered!'
		]);
		$this->form_validation->set_rules('password1', 'Password', 'trim|required|min_length[3]|matches[password2]', [
			'matches' => 'Password dont match!',
			'min_length' => 'Password too short!',
		]);
		$this->form_validation->set_rules('password2', 'Password', 'trim|required|matches[password1]');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'User Registration';
			$this->load->view('auth/auth_layout/auth_header', $data);
			$this->load->view('auth/registration');
			$this->load->view('auth/auth_layout/auth_footer');
		} else {
			$email = $this->input->post('email', true);
			$data = [
				'name' => htmlspecialchars($this->input->post('name')),
				'email' => htmlspecialchars($email),
				'image' => 'default.jpg',
				'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
				'role_id' => '2',
				'is_active' => '0',
				'created_at' => date('Y-m-d H:i:s'),
			];

			// Siapakan Token
			$token = base64_encode(random_bytes(32));
			$user_token = [
				'email' => $email,
				'token' => $token,
				'created_at' => date('Y-m-d H:i:s'),
			];

			$this->db->insert('tbl_login', $data);
			$this->db->insert('tbl_login_token', $user_token);

			$this->_sendEmail($token, 'verify');
			$this->session->set_flashdata('message', '<div class="alert alert-success"> <i class="ti-user"></i> Congratulation! your account has been created. Please Login
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
			</div>');
			redirect('auth');
		}
	}

	private function _sendEmail($token, $type)
	{
		$config = [
			'protocol'  => 'smtp',
			'smtp_host' => 'ssl://smtp.googlemail.com',
			'smtp_user' => 'snapzone33@gmail.com',
			'smtp_pass' => 'ikoj zxel rpsa nizq',
			'smtp_port' => 465,
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'newline'   => "\r\n"
		];


		$this->email->initialize($config);

		$this->email->from('snapzone@gmail.com', 'Deni Priatna');
		$this->email->to($this->input->post('email'));

		if ($type == 'verify') {
			$this->email->subject('Account Verification');
			$this->email->message('Click this link to verify you account : <a href="' . base_url() . 'auth/verify?email=' . $this->input->post('email') . '&token=' . urlencode($token) . '">Activate</a>');
		} else if ($type = 'forgot') {
			$this->email->subject('Reset Password');
			$this->email->message('Click this link to reset your password : <a href="' . base_url() . 'auth/resetpassword?email=' . $this->input->post('email') . '&token=' . urlencode($token) . '">Reset Password</a>');
		}

		if ($this->email->send()) {
			return true;
		} else {
			echo $this->email->print_debugger();
			die;
		}
	}

	public function verify()
	{
		$email = $this->input->get('email');
		$token = $this->input->get('token');

		$user = $this->db->get_where('tbl_login', ['email' => $email])->row_array();

		if ($user) {
			$user_token = $this->db->get_where('tbl_login_token', ['token' => $token])->row_array();

			if ($user_token) {
				if ($user_token['created_at'] < (60 * 60 * 24)) {
					$this->db->set('is_active', 1);
					$this->db->where('email', $email);
					$this->db->update('tbl_login');

					$this->db->delete('tbl_login_token', ['email' => $email]);

					$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">' . $email . ' has been activated! Please login.</div>');
					redirect('auth');
				} else {
					$this->db->delete('tbl_login', ['email' => $email]);
					$this->db->delete('tbl_login_token', ['email' => $email]);

					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation failed! Token expired.</div>');
					redirect('auth');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation failed! Wrong token.</div>');
				redirect('auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation failed! Wrong email.</div>');
			redirect('auth');
		}
	}

	public function forgotPassword()
	{
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');


		if ($this->form_validation->run() == FALSE) {
			$data['title'] = 'Forgot Password';
			$this->load->view('auth/auth_layout/auth_header', $data);
			$this->load->view('auth/forgot_password');
			$this->load->view('auth/auth_layout/auth_footer');
		} else {
			$email = $this->input->post('email');
			$user = $this->db->get_where('tbl_login', ['email' => $email, 'is_active' => 1])->row_array();

			if ($user) {
				$token = base64_encode(random_bytes(32));
				$user_token = [
					'email' => $email,
					'token' => $token,
					'created_at' => date('Y-m-d H:i:s'),
				];

				$this->db->insert('tbl_login_token', $user_token);
				$this->_sendEmail($token, 'forgot');

				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Please check your email to reset your password!</div>');
				redirect('auth/forgotpassword');
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email is not registered or activated!</div>');
				redirect('auth/forgotpassword');
			}
		}
	}

	public function resetPassword()
	{
		$email = $this->input->get('email');
		$token = $this->input->get('token');

		$user = $this->db->get_where('tbl_login', ['email' => $email])->row_array();

		if ($user) {
			$user_token = $this->db->get_where('tbl_login_token', ['token' => $token])->row_array();

			if ($user_token) {
				$this->session->set_userdata('reset_email', $email);
				$this->changePassword();
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Resep Password failed! Wrong Token.</div>');
				redirect('auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Resep Password failed! Wrong email.</div>');
			redirect('auth');
		}
	}

	public function changePassword()
	{

		if (!$this->session->userdata('reset_email')) {
			redirect('auth');
		}
		$this->form_validation->set_rules('password1', 'Password', 'trim|required|min_length[3]|matches[password2]');
		$this->form_validation->set_rules('password2', 'Repeat Password', 'trim|required|matches[password1]');

		if ($this->form_validation->run() == FALSE) {
			$data['title'] = 'Change Password';
			$this->load->view('auth/auth_layout/auth_header', $data);
			$this->load->view('auth/change_password');
			$this->load->view('auth/auth_layout/auth_footer');
		} else {
			$password = password_hash($this->input->post('password1'), PASSWORD_DEFAULT);
			$email = $this->session->userdata('reset_email');

			$this->db->set('password', $password);
			$this->db->where('email', $email);
			$this->db->update('tbl_login');


			$this->session->userdata('reset_email');
			$this->session->set_flashdata('message', '<div class="alert alert-primary" role="alert">Password has been change! Please login.</div>');

			redirect('auth');
		}
	}



	function logout()
	{
		$this->session->unset_userdata('email');
		$this->session->unset_userdata('role_id');
		$this->session->set_flashdata('message', '<div class="alert alert-success"> <i class="ti-user"></i> You have been logged out!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
		</div>');
		redirect('auth');
	}

	function blocked()
	{
		$this->load->view('auth/blocked');
	}
}

/* End of file Auth.php */
