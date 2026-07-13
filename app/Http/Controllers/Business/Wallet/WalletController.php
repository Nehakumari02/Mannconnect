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

namespace App\Http\Controllers\Business\Wallet;

use App\Http\Controllers\Controller;

class WalletController extends Controller
{
    public function index()
    {
        $walletData = me()->wallet;

        if (! $walletData) {
            $walletData = me()->wallet()->create([
                'wallet_number' => $this->generateUniqueWalletNumber(),
                'balance' => config('wallet.default_balance'),
                'currency' => config('app.default_currency'),
            ]);
        }

        $cashouts = me()->cashouts()->latest()->paginate(10);

        return view('business::wallet.overview.index', [
            'walletData' => $walletData,
            'cashouts' => $cashouts
        ]);
    }

    private function generateUniqueWalletNumber()
    {
        do {
            $number = strtoupper(\Illuminate\Support\Str::random(16));

            $prefix = config('wallet.wallet_number_prefix');

            if($prefix) {
                $number = "{$prefix}-{$number}";
            }
        }

        while (\App\Models\Wallet::where('wallet_number', $number)->exists());

        return $number;
    }

    public function createCashout()
    {
        return view('business::wallet.cashout.create');
    }
}
