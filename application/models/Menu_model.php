<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Menu_model extends CI_Model
{
	function getSubMenu()
	{
		$query = $this->db->query("SELECT s_menu.*,m.menu FROM tbl_login_sub_menu s_menu LEFT JOIN tbl_login_menu m ON s_menu.menu_id = m.id ORDER BY s_menu.urutan ASC")->result_array();
		return $query;
	}
}

/* End of file Menu_model.php */
