<?php

use Spatie\LaravelSettings\Migrations\SettingsMigration;

return new class extends SettingsMigration
{
    public function up(): void
    {
        $this->migrator->add('reward.limit_receive_like', 50);
        $this->migrator->add('reward.limit_receive_comment', 20);
        $this->migrator->add('reward.limit_share_content', 10);
        $this->migrator->add('reward.limit_refer_new_user', 3);
    }
};
