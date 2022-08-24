<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hotel;

class HotelsController extends Controller
{
    //

    public function index()
    {
        return Hotel::all();
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
        return Hotel::create($request->all());
    }
}
