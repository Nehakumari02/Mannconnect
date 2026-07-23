<?php

namespace App\Http\Controllers\Api\User\Settings;

use App\Http\Controllers\Controller;
use App\Models\RewardLog;
use Illuminate\Http\Request;
use App\Http\Resources\User\Settings\RewardLogResource;
use App\Support\Facades\DateTime;
use Illuminate\Support\Str;
use App\Traits\Http\Api\SupportsApiResponses;

class RewardHistoryController extends Controller
{
    use SupportsApiResponses;

    public function index(Request $request)
    {
        $limit = $request->integer('limit', 20);

        $logs = RewardLog::where('user_id', me()->id)
            ->orderBy('created_at', 'desc')
            ->paginate($limit);

        return RewardLogResource::collection($logs)->additional([
            'total_points' => me()->points
        ]);
    }
}
