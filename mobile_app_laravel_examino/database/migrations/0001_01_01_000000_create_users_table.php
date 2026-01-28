<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   public function up(): void
{
    Schema::create('users', function (Blueprint $table) {

        $table->id();
        // Informations personnelles
        $table->string('nom');
        $table->string('prenom');

        // Authentification
        $table->string('email')->unique();
        $table->string('password'); // MDP hashé

        // Informations académiques
        $table->unsignedBigInteger('filiere_id');
        $table->string('cne')->unique();
        $table->date('date_ns');

        // Session
        $table->rememberToken();

        // Dates Laravel
        $table->timestamps();

        // Clé étrangère
        $table->foreign('filiere_id')
              ->references('id')
              ->on('filieres')
              ->onDelete('cascade');
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
        Schema::dropIfExists('password_reset_tokens');
        Schema::dropIfExists('sessions');
    }
};
