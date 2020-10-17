<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Stok_model extends CI_Model
{
	public function show_all_data(){

	return $this->db->select('*')->from('stok_tbl')->get()->result();
}

 
 public function adjusment_data($data_adjust,$query){

 	 $where2 	= array("id"=>$data_adjust['id']);
 	 $qty 		= $data_adjust['quantity'];;
 	 $id 		= $data_adjust['id'];
 	 $product 	= $this->db->select('product')->from('stok_tbl')->where('product',$data_adjust['product'])->get()->result();

 	$this->db->where($where2);
 $update = $this->db->query('UPDATE stok_tbl SET quantity = quantity + '.$qty.' WHERE id = '.$id.'');
 	 	if($product == false){
 	 	$response['status']			= 'Failed';
        $response['error_message']	= 'Invalid Product';
        $response['Update_at'] 		= date('Y-m-h H:i:s');
        $response['location_id'] 	= $data_adjust['id'];
        return $response;

      }else{
        
        $response = array(
 	 			'status' 			=> 'Success',
 	 			'Update_at' 		=> 	date('Y-m-h H:i:s'),
 	 			'location_id' 		=> $data_adjust['id'],
 	 			'location_name'  	=> $query['location'],
 	 			'Product' 			=> $data_adjust['product'],
 	 			'adjustment' 		=> $data_adjust['quantity'],
 	 			'stock_quantity'	=> $query['quantity']
 	 		);

 	 	$response_data = array(
 	 		'status_code' 	=> '200',
 	 		'request' 		=> '2',
 	 		'adjusted'	 	=> '1',
 	 		'result' 		=> $response,
 	 	);

 	 	$data_logs = array(
 	 		'id' => $data_adjust['id'],
 	 		'type' => 'Inbound',
 	 		'created_ad' => date('Y-m-h H:i:s'),
 	 		'adjustment' => $data_adjust['quantity'],
 	 		'quantity'  => $query['quantity']
 	 	);
		
		$this->db->insert('logs',$data_logs);       
        return $response_data;

      }
 	 }

  public function show_stok(){
  	return $this->db->select('*')->from('stok_tbl')->get()->row_array();
  }

  public function show_logs($id){
  	return $this->db->select('*')->from('logs')->where('id',$id)->get()->result();
  }

  public function show_logs_stock($id){
  	return $this->db->select('*')->from('stok_tbl')->where('id',$id)->get()->row_array();
  }

}