<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;
use App\Models\Trip;

class BookingsController extends Controller
{
    //

    public function index()
    {
        return Booking::all();
    }

    public function confirmAndRejects(Request $request, $id)
    {
     $status =    $request->value;
     

     return   Booking::where('id', $id)
            ->update(['status'=> $status]);

        
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        // $user = $request->user()->isAdmin;
        // log::info('This is some useful information.');
        // error_log($user);
        // if(!$user) {
        //     return response('user is not an admin!',403);
        // }
        
        // log::info('This is some useful information.');
        $bok =  Booking::create($request->all());
        $cat = Trip::find($bok->trip_id);
        $total = $cat->price * $bok->people_no;
        return Booking::where('id', $bok->id)
            ->update(['title'=>$cat->title,'image_url'=>$cat->image_url,'price'=>$total]);


    }


    public function update(Request $request, $id)
    {
     

     return   Booking::where('id', $id)
            ->update($request->all());

        
    }
    public function confirm(Request $request, $id)
    {
     

    //  return   Booking::where('id', $id)
    //         ->update(['status'=>'confirmed']);
            $cat = Booking::find($id);
            $cat->status =  'confirm';
            $cat->trip_id =  $cat->trip_id;
            $cat->full_name =  $cat->full_name;
            $cat->people_no =  $cat->people_no;
            $cat->phone =  $cat->phone;
            $cat->price =  $cat->price;
            $cat->title =  $cat->title;
            $cat->image_url =  $cat->image_url;
            
            $cat->save();

        
    }
    public function reject(Request $request, $id)
    {
     
        $cat = Booking::find($id);
        $cat->status =  'rejected';
        $cat->trip_id =  $cat->trip_id;
        $cat->full_name =  $cat->full_name;
        $cat->people_no =  $cat->people_no;
        $cat->phone =  $cat->phone;
        $cat->price =  $cat->price;
        $cat->title =  $cat->title;
        $cat->image_url =  $cat->image_url;
        
        $cat->save();
        
    }

    public function destroy($id)
    {
        return  Booking::find($id)
            ->delete();


    }

    
}
