<?php

namespace App\Livewire\Admin\Config;

use App\Settings\AdSettings;
use App\Support\Views\Flash;
use Livewire\Component;

class Ads extends Component
{
    public array $formData = [];

    public function mount()
    {
        $adSettings = app(AdSettings::class);

        $this->formData = [
            'price_per_view' => $adSettings->price_per_view,
            'price_per_click' => $adSettings->price_per_click,
            'default_approval' => $adSettings->default_approval,
        ];
    }

    public function submitForm()
    {
        $this->validate([
            'formData.price_per_view' => ['required', 'numeric', 'min:0'],
            'formData.price_per_click' => ['required', 'numeric', 'min:0'],
            'formData.default_approval' => ['required', 'boolean'],
        ], attributes: [
            'formData.price_per_view' => 'Price Per View',
            'formData.price_per_click' => 'Price Per Click',
            'formData.default_approval' => 'Auto-Approve Ads',
        ]);

        $adSettings = app(AdSettings::class);

        $adSettings->price_per_view = $this->formData['price_per_view'];
        $adSettings->price_per_click = $this->formData['price_per_click'];
        $adSettings->default_approval = $this->formData['default_approval'];

        $adSettings->save();

        return redirect()->with('flashMessage', (new Flash(content: __('admin/flash.config.settings_success')))->get())
            ->route('admin.config.ads');
    }

    public function render()
    {
        return view('livewire.admin.config.ads');
    }
}
