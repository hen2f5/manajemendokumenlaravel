<?php

namespace App\Libraries;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;
use App\Models\UserLogs;

class CheckLogin
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next): Response
    {

        // Jika belum login
        if (!Auth::check()) {
            return redirect('login')
                ->with('warning', 'Anda belum login atau sesi Anda telah berakhir.');
        }
        // Jika status user non aktif
        if (Auth::user()->status_user != 'Aktif') {
            Auth::logout();

            return redirect('login')
                ->with('warning', 'Akun Anda telah dinonaktifkan.');
        }
        /*
        |--------------------------------------------------------------------------
        | Simpan Log Aktivitas User
        |--------------------------------------------------------------------------
        */
        try {
            if (!$request->is('storage/*') && !$request->is('assets/admin/*') && !$request->is('./assets/template/*' && !$request->is('./assets/jquery-ui/*') && !$request->is('./assets/sweetalert2/*') && !$request->is('./assets/images/*'))) {
                UserLogs::create([
                    'id_user'     => Auth::id(),
                    'username'    => Auth::user()->username ?? null,
                    'ip_address'  => $request->ip(),
                    'url'         => $request->fullUrl(),
                    'user_agent'  => $request->userAgent(),
                ]);
            }
        } catch (\Exception $e) {
            // agar middleware tidak error jika log gagal
        }
        return $next($request);
    }
}
