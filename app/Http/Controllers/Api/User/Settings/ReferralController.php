<?php

namespace App\Http\Controllers\Api\User\Settings;

use App\Http\Controllers\Controller;
use App\Models\RewardLog;
use Illuminate\Http\Request;
use App\Traits\Http\Api\SupportsApiResponses;

class ReferralController extends Controller
{
    use SupportsApiResponses;

    public function index(Request $request)
    {
        $user = me();

        $referralCode = $user->username;
        $referralLink = url('/?ref=' . $referralCode);

        $totalPoints = RewardLog::where('user_id', $user->id)
            ->where('action_type', 'refer_new_user')
            ->sum('points');

        $totalReferrals = RewardLog::where('user_id', $user->id)
            ->where('action_type', 'refer_new_user')
            ->count();

        return $this->responseSuccess([
            'referral_code' => $referralCode,
            'referral_link' => $referralLink,
            'total_points' => $totalPoints,
            'total_referrals' => $totalReferrals,
        ]);
    }
}
