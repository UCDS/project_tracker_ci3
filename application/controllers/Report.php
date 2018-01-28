<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends CI_Controller {
    function index($execution_path){
    //    $filters = json_decode($this->security->xss_clean($this->input->raw_input_stream));
        $this->load->model('reports_model');
        $this->reports_model->get_report();
    }
 }