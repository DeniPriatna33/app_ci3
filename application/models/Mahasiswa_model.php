<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Mahasiswa_model extends CI_Model
{
	public function get_all($limit, $start, $mahasiswa = null)
	{
		if ($mahasiswa) {
			$this->db->like('lower(nama)', strtoupper($mahasiswa));
			$this->db->or_like('lower(jurusan)', strtoupper($mahasiswa));
			$this->db->or_like('lower(nik)', strtoupper($mahasiswa));
			$this->db->or_like('lower(email)', strtoupper($mahasiswa));
			return $this->db->get('tbl_mahasiswa', $limit)->result_array();
		} else {

			return $this->db->get('tbl_mahasiswa', $limit, $start)->result_array();
		}
	}

	public function get_id($id)
	{
		return $this->db->get_where('tbl_mahasiswa', ['id' => $id])->row_array();
	}

	public function count_all_data()
	{
		return $this->db->get('tbl_mahasiswa')->num_rows();
	}

	public function tambah_data()
	{
		$data = [
			'nama' 		=> $this->input->post('nama', true),
			'nik' 		=> $this->input->post('nik', true),
			'email' 	=> $this->input->post('email', true),
			'jurusan' 	=> $this->input->post('jurusan', true),
		];
		$this->db->insert('tbl_mahasiswa', $data);
	}

	public function update_data()
	{
		$data = [
			'nama' 		=> $this->input->post('nama', true),
			'nik' 		=> $this->input->post('nik', true),
			'email' 	=> $this->input->post('email', true),
			'jurusan' 	=> $this->input->post('jurusan', true),
		];
		$this->db->where('id', $this->input->post('id'));
		$this->db->update('tbl_mahasiswa', $data);
	}

	public function delete_data($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('tbl_mahasiswa');
	}

	public function cariData()
	{
		$keyword = $this->input->post('keyword', true);
		$this->db->like('nama', $keyword);
		$this->db->or_like('jurusan', $keyword);
		$this->db->or_like('nik', $keyword);
		$this->db->or_like('email', $keyword);
		return $this->db->get('tbl_mahasiswa')->result_array();
	}
}

/* End of file Mahasiswa_model.php */
