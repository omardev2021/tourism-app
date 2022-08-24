<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Trip extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'image_url',
        'city',
        'description',
        'price',
        'from_date',
        'to_date'
      
        
    ];

    public function hotel()
    {
       return $this->hasOne(Hotel::class);
    }

    public function booking()
    {
      return $this->belongsTo(Booking::class);
    }
}
