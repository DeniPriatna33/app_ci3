<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Crud_multiple_v1_model extends CI_Model
{

	var $table = 'tbl_mahasiswa';
	public function __construct()
	{
		parent::__construct();
	}

	public function get_total_records($q=null)
	{
		// return $this->db->count_all('tbl_mahasiswa');
		$this->db->select('*');
		$this->db->from('tbl_mahasiswa');
		$this->db->group_start();
			$this->db->like("UPPER(nama)", $q);
			$this->db->or_like("UPPER(nik)", $q);
			$this->db->or_like("UPPER(email)", $q);
			$this->db->or_like("UPPER(jurusan)", $q);
		$this->db->group_end();
		return $this->db->count_all_results();
	}

	public function get_records($limit, $start, $order, $dir,$q=null)
	{
		$this->db->select('*');
		$this->db->from('tbl_mahasiswa');
		$this->db->order_by($order, $dir);
		$this->db->group_start();
			$this->db->like("UPPER(nama)", $q);
			$this->db->or_like("UPPER(nik)", $q);
			$this->db->or_like("UPPER(email)", $q);
			$this->db->or_like("UPPER(jurusan)", $q);
		$this->db->group_end();
		$this->db->limit($limit, $start);
		return $this->db->get()->result();
	}

	function get_by_id($id)
	{
		$this->db->from($this->table);
		$this->db->where('id', $id);
		$query = $this->db->get();
		return $query->row();
	}

	public function create_record($data)
	{
		$this->db->insert_batch($this->table, $data);
	}

	public function update_record($id, $data)
	{
		$this->db->where('id', $id);
		$this->db->update($this->table, $data);
	}

	public function update_record_all($id, $data,$id_n)
	{
		$this->db->where_in('id', $id);
		$this->db->update_batch($this->table, $data,$id_n);
	}

	public function delete_record($id)
	{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
	}

	public function delete_record_all($id)
	{
		$this->db->where_in('id', $id);
		$this->db->delete($this->table);
	}
}

/* End of file Crud_multiple_v1_model.php */
