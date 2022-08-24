<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'full_name',
        'people_no',
        'phone',
        'trip_id',
        'price',
        'title',
        'image_url'
      
        
    ];


    public function trip()
    {
       return $this->hasone(Trip::class);
    }
}
