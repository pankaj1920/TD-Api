<?php

namespace App\Http\Controllers;

use App\Models\DealerDetails;
use App\Models\SalesExecutive;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DealerController extends Controller
{

    function getDealerProductItem(Request $request)
    {
        if($request->has("empId") and $request->has("dealer_id")){

            $check_ex_data=SalesExecutive::where("emp_id",$request->empId);

            if($check_ex_data->get()->count() >0){

                $select_details=DB::table('dealer_brand')
                ->join("sales_executive","sales_executive.id","=","dealer_brand.sales_executive_id")
                ->join("admin_product_details","admin_product_details.id","=","dealer_brand.product_id")
                ->select("admin_product_details.id as product_id","admin_product_details.product_name","admin_product_details.basic_amount"
                ,"admin_product_details.total_amount","admin_product_details.tax"
                ,"admin_product_details.description" ,"admin_product_details.product_image"
                ,"admin_product_details.brand_id")
                ->where("dealer_brand.dealer_id","=",$request->dealer_id)
                ->get();

               /*  $select_details= DB::table("order_details")
                ->join("admin_product_details","admin_product_details.id","=","order_details.product_id")
                ->join("sales_executive","sales_executive.id","=","order_details.sales_executive_id")
                ->select("admin_product_details.id as product_id","admin_product_details.product_name","admin_product_details.basic_amount"
                ,"admin_product_details.total_amount","admin_product_details.tax"
                ,"admin_product_details.description" ,"admin_product_details.product_image"
                ,"admin_product_details.brand_id")
                ->where("order_details.dealer_id","=",$request->dealer_id)
                ->get(); */

                if($select_details->count() >0){
                        return[
                            "status"=>1,
                            "message"=>"Success",
                            "product_details"=>$select_details
                        ];
                }else{
                    return[
                        "status"=>0,
                        "message"=>"No data found"
                    ];
                }


            }else{
                return[
                    "status"=>0,
                    "message"=>"Enter a valid employee id"
                ];
            }

        }else{
            return[
                "status"=>0,
                "message"=>"Required fields are missing"
            ];
        }

    }

    function searchDealerProductItem(Request $request){

        if((strlen($request->search) >= 1) and $request->has("dealer_id")){


            $check_ex_data=SalesExecutive::where("emp_id",$request->empId);

            if($check_ex_data->get()->count() >0){


                $select_details= DB::table("order_details")
                ->join("admin_product_details","admin_product_details.id","=","order_details.product_id")
                ->join("sales_executive","sales_executive.id","=","order_details.sales_executive_id")
                ->select("admin_product_details.product_name","admin_product_details.basic_amount"
                ,"admin_product_details.total_amount","admin_product_details.tax"
                ,"admin_product_details.description" ,"admin_product_details.product_image"
                ,"admin_product_details.brand_id")
                ->where("order_details.dealer_id","=",$request->dealer_id)
                ->where("admin_product_details.product_name","LIKE","%$request->search%")
                ->get();

                if($select_details->count() >0){
                        return[
                            "status"=>1,
                            "message"=>"Success",
                            "product_details"=>$select_details
                        ];
                }else{
                    return[
                        "status"=>0,
                        "message"=>"No Data Found"
                    ];
                }


            }else{
                return[
                    "status"=>0,
                    "message"=>"Enter a valid employee id"
                ];
            }

        }else{
            return[
                "status"=>0,
                "message"=>"dealer id missing and search should be greater tha 3 letter"
            ];
        }
    }


}

