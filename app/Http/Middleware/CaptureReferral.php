<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\User;
use Illuminate\Support\Facades\Cookie;

class CaptureReferral
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $response = $next($request);

        if ($request->has('ref')) {
            $referrerUsername = $request->input('ref');
            $referrer = User::where('username', $referrerUsername)->first();
            if ($referrer) {
                // 30 days cookie
                Cookie::queue('referral_id', $referrer->id, 60 * 24 * 30);
            }
        }

        return $response;
    }
}
