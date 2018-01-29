<?php
class Reports_model extends CI_Model{
    private $execution_path = array(
        "State" => array(
            "sql_path"=>array(
                "queries"=>array(
                    "State"              
                ),
                "join_result_on"=>false
            )            
        ),
        "District" => array(
            "sql_path"=>array(
                "queries"=>array(
                    "District"               
                ),
                "join_result_on"=>false
            )            
        ),
        "Assembly" => array(
            "sql_path"=>array(
                "queries"=>array(
                    "Assembly"               
                ),
                "join_result_on"=>false
            )            
        ),
        "Mandal" => array(
            "sql_path"=>array(
                "queries"=>array(
                    "Mandal"               
                ),
                "join_result_on"=>false
            )            
        ),
        "Panchayat" => array(
            "sql_path"=>array(
                "queries"=>array(
                    "Panchayat"               
                ),
                "join_result_on"=>false
            )            
        ),
        "Habitation" => array(
            "sql_path"=>array(
                "queries"=>array(
                    "Habitation"                
                ),
                "join_result_on"=>false
            )            
        ),
        "getRoadsCompleteStatusOverview" => array( // Done, complete
            "output" => array(
                "locationName"=>"district_name",
                "locationId"=>"district_id",
                "totalRoads"=>"total_roads".' KM',              // project table
                "ParameterArr"=>array(
                    "paramName"=>"work_type",                   //Group by field
                    "paramValue"=>"work_type_length".' KM',            
                    "coveredHabitationsCount"=> NULL
                ),
            ),    
            "filters"=>array(
                "fromDate"=>"agreement_date",               // project table
                "toDate"=>"actual_completion_date",
                "locationType"=>"",
                "locationId"=>"district_id",
                "subLocation"=>"mandal"
            ),
            "sql_path"=>array(
                "queries"=>array(
                    "district_road_length",
                    "work_type_length",
                 ),                
                "join_result_on"=>array(
                    "default"=>array("output", "locationId")
                )
            )
        ),
        "getLocationWiseConnectivityStatusOverview" => array( // Done to be tested, completed
            "output"=>array(
                "locationId"=>"district_id",
                "state"=>"Andhra Pradhesh",
                "district"=>"district_name",
                "constituency"=>"assembly_constituency",
                "mandal"=>"mandal.mandal",
                "totalHabitations"=>NULL,
                "HabsConnectedByPRandRandBRoards"=>NULL,
                "unConnctedHabitations"=>NULL,
                "unConnectedHabsRoadLength"=>NULL,
                "amountRequiredToConnect"=>"total_agreement_amount"
            ),
            "sql_path"=>array(
                "queries"=>array("getLocationWiseConnectivityStatusOverview"),
                "join_result_on"=>false
            )
        ),
        "locationAndDateWiseWorksDetailsOverViewStateLevel" => array( // Done to be tested
            "output"=>array(
                "locationId"=>"district_id",
                "locationName"=>"Andhra Pradesh",
                "totalWorks"=>"total_projects",
                "adminsanctioned"=>"total_admin_sanction_amount",
                "technicalsanctioned"=>"total_tech_sanction_amount",
                "grounded"=>"750",
                "completed"=>"500",
                "notgrounded"=>"250"
            ),
            "sql_path"=>array(
                "queries"=>array("locationAndDateWiseWorksDetailsOverViewStateLevel"),
                "join_result_on"=>false
            )
        ),
        "locationAndDateWiseWorksDetailsOverViewDistrictAndLowLevel" => array( // Is Location Same as district?, complete
            "output"=>array(
                "locationId"=>"district_id",
                "locationName"=>"district_name",
                "totalWorks"=>"total_projects",
                "adminsanctioned"=>"total_admin_sanction_amount",
                "technicalsanctioned"=>"tech_sanction_amount",
                "grounded"=>"status_type_id",
                "completed"=>"status_type_id",
                "notgrounded"=>"status_type_id"
            ),
            "sql_path"=>array(
                "queries"=>array("locationAndDateWiseWorksDetailsOverViewDistrictAndLowLevel"),
                "join_result_on"=>false
            )
        ),
        "locationAndDateWiseWorksDetailsOnClick" => array( // Done to be tested, complete
            "output"=>array(
                "workId"=> "project_id",                
                "workName"=> "work_type",
                "programName"=>"project_name",
                "programId"=>NULL,
                "HabitationCode"=>NULL,
                "HabitationName"=>NULL,
                "districtName"=>NULL,
                "districtId"=>"district_id",
                "constituencyName"=>"assembly_constituency",
                "constituencyId"=>"assembly_constituency_id",
                "mandalName"=>"mandal",
                "mandalId"=>"mandal_id",
                "SactionactionAmount"=>"agreement_amount",
                "SactionactionDate"=>"agreement_date",                
                "TargetDate"=>"agreement_completion_date",
                "GroundatedDate"=>"status_date",
                "CompletionDate"=>"status_date",
                "Status"=>"status_date"             
            ),
            "sql_path"=>array(
                "queries"=>array("locationAndDateWiseWorksDetailsOnClick"),
                "join_result_on"=>false
            )
        )
    );

