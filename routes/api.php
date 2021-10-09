<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EmployeLoginTimeController;
use App\Http\Controllers\OrdersController;
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\SupportController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\DealerController;
use App\Http\Controllers\SampleController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post("sale_executive/login", [AuthController::class, "login"]);

Route::post("sale_executive/generateOtp", [AuthController::class, "generateOtp"]);

Route::post("sale_executive/verifyForgotPassOtp", [AuthController::class, "verifyForgotPassOtp"]);

Route::post("sale_executive/changePassword", [AuthController::class, "changePassword"]);

Route::post("sale_executive/updateProfileImage", [AuthController::class, "updateProfileImage"]);

Route::post("sale_executive/uploadSelfie", [EmployeLoginTimeController::class, "uploadSelfie"]);

Route::get("sale_executive/getAssignedOrder", [OrdersController::class, "getAssignedOrders"]);

Route::get("sale_executive/getCompletedOrders", [OrdersController::class, "getCompletedOrders"]);

Route::get("sale_executive/getPlacedOrderList", [OrdersController::class, "getPlacedOrderList"]);

Route::post("sale_executive/placeOrder", [OrdersController::class, "placeOrder"]);

Route::get("sale_executive/getAttendance", [AttendanceController::class, "getAttendance"]);

Route::get("sale_executive/searchStockItem", [StockController::class, "searchStockItem"]);

Route::get("sale_executive/stockItemList", [StockController::class, "stockItemList"]);

Route::get("sale_executive/getAdminBrandList", [StockController::class, "getAdminBrandList"]);

Route::get("sale_executive/searchAdminBrand", [StockController::class, "searchAdminBrand"]);

Route::get("sale_executive/getNotification", [NotificationController::class, "getNotification"]);

Route::post("sale_executive/postNotificationToken", [NotificationController::class, "postNotificationToken"]);

Route::post("sale_executive/postSupportQuery", [SupportController::class, "postSupportQuery"]);

Route::get("sale_executive/getDealerProductItem", [DealerController::class, "getDealerProductItem"]);

Route::get("sale_executive/searchDealerProductItem", [DealerController::class, "searchDealerProductItem"]);

Route::get("sale_executive/getUserDetails", [AuthController::class, "getUserDetails"]);

Route::post("sale_executive/insert", [SampleController::class, "insert"]);
