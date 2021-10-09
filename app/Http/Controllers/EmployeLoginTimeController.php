<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\EmployeLoginDetail;
use App\Models\SalesExecutive;

class EmployeLoginTimeController extends Controller
{


    function uploadSelfie(Request $request)
    {
        $cid = null;
        if (
            $request->has("saleExecutiveId") and $request->has("profileImg") and $request->has("loginDate") and
            $request->has("latitude") and $request->has("longitude")
        ) {

            $fromSaleExective = SalesExecutive::where("emp_id", $request->saleExecutiveId);
            if ($fromSaleExective->get()->count() > 0) {
                $cid = $fromSaleExective->value('id');

                /* $imageName = time() . '.' . $request->profileImg->extension();
                $request->file("profileImg")->move(public_path("/selife"), $imageName); */

                //http://192.168.4.166:8000/storage/selfie/1617086655.jpg

                $imageName = time() . '.' . $request->profileImg->extension();
               $request->file("profileImg")->storeAs("public/selfie",$imageName);

                $add_login_detail = new EmployeLoginDetail;
                $add_login_detail->emp_id = $cid;
                $add_login_detail->sales_executive_id = $fromSaleExective->value('emp_id');
                $add_login_detail->profile =$imageName;
                $add_login_detail->login_date = $request->loginDate;
                $add_login_detail->latitude = $request->latitude;
                $add_login_detail->longitude = $request->longitude;

                $result = $add_login_detail->save();

                if ($result) {
                    return [
                        "status" => 0,
                        "message" => "Selfie Uploaded Sucessfully"
                    ];
                } else {
                    return [
                        "status" => 0,
                        "message" => "Something went wrong unable to save"
                    ];
                }
            } else {
                return [
                    "status" => 0,
                    "message" => "EmpId not Present in sales_executive table"
                ];
            }
        } else {
            return [
                "status" => 0,
                "message" => "Required Fields are missing i.e saleExecutiveId, profileImg,loginDate, latitude, longitude"
            ];
        }
    }
}
