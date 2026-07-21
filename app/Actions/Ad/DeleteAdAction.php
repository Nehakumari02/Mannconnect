<?php

namespace App\Actions\Ad;

use App\Models\Ad;
use App\Enums\Wallet\TransactionType;
use App\Services\Wallet\WalletService;
use App\Enums\Wallet\TransactionStatus;
use App\Actions\Media\DeleteMediaAction;
use App\Enums\Wallet\TransactionDirection;

class DeleteAdAction
{
	private $adData;

	public function __construct(Ad $adData)
	{
		$this->adData = $adData;
	}
	
	public function execute()
	{
		$this->adData->media->each(function ($mediaItem) {
			(new DeleteMediaAction($mediaItem))->execute();
		});

        $unspentBudget = $this->adData->total_budget - $this->adData->spent_budget;
        
        if($unspentBudget > 0) {
            $walletService = app(WalletService::class);
            $walletService->setUserData($this->adData->user)
                ->addWalletBalance($unspentBudget)
                ->addWalletTransaction([
                    'amount' => $unspentBudget,
                    'transaction_type' => TransactionType::REFUND,
                    'status' => TransactionStatus::COMPLETED,
                    'direction' => TransactionDirection::INCOMING,
                    'currency' => config('app.default_currency'),
                    'metadata' => [
                        'ad_id' => $this->adData->id,
                        'reason' => 'Ad deleted or rejected'
                    ]
                ]);
        }

		$this->adData->delete();
	}
}
