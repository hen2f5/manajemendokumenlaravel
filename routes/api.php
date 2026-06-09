<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\MenuAplikasiController;

// menu aplikasi
Route::get('/menu-aplikasi', [MenuAplikasiController::class, 'index']);

