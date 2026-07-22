<?php

namespace App\Settings;

use Spatie\LaravelSettings\Settings;

class AdSettings extends Settings
{
    public float $price_per_view;
    public float $price_per_click;
    public bool $default_approval;

    public static function group(): string
    {
        return 'ad';
    }
}
