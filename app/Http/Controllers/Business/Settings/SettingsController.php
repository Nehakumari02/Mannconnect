<?php
/*
|--------------------------------------------------------------------------
| ColibriPlus - The Social Network Web Application.
|--------------------------------------------------------------------------
| Author: Mansur Terla. Full-Stack Web Developer, UI/UX Designer.
| Website: www.terla.me
| E-mail: mansurtl.contact@gmail.com
| Instagram: @mansur_terla
| Telegram: @mansurtl_contact
|--------------------------------------------------------------------------
| Copyright (c)  ColibriPlus. All rights reserved.
|--------------------------------------------------------------------------
*/

namespace App\Http\Controllers\Business\Settings;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SettingsController extends Controller
{
    public function index()
    {
        $accountData = me()->businessAccount;

        if (! $accountData) {
            $accountData = me()->businessAccount()->create([
                'name' => me()->name,
                'billing_address' => []
            ]);
        }

        return view('business::settings.index', [
            'accountData' => $accountData
        ]);
    }

    public function edit()
    {
        return view('business::settings.edit');
    }
}
