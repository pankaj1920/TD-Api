<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Routing;
use App\Models\EmployeLoginDetail;
use App\Models\DealerDetails;
use App\Models\SalesExecutive;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class OrdersController extends Controller
{

    function getAssignedOrders(Request $request)
    {

        $saleExId = null;


        if ($request->has("empId")) {
            $check_user = SalesExecutive::where("emp_id", $request->empId);

            if ($check_user->get()->count() > 0) {



                $assignedOder = DB::table('sales_executive')
                    ->join("routing", "sales_executive.id", "=", "routing.sale_executive_id")
                    ->join("dealer_details", "dealer_details.id", "=", "routing.dealer_id")
                    ->select(
                        "dealer_details.id as dealer_id",
                        "dealer_details.name",
                        "dealer_details.shop_name",
                        "dealer_details.address",
                        "routing.order_status",
                        "routing.date"
                    )
                    ->where("sales_executive.emp_id", "=", $request->empId)
                    ->where('routing.order_status', '=', 'pending')
                    ->get();

                if ($assignedOder->count() > 0) {
                    return [
                        "status" => 1,
                        "message" => "Sucess",
                        "assigned_order" => $assignedOder
                    ];
                } else {
                    return [
                        "status" => 1,
                        "message" => "No data found",

                    ];
                }
            } else {
                return [
                    "status" => 0,
                    "message" => "Wrong EmpId"
                ];
            }
        } else {
            return [
                "status" => 0,
                "message" => "empId field missing"
            ];
        }
    }


    function getCompletedOrders(Request $request)
    {

        if ($request->has('empId')) {

            $check_user = SalesExecutive::where('emp_id', $request->empId);

            if ($check_user->get()->count() > 0) {

                $completedOrder = DB::table('sales_executive')
                    ->join("routing", "sales_executive.id", "=", "routing.sale_executive_id")
                    ->join("dealer_details", "dealer_details.id", "=", "routing.dealer_id")
                    ->select(
                        "dealer_details.id as dealer_id",
                        "dealer_details.name",
                        "dealer_details.shop_name",
                        "dealer_details.address",
                        "routing.order_status",
                        "routing.date"
                    )
                    ->where("sales_executive.emp_id", "=", $request->empId)
                    ->where('routing.order_status', '=', 'completed')
                    ->get();

                if ($completedOrder->count() > 0) {
                    return [
                        "status" => 1,
                        "message" => "Sucess",
                        "completed_order" => $completedOrder
                    ];
                } else {
                    return [
                        "status" => 0,
                        "message" => "No data found",

                    ];
                }
            } else {
                return [
                    'status' => 0,
                    "message" => "Wrong Emp Id"
                ];
            }
        } else {
            return [
                "status" => 0,
                "message" => "empId field missing"
            ];
        }
    }

    function getPlacedOrderList(Request $request)
    {
        if ($request->has("dealer_id") and $request->has("date")) {

            $check_details = Routing::where("dealer_id", $request->dealer_id)->where("date", $request->date);

            if ($check_details->get()->count() > 0) {



                $check_payment_details = DB::table('payment_details')
                    ->join("routing", "routing.dealer_id", "=", "payment_details.dealer_id")
                    ->join("order_details", "order_details.ref_no", "=", "payment_details.reference_id")
                    ->where("routing.date", "=", "$request->date")
                    ->where("payment_details.purchase_date", "=", "$request->date")
                    ->join("admin_product_details", "admin_product_details.id", "=", "order_details.product_id")
                    ->select(
                        "order_details.dealer_id",
                        "routing.date",
                        "payment_details.purchase_date",
                        "order_details.order_quantity",
                        "admin_product_details.product_name",
                        "admin_product_details.product_image",
                        "admin_product_details.description",
                        "admin_product_details.basic_amount as product_price",
                        "routing.login_time"
                    )
                    ->get();

                if ($check_payment_details->count() > 0) {
                    return [
                        "status" => 1,
                        "message" => "Success",
                        "placed_order_list" => $check_payment_details
                    ];
                } else {
                    return [
                        "status" => 0,
                        "message" => "No Data"
                    ];
                }
            } else {
                return [
                    "status" => 0,
                    "message" => "No dealer id or date"
                ];
            }
        } else {
            return [
                "status" => 0,
                "message" => "Required fields are missing"
            ];
        }
    }

    function placeOrder(Request $request){
        if($request->has("reference_id") and $request->has("dealer_id") and $request->has("total_amount") and $request->has("pending_amount") and $request->has("advance_amount") and $request->has("order_item")){

            $reference_id = $request->get("reference_id");
            $dealer_id = $request->get("dealer_id");
            $total_amount = $request->get("total_amount");
            $pending_amount = $request->get("pending_amount");
            $advance_amount = $request->get("advance_amount");
            $order_item = $request->get("order_item");

            $payment_result = DB::table("payment_details")->insert([
                "reference_id"=>$reference_id,
                "dealer_id"=>$dealer_id,
                "total_amount"=>$total_amount,
                "pending_amount"=>$pending_amount,
                "advance_amount"=>$advance_amount
                      ]);

            $odr_qty_result = DB::table("order_details")->insert($order_item);

            if($odr_qty_result){
                return [
                    "status" => "0",
                    "message"=>"Data Inserted Sucessfully"
            ];
            }else{
                return [
                    "status" => "0",
                    "message"=>"Something went wrong"
            ];
            }


        }else{
            return [
                    "status" => "0",
                    "message"=>"Fields are missing"
            ];
        }
    }
}
