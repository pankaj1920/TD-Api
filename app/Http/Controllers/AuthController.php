<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SalesExecutive;

class AuthController extends Controller
{
    //

    function login(Request $request){
        if($request->has("empId") and $request->has("password")){
           $check_user = SalesExecutive::where("emp_id",$request->empId)->where("password",$request->password);
            if($check_user->get()->count() > 0){
                    return[
                        "status"=>1,
                        "message"=>"Login Sucess",
                        "data"=> $check_user->get()->first()
                    ];
            }else{
                return [
                    "status"=>0,
                    "message" => "Wrong EmpId or Password"
                ];
            }
        }else{
            return [
                "status"=> 0,
                "message"=>"empId and Password Are Missing"
            ];
        }
    }

    function generateOtp(Request $request){
        if($request->has("phone")){
            $check_user = SalesExecutive::where("phone_number",$request->phone);
            if($check_user->get()->count() > 0){
                    $result = $check_user->update([
                        "otp"=> mt_rand(0000,9999)
                    ]);

                    if($result){
                        return [
                            "status"=>1,
                            "message"=>"Otp Generated Sucessfully"
                        ];
                    }else{
                        return [
                            "status"=>0,
                            "message"=>"Something went wrong"
                        ];
                    }
            }else{
                return [
                    "status"=>0,
                    "message"=>"Wrong Mobile Number"
                ];
            }
        }else{
            return[
                "status"=>0,
                "message"=>"phone field number is missing"
            ];
        }
    }

    function verifyForgotPassOtp(Request $request){
        if($request->has("phone") and $request->has("otp")){
            $check_user = SalesExecutive::where("phone_number",$request->phone)->where("otp",$request->otp);
            if($check_user ->get()->count() > 0){
                return [
                    "status"=>1,
                    "message"=>"Otp Verifed Sucessfully"
                ];
            }else{
                return [
                    "status"=>0,
                    "message"=>"Wrong phone or otp"
                ];
            }
        }else{
            return [
                "status"=>0,
                "message"=> "phone or otp fields are missing"
            ];
        }
    }

    function changePassword(Request $request){
        if($request->has("phone") and $request->has("password")){
            $check_user = SalesExecutive::where("phone_number",$request->phone);
            if($check_user->get()->count()>0){
                $result = $check_user->update([
                    "password"=>$request->password
                ]);

                if($result){
                    return[
                        "status"=>1,
                        "message"=>"password change sucessfully"
                    ];
                }else{
                    return[
                        "status"=>0,
                        "message"=>"Something went wrong"
                    ];
                }
            }else{
                return[
                    "status"=>0,
                    "message"=>"Invalid Phone number"
                ];
            }
        }else{
            return[
                "status"=>0,
                "message"=>"phone or password are missing"
            ];
        }
    }



    function updateProfileImage(Request $request){
        if($request->has("phone") and $request->has("profile_image") and $request->has("name")){
            $check_user = SalesExecutive::where("phone_number",$request->phone);
            if($check_user){
                $result = $check_user->update([
                    "profile"=> $request->file("profile_image")->store("images"),
                    "first_name"=>$request->name
                ]);

                if($result){
                    return[
                        "status"=>1,
                        "message"=>"Profile Image Changed Sucessfully"
                    ];
                }else{
                    return[
                        "status"=>0,
                        "message"=>"Something went wrong"
                    ];
                }
            }
        }else{
            return[
                "status"=>0,
                "message"=>"profile_image field is missing"
            ];
        }
    }


    function getUserDetails(Request $request){
        if($request->has("emp_id")){

            $check_user=SalesExecutive::where("emp_id",$request->emp_id);
            if($check_user->exists()){

                return[
                    "status"=>1,
                    "message"=>"Success",
                    "email_id"=>$check_user->first()->email,
                    "first_name"=>$check_user->first()->first_name,
                    "profile"=>$check_user->first()->profile,
                    "emp_id"=>$check_user->first()->emp_id,
                    "phone_number"=>$check_user->first()->phone_number,
                ];

            }else{
                return[
                    "status"=>0,
                    "message"=>"No Data"
                ];
            }


        }else{
            return[
                "status"=>0,
                "message"=>"Required fields are missing"
            ];
        }
    }

}
