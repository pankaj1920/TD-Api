<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SampleController extends Controller
{
    function insert(Request $request){
        $data =   $request->get('data');
        $name = $request->get('name');
        $age = $request->get('age');


          $result = DB::table('demo')->insert($data);
          $result = DB::table('demo2')->insert([
              "name"=>$name,
              "age"=>$age
          ]);

          if($result){
              return[
                  "status"=>1,
                    "message"=>"Sucess"
              ];
          }else{
            return[
                "status"=>1,
                  "message"=>"Failed"
            ];
          }
    }
}