    private $query_mapping = array(
        "template"=>array(
            "root_table"=>"",
            "simple_columns"=>"",
            "function_columns"=>"",
            "join_string"=>"",
            "group_by"=>"",
            "order_by"=>"",
            "where_columns"=>"",
            "having_columns"=>""
        ),
        "mastersData"=>array(
            "root_table"=>"",
            "simple_columns"=>"",
            "function_columns"=>"",
            "join_string"=>"",
            "group_by"=>"",
            "order_by"=>"",
            "where_columns"=>"",
            "having_columns"=>""           
        ),
        "district_road_length"=>array(
            "root_table"=>"projects",
            "simple_columns"=>array(
                "districts.district_name as locationName", 
                "projects.district_id as locationId"
            ),
            "function_columns"=>array(
                "SUM(road_length_target) as totalRoads"
            ),
            "join_string"=>array(
                "districts"=>"projects.district_id = districts.district_id"
            ),
            "group_by"=>array("projects.district_id"),
            "order_by"=>array("district_name"),
            "where_columns"=>array("work_type_id = 1"),
            "having_columns"=>false,           
        ),
        "work_type_length"=>array(
            "root_table"=>"projects",
            "simple_columns"=>array( 
                "projects.district_id as locationId", 
                "work_type as paramName",
                "'null' as coveredHabitationsCount"
            ),
            "function_columns"=>array(
                "SUM(road_length_target) as paramValue"
            ),
            "join_string"=>array(
                "work_type"=>"projects.work_type_id = projects.work_type_id",
                "districts"=>"projects.district_id = districts.district_id"
            ),
            "group_by"=>array("work_type"),
            "order_by"=>array("district_name"),
            "where_columns"=>false,
            "having_columns"=>false, 
        ),
        "getLocationWiseConnectivityStatusOverview"=>array(
            "root_table"=>"projects",
            "simple_columns"=>array(
                "projects.district_id as locationId", 
                "districts.district_name as district",
                "'Andhra Pradesh' as state", 
                "assembly_constituency.assembly_constituency as constituency", 
                "mandal.mandal as mandal",
                "'null' as totalHabitations",
                "'null' as HabsConnectedByPRandRandBRoards",
                "'null' as unConnctedHabitations",
                "'null' as unConnectedHabsRoadLength"
            ),
            "function_columns"=>array("SUM(projects.agreement_amount) as amountRequiredToConnect"),
            "join_string"=>array(
                "districts"=>"projects.district_id = districts.district_id",
                "assembly_constituency"=>"assembly_constituency.assembly_constituency_id = projects.assembly_constituency_id",
                "mandal"=>"mandal.mandal_id = projects.mandal_id"
            ),
            "group_by"=>array("projects.district_id"),
            "order_by"=>array("districts.district_name"),
            "where_columns"=>false,
            "having_columns"=>false,           
        ),
        "locationAndDateWiseWorksDetailsOverViewStateLevel"=>array(
            "root_table"=>"projects",
            "simple_columns"=>array("district_id"),
            "function_columns"=>array(
                "SUM(sanctions.admin_sanction_amount)",
                "SUM(sanctions.admin_sanction_date)",
                "SUM(sanctions.tech_sanction_amount)",
                "SUM(CASE WHEN project_status.status_type_id = 1 then 1 else 0 end)",
                "SUM(CASE WHEN project_status.status_type_id = 2 then 1 else 0 end)",
                "SUM(CASE WHEN project_status.status_type_id = 3 then 1 else 0 end)",
            ),
            "join_string"=>array(
                "districts"=>"projects.district_id = districts.district_id",
                "sanctions"=>"projects.project_id = sanctions.project_id",
                "project_status"=>"project_status.project_id = projects.project_id"
            ),
            "group_by"=>array("projects.district_id", "project_status.status_type_id"),
            "order_by"=>array("districts.district_name"),
            "where_columns"=>false,
            "having_columns"=>false,           
        ),
        "locationAndDateWiseWorksDetailsOnClick"=>array(
            "root_table"=>"projects",
            "simple_columns"=>array(
                "projects.project_id as workId", 
                "work_type.work_type as workName",
                "projects.project_name as programName",
                "projects.district_id as districtId",
                "projects.agreement_amount as SactionactionAmount",
                "projects.agreement_date as SactionactionDate",
                "projects.agreement_completion_date as TargetDate",
                "'null' as programId",
                "'null' as HabitationCode",
                "'null' as districtName",
                "'null' as HabitationName"
            ),
            "function_columns"=>array(
                "(CASE WHEN project_status.status_type_id = 1 then project_status.status_date else null end) as GroundatedDate",
                "(CASE WHEN project_status.status_type_id = 2 then project_status.status_date else null end) as CompletionDate",
                "(CASE WHEN project_status.status_type_id = 3 then project_status.status_date else null end) as Status"
            ),
            "join_string"=>array(
                "project_status"=>"project_status.project_id = projects.project_id",
                "work_type"=>"work_type.work_type_id=projects.work_type_id",
                "districts"=>"projects.district_id = districts.district_id",
            ),
            "group_by"=>array("projects.district_id", "project_status.status_type_id"),
            "order_by"=>array("districts.district_name"),
            "where_columns"=>false,
            "having_columns"=>false           
        ),
        "locationAndDateWiseWorksDetailsOverViewDistrictAndLowLevel"=>array(
            "root_table"=>"projects",
            "simple_columns"=>array(
                "projects.district_id as locationId",
                "districts.district_name as locationName",
            ),
            "function_columns"=>array(
                "COUNT(*) as totalWorks",
                "SUM(sanctions.admin_sanction_amount) as adminsanctioned",
                "SUM(sanctions.tech_sanction_amount) as technicalsanctioned",
                "SUM(CASE WHEN project_status.status_type_id = 1 then 1 else 0 end) as notgrounded",
                "SUM(CASE WHEN project_status.status_type_id = 2 then 1 else 0 end) as grounded",
                "SUM(CASE WHEN project_status.status_type_id = 3 then 1 else 0 end) as completed",
            ),
            "join_string"=>array(
                "districts"=>"projects.district_id = districts.district_id",
                "sanctions"=>"projects.project_id = sanctions.project_id",
                "project_status"=>"project_status.project_id = projects.project_id"
            ),
            "group_by"=>array("projects.district_id", "project_status.status_type_id"),
            "order_by"=>array("districts.district_name"),
            "where_columns"=>false,
            "having_columns"=>false           
        ),
        "District"=>array(
            "root_table"=>"districts",
            "simple_columns"=>array(
                "district_id as district_code",
                "district_name as district_name",
                "state_id as state_code"
            ),
            "function_columns"=>false,
            "join_string"=>false,
            "group_by"=>false,
            "order_by"=>false,
            "where_columns"=>false,
            "having_columns"=>false
        ),
        "State"=>array(
            "root_table"=>"states",
            "simple_columns"=>array(
                "state_id as state_code",
                "state as state_name"
            ),
            "function_columns"=>false,
            "join_string"=>false,
            "group_by"=>false,
            "order_by"=>false,
            "where_columns"=>false,
            "having_columns"=>false
        ),
        "Assembly"=>array(
            "root_table"=>"assembly_constituency",
            "simple_columns"=>array(
                "assembly_constituency_id as assembly_code", 
                "assembly_constituency as assembly_name",
                "'null' as district_code"
            ),
            "function_columns"=>false,
            "join_string"=>false,
            "group_by"=>false,
            "order_by"=>false,
            "where_columns"=>false,
            "having_columns"=>false
        ),
        "Mandal"=>array(
            "root_table"=>"mandal",
            "simple_columns"=>array(
                "mandal_id as mandal_code", 
                "mandal as mandal_name", 
                "district_id as district_code", 
                "'null' as assembly_code"
            ),
            "function_columns"=>false,
            "join_string"=>false,
            "group_by"=>false,
            "order_by"=>false,
            "where_columns"=>false,
            "having_columns"=>false
        ),
        "Panchayat"=>array(
            "root_table"=>"states",
            "simple_columns"=>array(
                "'null' as panchayat_code", 
                "'null' as panchayat_name", 
                "'null' as mandal_code"
            ),
            "function_columns"=>false,
            "join_string"=>false,
            "group_by"=>false,
            "order_by"=>false,
            "where_columns"=>false,
            "having_columns"=>false
        ),
        "Habitation"=>array(
            "root_table"=>"states",
            "simple_columns"=>array(
                "'null' as habitation_code", 
                "'null' as habitation_name", 
                "'null' as panchayat_code"
            ),
            "function_columns"=>false,
            "join_string"=>false,
            "group_by"=>false,
            "order_by"=>false,
            "where_columns"=>false,
            "having_columns"=>false
        ),
    );

