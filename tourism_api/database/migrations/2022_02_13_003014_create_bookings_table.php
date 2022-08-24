<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->string('full_name');
            $table->string('people_no');
            $table->string('phone');
            $table->enum('status',['pending','confirm','rejected'])->default('pending');
            $table->string('title')->nullable();
            $table->string('image_url')->nullable();
            $table->unsignedBigInteger('trip_id');
            $table->foreign('trip_id')->on('trips')->references('id')
            ->onDelete('CASCADE')
            ->onUpdate('CASCADE');
            $table->string('price')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bookings');
    }
};
