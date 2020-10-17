<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class klikdaily extends RestController {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->model('Stok_model');
    }

    public function stocks_get()
    {
        $query = $this->Stok_model->show_all_data();

        $response['status_code']=200;
        $response['status_message']='Success';
        $response['stok']= $query;

        $this->response( $response, 200 );
            
    }

    public function logs_get()
    {
        $id         = $this->uri->segment(3);
        $query      = $this->Stok_model->show_logs($id);
        $query_stok = $this->Stok_model->show_logs_stock($id);

        if($query == FALSE){
            $response['status_code']   = 'Invalid';
            $response['status_message']='Invalid Request, logs Not Found';
        }else{

        $response['status_code']        = 200;
        $response['status_message']     ='Success, logs Found';
        $response['location_id']        = $this->uri->segment(3);
        $response['location_name']      = $query_stok['location'];
        $response['product']            = $query_stok['product'];
        $response['current_quantity']   = $query_stok['quantity'];
        $response['logs']               = $query;
    }

        $this->response( $response, 200 );
            
    }

    public function adjustment_post(){
        
        $data        = file_get_contents('php://input');
        $json_dcode  = json_decode($data, true);
        
        foreach ($json_dcode as $json_dcode2) {

             $data_adjust = array(
            'id'         => $json_dcode2['location_id'],
            'product'    => $json_dcode2['product'],
            'quantity'   => $json_dcode2['adjustment'],

        );
           
        $query       = $this->Stok_model->show_stok();
        $response    = $this->Stok_model->adjusment_data($data_adjust,$query);
        echo json_encode($response);
            
        }

    }


}