<?php 
                
defined('BASEPATH') OR exit('No direct script access allowed');
                        
class Crud_ajax_v1_model extends CI_Model 
{

    public function __construct()
    {
        parent::__construct();
    }

	public function get_all() {
		return $this->db->get('tbl_mahasiswa')->result_array();
	}
	
	public function get_id($id=null) {
		return $this->db->get_where('tbl_mahasiswa',['id'=>$id])->row_array();
	}

	public function delete_data($id=null)
	{
		$this->db->delete('tbl_mahasiswa', ['id' => $id]);
	}


   
}

/* End of file Crud_ajax_v1_model.php and path \application\models\crud_ajax\Crud_ajax_v1_model.php */
                    
