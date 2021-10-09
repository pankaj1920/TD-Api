<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StockController extends Controller
{

    private $searchQuery;

    function getAdminBrandList(Request $request)
    {
        $brand_list = DB::table('admin_brands')->get();
        if ($brand_list->count() > 0) {
            return [
                "status" => 1,
                "message" => "sucess",
                "brands_list" => $brand_list
            ];
        } else {
            return [
                "status" => 0,
                "message" => "No Data Found"
            ];
        }
    }

    function searchAdminBrand(Request $request)
    {
        if ($request->has('search') and (strlen($request->search) >= 3)) {
            $search_brand = DB::table('admin_brands')
                ->where('admin_brands.brand_name', "LIKE", "%$request->search%")
                ->get();

            if ($search_brand->count() > 0) {
                return [
                    "status" => 1,
                    "message" => "sucess",
                    "brands_list" => $search_brand
                ];
            } else {
                return [
                    "status" => 0,
                    "message" => "No Data Found"
                ];
            }
        } else {
            return [
                "status" => 0,
                "message" => "search Field is missing and Query must have atleast 3 char"
            ];
        }
    }


    function stockItemList(Request $request)
    {


        if ($request->has('brandName')) {

            $this->searchQuery = $request->search;

            $search_stock = DB::table('admin_brands')
                ->join('admin_product_details', 'admin_brands.id', '=', 'admin_product_details.brand_id')
                ->where('admin_brands.brand_name', '=', $request->brandName)
                ->get();

            if ($search_stock->count() > 0) {
                return [
                    "status" => 1,
                    "message" => "sucess",
                    "stock_items" => $search_stock
                ];
            } else {
                return [
                    "status" => 0,
                    "message" => "No Data Found"
                ];
            }
        } else {

            return [
                "status" => 0,
                "message" => "brandName Field is missing"
            ];
        }
    }



    function searchStockItem(Request $request)
    {

        if ($request->has('search') and (strlen($request->search) >= 3) and $request->has('brandName')) {

            $this->searchQuery = $request->search;

            $search_stock = DB::table('admin_brands')
                ->join('admin_product_details', 'admin_brands.id', '=', 'admin_product_details.brand_id')
                ->where('admin_brands.brand_name', '=', $request->brandName)
                ->where(function ($query) {
                    $query->where('admin_product_details.product_name', "LIKE", "%$this->searchQuery%")
                        ->orWhere("admin_product_details.product_desc", "LIKE", "%$this->searchQuery%");
                })
                ->get();

            if ($search_stock->count() > 0) {
                return [
                    "status" => 1,
                    "message" => "sucess",
                    "stock_items" => $search_stock
                ];
            } else {
                return [
                    "status" => 0,
                    "message" => "No Data Found"
                ];
            }
        } else {

            return [
                "status" => 0,
                "message" => "search or brandName Field is missing and Query must have atleast 3 char"
            ];
        }
    }

    function addProductToDealer(Request $request){


    }
}
