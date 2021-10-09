<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SupportController extends Controller
{
    function postSupportQuery(Request $request){
        if($request->has("emp_id") and $request->has("message")){

         $insert_query=DB::table('support')->insert([
             'emp_id' => $request->emp_id,
             'query' => $request->message
         ]);

         if($insert_query){
             return[
                 "status"=>1,
                "message"=>"Query posted successfully"
             ];

         }else{
             return[
                 "status"=>0,
                 "message"=>"Could not insert query"
             ];
         }

        }else{
            return[
                "status"=>0,
                "message"=>"fields are missing"
            ];
        }
    }
}
