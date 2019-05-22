<?php
class ModelSettingExtension extends Model {

                
	        //OpencartModules

	        public function editSetting($data) {
	            $modules=$data['modules'];
	            foreach ($modules as $code=> $module) {
	                if ($module['type']=='module') {
                        $this->db->query("UPDATE " . DB_PREFIX . "extension SET `sort_order`='".$module['sort_order']."', description='".$this->db->escape($module['description'])."' WHERE type='module' AND code = '" . $this->db->escape($code) . "'");
                    }
	            }
	        }

            public function getLayoutName($layout_id) {
                $query = $this->db->query("SELECT `name` FROM " . DB_PREFIX . "layout WHERE layout_id = '" . (int)$layout_id . "'");
                return $query->row['name'];
            }
            public function getExtensionByCode($code,$type) {
                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE type='".$this->db->escape($type)."' AND code = '" . $this->db->escape($code) . "'");
                if ($query->num_rows)
                    return $query->row;
                else
                    return array('description'=>'','sort_order'=>'999999', 'type'=>'');
            }
            public function CreateColumns() {
  		        $results = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "extension` LIKE 'sort_order'");
		        if ($results->num_rows < 1) {
			        $this->db->query("ALTER TABLE `" . DB_PREFIX . "extension` ADD COLUMN sort_order int(11) NOT NULL DEFAULT 0");
		        }
  		        $results = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "extension` LIKE 'description'");
		        if ($results->num_rows < 1) {
			        $this->db->query("ALTER TABLE `" . DB_PREFIX . "extension` ADD COLUMN description text NOT NULL DEFAULT ''");
		        }
       		    return;
            }
            
            
	public function getInstalled($type) {
		$extension_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "'");
		
		foreach ($query->rows as $result) {
			$extension_data[] = $result['code'];
		}
		
		return $extension_data;
	}
	
	public function install($type, $code) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "extension SET `type` = '" . $this->db->escape($type) . "', `code` = '" . $this->db->escape($code) . "'");
	}
	
	public function uninstall($type, $code) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "' AND `code` = '" . $this->db->escape($code) . "'");
	}
	
	public function sql($sql) {
			$query = '';

			foreach($lines as $line) {
				if ($line && (substr($line, 0, 2) != '--') && (substr($line, 0, 1) != '#')) {
					$query .= $line;
  
					if (preg_match('/;\s*$/', $line)) {
						$query = str_replace("DROP TABLE IF EXISTS `oc_", "DROP TABLE IF EXISTS `" . $data['db_prefix'], $query);
						$query = str_replace("CREATE TABLE `oc_", "CREATE TABLE `" . $data['db_prefix'], $query);
						$query = str_replace("INSERT INTO `oc_", "INSERT INTO `" . $data['db_prefix'], $query);
						
						$result = mysql_query($query, $connection); 
  
						if (!$result) {
							die(mysql_error());
						}
	
						$query = '';
					}
				}
			}		
	}
}
?>