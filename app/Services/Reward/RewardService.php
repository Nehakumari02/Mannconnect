<?php

namespace App\Services\Reward;

use App\Models\User;
use App\Models\RewardLog;
use App\Settings\RewardSettings;
use Carbon\Carbon;

class RewardService
{
    protected RewardSettings $settings;

    public function __construct(RewardSettings $settings)
    {
        $this->settings = $settings;
    }

    public function award(User $user, string $actionType, ?User $relatedUser = null): void
    {
        // Don't award points to a user that doesn't exist (e.g. guests)
        if (! $user || ! $user->id) {
            return;
        }

        $points = $this->getPointsForAction($actionType);

        if ($points <= 0) {
            return;
        }

        // Rate limiting / Checks
        if (! $this->isEligible($user, $actionType)) {
            return;
        }

        // Log the reward
        RewardLog::create([
            'user_id' => $user->id,
            'action_type' => $actionType,
            'points' => $points,
        ]);

        // Add points
        $user->increment('points', $points);
    }

    protected function getPointsForAction(string $actionType): int
    {
        return match ($actionType) {
            'registration' => $this->settings->registration,
            'email_verification' => $this->settings->email_verification,
            'mobile_verification' => $this->settings->mobile_verification,
            'profile_photo_upload' => $this->settings->profile_photo_upload,
            'complete_profile' => $this->settings->complete_profile,
            'daily_login' => $this->settings->daily_login,
            'create_post' => $this->settings->create_post,
            'upload_image_post' => $this->settings->upload_image_post,
            'upload_video_post' => $this->settings->upload_video_post,
            'receive_like' => $this->settings->receive_like,
            'receive_comment' => $this->settings->receive_comment,
            'share_content' => $this->settings->share_content,
            'refer_new_user' => $this->settings->refer_new_user,
            default => 0,
        };
    }

    protected function isEligible(User $user, string $actionType): bool
    {
        // One-time actions
        $oneTimeActions = [
            'registration',
            'email_verification',
            'mobile_verification',
            'profile_photo_upload',
            'complete_profile',
            'create_post',
            'upload_image_post',
        ];

        if (in_array($actionType, $oneTimeActions)) {
            $exists = RewardLog::where('user_id', $user->id)
                ->where('action_type', $actionType)
                ->exists();
            
            return !$exists;
        }

        // Daily actions (once per day)
        $dailyActions = [
            'daily_login',
            'upload_video_post',
        ];

        if (in_array($actionType, $dailyActions)) {
            $existsToday = RewardLog::where('user_id', $user->id)
                ->where('action_type', $actionType)
                ->whereDate('created_at', Carbon::today())
                ->exists();
            
            return !$existsToday;
        }

        // Dynamic daily limits
        $dynamicDailyLimitActions = [
            'receive_like' => $this->settings->limit_receive_like ?? 50,
            'receive_comment' => $this->settings->limit_receive_comment ?? 20,
            'share_content' => $this->settings->limit_share_content ?? 10,
            'refer_new_user' => $this->settings->limit_refer_new_user ?? 3,
        ];

        if (array_key_exists($actionType, $dynamicDailyLimitActions)) {
            $limit = $dynamicDailyLimitActions[$actionType];
            
            $countToday = RewardLog::where('user_id', $user->id)
                ->where('action_type', $actionType)
                ->whereDate('created_at', Carbon::today())
                ->count();
                
            return $countToday < $limit;
        }

        // Other actions (no limit or managed elsewhere)
        return true;
    }
}
