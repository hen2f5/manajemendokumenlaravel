<?php 
use App\Models\Konfigurasi;
$siteConfig = Konfigurasi::listing();
?>
@include('layout/head')
@include('layout/header')
@include($content)
@include('layout/footer')