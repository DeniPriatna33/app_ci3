<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Crud_serverside_v3_model extends CI_Model {

	var $table = 'tbl_mahasiswa';
	var $column_order = ['id','nama','nik','email','jurusan'];
	var $order = ['id','nama','nik','email','jurusan'];
	
	public function __construct()
	{
		parent::__construct();
	}

	public function _get_data_query() {
		$this->db->from($this->table);
		if (isset($_POST['search']['value'])) {
			$this->db->like('nama',$_POST['search']['value']);
			$this->db->or_like('nik',$_POST['search']['value']);
			$this->db->or_like('email',$_POST['search']['value']);
			$this->db->or_like('jurusan',$_POST['search']['value']);
		}

		if (isset($_POST['order'])) {
			$this->db->order_by($this->order[$_POST['order'][0]['column']],[$_POST['order']['dir']] );
		}else{
			$this->db->order_by('id', 'desc');
		}	
	}

	public function getDataTable() {
		$this->_get_data_query();	
		if ($_POST['length'] != -1) {
			$this->db->limit($_POST['length'],$_POST['start']);
		}
		$query = $this->db->get();
		return $query->result();
	}
	
	public function count_filltered_data() {
		$this->_get_data_query();
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function count_all_data() {
		$this->_get_data_query();
		return $this->db->count_all_results();
	}



	
}

/* End of file Crud_serverside_v2_model.php */
