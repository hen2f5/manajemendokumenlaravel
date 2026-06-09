<?php

use App\Models\Konfigurasi;

$siteConfig = Konfigurasi::listing();
?>
@include('admin/layout/head')
@include('admin/layout/menu')
@include('admin/layout/header')
@include($content)
@include('admin/layout/footer')