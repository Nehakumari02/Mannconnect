<?php

namespace App\Http\Controllers\Api\Ad;

use App\Models\Ad;
use Illuminate\Http\Request;
use App\Actions\Ad\AdShowAction;
use App\Http\Controllers\Controller;
use App\Http\Resources\Ad\AdResource;
use App\Traits\Http\Api\SupportsApiResponses;

class AdController extends Controller
{
    use SupportsApiResponses;

    public function getAd(Request $request)
    {
        $prevAdId = $request->input('prev_ad_id');
        $type = $request->input('type', 'sidebar');

        // Try to find an ad that has not been shown in the last X minutes.
        // This is to ensure that we don't show the same ad too often.

        $adData = Ad::published()->approved()->with('media')->whereColumn('spent_budget', '<', 'total_budget')->when($prevAdId, function ($query) use ($prevAdId) {
            $query->where('id', '!=', $prevAdId);
        })->where(function ($query) {
            $query->whereNull('last_show_at')->orWhere('last_show_at', '<', now()->subMinutes(config('ads.refresh_interval')));
        })->where(function ($query) use ($type) {
            if ($type == 'sidebar') {
                $query->whereNull('type')->orWhere('type', 'sidebar');
            } else {
                $query->where('type', $type);
            }
        })->inRandomOrder()->first();

        // If no ad is found, try to find any existing published ad.
        // This is to ensure that we always have an ad to show.

        if(! $adData) {
            $adData = Ad::published()->approved()->with('media')->whereColumn('spent_budget', '<', 'total_budget')->where(function ($query) use ($type) {
                if ($type == 'sidebar') {
                    $query->whereNull('type')->orWhere('type', 'sidebar');
                } else {
                    $query->where('type', $type);
                }
            })->inRandomOrder()->first();
        }

        // If no any kind of ad is found, return not found error.

        if(! $adData) {
            return $this->responseNotFoundError();
        }
        
        defer(function () use ($adData) {
            (new AdShowAction($adData))->execute();
        });

        return $this->responseSuccess([
            'data' => AdResource::make($adData)
        ]);
    }

    public function clickAd($adId)
    {
        $adData = Ad::published()->approved()->findOrFail($adId);

        (new \App\Actions\Ad\AdClickAction($adData))->execute();

        return $this->responseSuccess();
    }
}
