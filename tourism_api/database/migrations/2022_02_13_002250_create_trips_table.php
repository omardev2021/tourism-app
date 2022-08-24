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
        Schema::create('trips', function (Blueprint $table) {
            $table->id();
            $table->string('city');
            $table->string('title');
            $table->string('image_url');
            $table->text('description');
            $table->string('price');
            $table->date('from_date');
            $table->date('to_date');
            $table->unsignedBigInteger('hotel_id')->nullable();
            $table->foreign('hotel_id')->on('hotels')->references('id')
            ->onDelete('CASCADE')
            ->onUpdate('CASCADE');
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
        Schema::dropIfExists('trips');
    }
};
