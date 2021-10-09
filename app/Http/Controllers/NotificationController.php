<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NotificationController extends Controller
{
    function getNotification(Request $request)
    {
        if ($request->has("emp_id")) {

            $notification_details = DB::table('routing')
                ->join("employee_notification", 'routing.id', '=', "employee_notification.route_assigned_id")
                ->select("employee_notification.title", "employee_notification.body", "employee_notification.created_date")
                ->where("employee_notification.emp_id", "=", $request->emp_id)
                ->get();

            if ($notification_details->count() > 0) {
                return [
                    "status" => 1,
                    "message" => "Success",
                    "notifications" => $notification_details

                ];
            } else {
                return [
                    "status" => 1,
                    "message" => "No data"


                ];
            }
        } else {
            return [
                "status" => 0,
                "message" => "Required fields are missing"
            ];
        }
    }

    function postNotificationToken(Request $request){
        if($request->has("emp_id") and $request->has("token")){

            $check_user=DB::table('notification_token')->where("emp_id",$request->emp_id);

            if($check_user->get()->count()>0){
                $result=$check_user->update([
                    "token"=>$request->token
                ]);

                if($result){

                    return[
                        "status"=>1,
                        "message"=>"Token updated successfully"
                    ];

                }else{

                    return[
                        "status"=>0,
                        "message"=>"Could not update new token"
                    ];

                }


            }else{

                $insert_details=DB::table('notification_token')->insert([
                    "emp_id"=>$request->emp_id,
                    "token"=>$request->token
                ]);

                if($insert_details){
                    return[
                        "status"=>1,
                        "message"=>"Token inserted successfully"
                    ];

                }
                else{
                    return[
                        "status"=>0,
                        "message"=>"Could not insert new token"
                    ];
                }
            }

        }else{
            return[
                "status"=>0,
                "message"=>"Required fields are missing"
            ];
        }
    }
}
