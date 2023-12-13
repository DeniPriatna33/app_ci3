<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Crud_serverside_v2_model extends CI_Model {

	
	public function __construct()
	{
		parent::__construct();
	}

	public function get_total_records()
	{
		return $this->db->count_all('tbl_mahasiswa');
	}

	public function get_records($limit, $start, $order, $dir,$q=null)
	{
		$this->db->select('*');
		$this->db->from('tbl_mahasiswa');
		$this->db->order_by($order, $dir);
		$this->ob->group_start();
			$this->ob->like("UPPER(nama)", $q);
			$this->ob->or_like("UPPER(nik)", $q);
			$this->ob->or_like("UPPER(email)", $q);
			$this->ob->or_like("UPPER(jurusan)", $q);
		$this->ob->group_end();
		$this->db->limit($limit, $start);
		return $this->db->get()->result();
	}

	function get_by_id($id)
	{
		$this->db->from('tbl_mahasiswa');
		$this->db->where('id', $id);
		$query = $this->db->get();
		return $query->row();
	}

	public function create_record($data)
	{
		$this->db->insert('tbl_mahasiswa', $data);
	}

	public function update_record($id, $data)
	{
		$this->db->where('id', $id);
		$this->db->update('tbl_mahasiswa', $data);
	}

	public function delete_record($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('tbl_mahasiswa');
	}
}

/* End of file Crud_serverside_v2_model.php */
