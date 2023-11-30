<?php 
                
defined('BASEPATH') OR exit('No direct script access allowed');
                        
class Crud_ajax_v2_model extends CI_Model 
{

	var $table = 'tbl_mahasiswa';

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function create($data)
	{
		$this->db->insert($this->table, $data);
		return $this->db->insert_id();
	}

	public function read()
	{
		$this->db->order_by('id','DESC');
		$query = $this->db->get($this->table);
		return $query->result();
	}
	public function read_id($id)
	{
		$this->db->order_by('id','DESC');
		$this->db->where('id', $id);
		$query = $this->db->get($this->table);
		return $query->row();
	}

	public function update($id, $data)
	{
		$this->db->where('id', $id);
		$this->db->update($this->table, $data);
		return $this->db->affected_rows();
	}

	public function delete($id)
	{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		return $this->db->affected_rows();
	}


   
}

/* End of file Crud_ajax_v1_model.php and path \application\models\crud_ajax\Crud_ajax_v1_model.php */
                    
