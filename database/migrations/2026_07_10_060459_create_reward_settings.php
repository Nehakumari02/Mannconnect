<?php

use Spatie\LaravelSettings\Migrations\SettingsMigration;

return new class extends SettingsMigration
{
    public function up(): void
    {
        $this->migrator->add('reward.registration', 10);
        $this->migrator->add('reward.email_verification', 10);
        $this->migrator->add('reward.mobile_verification', 20);
        $this->migrator->add('reward.profile_photo_upload', 10);
        $this->migrator->add('reward.complete_profile', 50);
        $this->migrator->add('reward.daily_login', 5);
        $this->migrator->add('reward.create_post', 10);
        $this->migrator->add('reward.upload_image_post', 15);
        $this->migrator->add('reward.upload_video_post', 20);
        $this->migrator->add('reward.receive_like', 1);
        $this->migrator->add('reward.receive_comment', 2);
        $this->migrator->add('reward.share_content', 5);
        $this->migrator->add('reward.refer_new_user', 100);
    }
};
