<?php

namespace App\Settings;

use Spatie\LaravelSettings\Settings;

class RewardSettings extends Settings
{
    public int $registration;
    public int $email_verification;
    public int $mobile_verification;
    public int $profile_photo_upload;
    public int $complete_profile;
    
    public int $daily_login;
    public int $create_post;
    public int $upload_image_post;
    public int $upload_video_post;
    
    public int $receive_like;
    public int $receive_comment;
    public int $share_content;
    public int $refer_new_user;

    public int $limit_receive_like;
    public int $limit_receive_comment;
    public int $limit_share_content;
    public int $limit_refer_new_user;

    public static function group(): string
    {
        return 'reward';
    }
}
