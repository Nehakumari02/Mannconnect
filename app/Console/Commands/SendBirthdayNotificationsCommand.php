<?php

namespace App\Console\Commands;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Console\Command;
use App\Notifications\User\Birthday\UserBirthdayNotification;

class SendBirthdayNotificationsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notifications:send-birthdays';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send birthday notifications to followers of users whose birthday is today.';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // Get today's day and month
        $today = Carbon::now();
        $day = $today->format('j'); // 1 to 31
        $month = $today->format('m'); // '01' to '12'

        // Find users whose birthday is today
        $birthdayUsers = User::active()
            ->where('birth_day', $day)
            ->where('birth_month', $month)
            ->whereDoesntHave('privacySettings', function ($query) {
                $query->where('birthdate_privacy', true);
            })
            ->get();

        foreach ($birthdayUsers as $user) {
            // Get actor data for the user whose birthday it is
            $actorData = [
                'id' => $user->id,
                'name' => $user->name,
                'username' => $user->username,
                'avatar' => $user->avatar
            ];

            // Notify all followers
            $followers = clone $user->followers; // Followers is a relation that returns Follow models

            foreach ($followers as $follow) {
                // The Follow model has a 'follower' relation which is the user who is following
                if ($follow->follower) {
                    $follow->follower->notify(new UserBirthdayNotification($actorData));
                }
            }
        }

        $this->info("Sent birthday notifications for " . $birthdayUsers->count() . " users.");
    }
}
