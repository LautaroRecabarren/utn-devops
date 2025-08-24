<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class WelcomeDataSet extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('welcome', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->string('description');
        });

        DB::table('welcome')->insert([
            ['description' => 'Este es un registro de la base de datos'],
            ['description' => 'Este es otro registro de la base de datos']
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('welcome');
    }
}
