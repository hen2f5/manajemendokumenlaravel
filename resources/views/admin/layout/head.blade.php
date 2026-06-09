<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/png" href="{{ asset('assets/upload/image/'.$siteConfig->icon) }}" />
  <!-- Core Css -->
  <link rel="stylesheet" href="{{ asset('assets/admin/assets/css/styles.css') }}" />
  <title>{{ $title }}</title>
  <!-- Owl Carousel  -->
  <link rel="stylesheet" href="{{ asset('assets/admin/assets/libs/owl.carousel/dist/assets/owl.carousel.min.css') }}" />
  <!-- sweetalert -->
  <script src="{{ asset('assets/sweetalert2/sweetalert2.min.js') }}" type="text/javascript"></script>
  <link rel="stylesheet" href="{{ asset('assets/sweetalert2/sweetalert2.min.css') }}">
  <!-- fontawesome -->
  <link rel="stylesheet" href="{{ asset('assets/fontawesome-free-7.2.0/css/all.min.css') }}">
  <!-- select -->
  <link rel="stylesheet" href="{{ asset('assets/admin/assets/libs/select2/dist/css/select2.min.css') }}">
  <!-- jquery -->
  <script src="{{ asset('assets/jquery-ui/external/jquery/jquery.js') }}" type="text/javascript"></script>
  <script src="{{ asset('assets/jquery-ui/jquery-ui.min.js') }}" type="text/javascript"></script>
  <link rel="stylesheet" href="{{ asset('assets/jquery-ui/jquery-ui.min.css') }}">
  <!-- dropzone -->
  <link rel="stylesheet" href="{{ asset('assets/admin/assets/libs/dropzone/dist/min/dropzone.min.css') }}">
  <script src="{{ asset('assets/admin/assets/libs/dropzone/dist/min/dropzone.min.js') }}"></script>
  <!-- Owl Carousel  -->
  <link rel="stylesheet" href="{{ asset('assets/admin/assets/libs/owl.carousel/dist/assets/owl.carousel.min.css') }}" />
  <!-- viewerjs -->
    <link href="{{asset('assets/viewerjs/PDFViewerPlugin.css')}}" rel="stylesheet">
    <script src="{{asset('assets/viewerjs/PDFViewerPlugin.js')}}" type="text/javascript"></script>
    <!-- amcharts -->
    <script src="{{ asset('assets/amcharts5/index.js') }}"></script>
    <script src="{{ asset('assets/amcharts5/xy.js') }}"></script>
    <script src="{{ asset('assets/amcharts5/percent.js') }}"></script>
    <script src="{{ asset('assets/amcharts5/themes/Animated.js') }}"></script>
    <script src="{{ asset('assets/amcharts5/plugins/exporting.js') }}"></script>
    <script src="{{ asset('assets/amcharts5/deps/xlsx.js') }}"></script>
    <script src="{{ asset('assets/amcharts5/deps/pdfmake.js') }}"></script>
  <!-- custom -->
  <style type="text/css" media="screen">
    .body-wrapper,
    .container-fluid {
      width: 100% !important;
    }

    .page-wrapper {
      max-width: 1500px !important;
    }
    .select2-container {
        z-index: 2050 !important;
    }
  </style>
</head>

<body>