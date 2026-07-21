<?php

namespace App\Actions\Ad;

use App\Models\Ad;
use App\Support\Money;
use App\Enums\Ad\AdStatus;

class AdClickAction
{
	private $adData;

	public function __construct(Ad $adData)
	{
		$this->adData = $adData;
	}
	
	public function execute()
	{
		if($this->adData->spent_budget >= $this->adData->total_budget) {
			$this->adData->update([
				'status' => AdStatus::COMPLETED
			]);
		}
		else {
			$this->adData->update([
				'clicks_count' => ($this->adData->clicks_count + 1),
				'spent_budget' => Money::add($this->adData->spent_budget, $this->adData->price_per_click)
			]);

            if($this->adData->spent_budget >= $this->adData->total_budget) {
                $this->adData->update([
                    'status' => AdStatus::COMPLETED
                ]);
            }
		}
	}
}
