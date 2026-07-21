<?php

use Illuminate\Support\Facades\DB;
use Spatie\LaravelSettings\Migrations\SettingsMigration;

return new class extends SettingsMigration
{
    public function up(): void
    {
        DB::transaction(function () {
            $this->migrator->add('ad.price_per_view', 0.01);
            $this->migrator->add('ad.price_per_click', 0.10);
            $this->migrator->add('ad.default_approval', true);
        });
    }
};
