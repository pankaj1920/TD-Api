<?php

namespace App\Http\Controllers;

use App\Models\Routing;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AttendanceController extends Controller
{
    function getAttendance(Request $request){
        if($request->has('empId') and $request->has('date')){


           /*  $getAttendance = DB::table('sales_executive')
            ->join("routing","sales_executive.id","=","routing.sale_executive_id")
            ->where("routing.date","=",$request->date)
            ->where("sales_executive.emp_id","=",$request->empId)
            ->select("sales_executive.emp_id","sales_executive.first_name",
            "sales_executive.profile","sales_executive.email","sales_executive.phone_number"
            ,"routing.date","routing.login_time","routing.logout_time")
            ->get(); */

            $getAttendance =DB::table('sales_executive')
            ->join("emp_login_deatils","sales_executive.id","=","emp_login_deatils.sales_executive_id")
            ->where("emp_login_deatils.login_date","=",$request->date)
            ->where("emp_login_deatils.emp_id","=",$request->empId)
            ->select("emp_login_deatils.emp_id","sales_executive.first_name","sales_executive.profile",
            "sales_executive.email","sales_executive.phone_number","emp_login_deatils.login_date",
            "emp_login_deatils.login_time",
            "emp_login_deatils.logout_time")
            ->get();


            if($getAttendance->count() > 0){

                return[
                    "status"=>1,
                    "message"=>"sucess",
                    "data"=>$getAttendance->first()

                ];
            }else{
                return[
                    "status"=>0,
                    "message"=>"Wrong empId or Data Selected",

                ];
            }

        }else{
            return[
                "status"=>0,
                "message"=>"empId and date Fields are Missing"
            ];
        }
    }
}