    function get_report(){        
        if($this->uri->segment(3)===FALSE)
            return;
        $execution_path = $this->uri->segment(3);        
        $execution_path = $this->execution_path[$execution_path];
        $results_array = array();
        //   var_dump($execution_path['sql_path']);
        foreach($execution_path['sql_path']['queries'] as $query){
            // Build Select String
        //    echo $query;
        //    var_dump($this->query_mapping[$query]['function_columns']);
            $select_string = $this->query_mapping[$query]['function_columns'] ? implode(",", $this->query_mapping[$query]['function_columns']).", " : " ";
            $select_string = $select_string.implode(",", $this->query_mapping[$query]['simple_columns']);
            $this->db->select($select_string);
            $this->db->from($this->query_mapping[$query]['root_table']);
            // Build Join String
            if($this->query_mapping[$query]['join_string']){
                foreach($this->query_mapping[$query]['join_string'] as $key => $value){
                    $this->db->join($key, $value, 'left');
                }
            }        
                
            // Build Where Columns
            if($this->query_mapping[$query]['where_columns']){                
                $this->db->where($this->query_mapping[$query]['where_columns']);
            }                
            // Build Group By Columns
            if($this->query_mapping[$query]['group_by'])
                $this->db->group_by($this->query_mapping[$query]['group_by']);                   
            // Build Order By Columns    
            if($this->query_mapping[$query]['order_by'])
                $this->db->order_by(implode(',', $this->query_mapping[$query]['order_by']));
            // Build Having Columns
            if($this->query_mapping[$query]['having_columns'])
                $this->db->order_by($this->query_mapping[$query]['having_columns']);
        //    echo "After Having String";
            $result = $this->db->get();
            $results_array[$query] = $result->result();       
        }
        
        // Merge Results
        if($execution_path['sql_path']['join_result_on']){
            // Write the method, move this block to library
            $link = $execution_path['sql_path']['join_result_on']['default'][1];
            $mapping = $execution_path['sql_path']['join_result_on']['default'][0];
            var_dump($mapping);
            for($i=sizeof($execution_path['sql_path']['queries'])-2; $i>=0; $i--){
                $parent_results_array = $results_array[$execution_path['sql_path']['queries'][$i]];                                 
                $child_results_array = $results_array[$execution_path['sql_path']['queries'][$i+1]];
                foreach($parent_results_array as $parent_array){
                    $parent_array->$mapping = array(); 
                    foreach($child_results_array as $child_array){
                        if(property_exists($parent_array, $link) && property_exists($child_array, $link)){
                           // echo $parent_array->$link.' '.$child_array->$link.'</br>';
                           $parent_array->$mapping = $child_array;
                        }
                    }
                }                
            }
            for($j=sizeof($execution_path['sql_path']['queries'])-1; $j>0; $j--){
                unset($results_array[$execution_path['sql_path']['queries'][$j]]);
            } 
        }
        echo json_encode($results_array[$execution_path['sql_path']['queries'][0]]);
    }
}