<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Crud_multiple_v1_model extends CI_Model
{

	var $table = 'tbl_mahasiswa';
	public function __construct()
	{
		parent::__construct();
	}

	public function get_total_records()
	{
		return $this->db->count_all($this->table);
	}

	public function get_records($limit, $start, $order, $dir)
	{
		$this->db->select('*');
		$this->db->from($this->table);
		$this->db->order_by($order, $dir);
		$this->db->order_by('id', 'DESC');
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

	public function delete_record($id)
	{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
	}
}

/* End of file Crud_multiple_v1_model.php */
