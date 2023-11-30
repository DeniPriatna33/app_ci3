<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Crud_serverside_v1_model extends CI_Model {

	var $table = 'tbl_mahasiswa';
	var $column_order = array(null,'nama', 'nik','email','jurusan');
	var $column_search = array('nama', 'nik','email','jurusan');
	var $order = array('id' => 'DESC'); // Default order

	public function __construct()
	{
		parent::__construct();
	}
	
	function get_datatables() {
		$this->_get_datatables_query();
		if ($_POST['length'] != -1) {
			$this->db->limit($_POST['length'], $_POST['start']);
		}
		$query = $this->db->get();
		return $query->result();
	}

	private function _get_datatables_query()
	{
		$this->db->from($this->table);

		$i = 0;

		foreach ($this->column_search as $item) {
			if ($_POST['search']['value']) {
				if ($i === 0) {
					$this->db->group_start();
					$this->db->like($item, $_POST['search']['value']);
				} else {
					$this->db->or_like($item, $_POST['search']['value']);
				}

				if (count($this->column_search) - 1 == $i) {
					$this->db->group_end();
				}
			}
			$i++;
		}

		if (isset($_POST['order'])) {
			$this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
		} else if (isset($this->order)) {
			$order = $this->order;
			$this->db->order_by(key($order), $order[key($order)]);
		}
	}

	function count_filtered()
	{
		$this->_get_datatables_query();
		$query = $this->db->get();
		return $query->num_rows();
	}


	function count_all()
	{
		$this->db->from($this->table);
		return $this->db->count_all_results();
	}

	function get_by_id($id)
	{
		$this->db->from($this->table);
		$this->db->where('id', $id);
		$query = $this->db->get();
		return $query->row();
	}

	function save($data)
	{
		$this->db->insert($this->table, $data);
		return $this->db->insert_id();
	}

	function update( $data,$where)
	{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
	}

	function delete_by_id($id)
	{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
	}
}

/* End of file Crud_serverside_v1_model.php */
