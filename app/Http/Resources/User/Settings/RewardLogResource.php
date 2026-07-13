<?php

namespace App\Http\Resources\User\Settings;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Str;

class RewardLogResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'action_type' => $this->action_type,
            'action_name' => Str::headline($this->action_type),
            'points' => $this->points,
            'created_at' => is_object($this->created_at) && method_exists($this->created_at, 'getTimeAgo') ? $this->created_at->getTimeAgo() : $this->created_at->diffForHumans()
        ];
    }
}
