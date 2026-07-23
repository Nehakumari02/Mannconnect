<div>
    <form wire:submit.prevent="submitForm">
        @csrf
        <x-accordion.form title="{{ __('admin/config.ads_settings') }}">
            <div class="mb-6">
                <x-form.text-input
                    inputType="number"
                    wire:model="formData.price_per_view"
                    name="formData.price_per_view"
                    labelText="{{ __('admin/config.form.ads_price_per_view') }}"
                placeholder="0.01">
                </x-form.text-input>
            </div>
            <div class="mb-6">
                <x-form.text-input
                    inputType="number"
                    wire:model="formData.price_per_click"
                    name="formData.price_per_click"
                    labelText="{{ __('admin/config.form.ads_price_per_click') }}"
                placeholder="0.10">
                </x-form.text-input>
            </div>
            <div class="mb-6 flex gap-2">
                <input type="checkbox" wire:model="formData.default_approval" id="default_approval" class="rounded text-brand-900 border-bord-pr focus:ring-brand-900 focus:ring-2">
                <label for="default_approval" class="text-par-s text-lab-pr">{{ __('admin/config.form.ads_auto_approve') }}</label>
            </div>

            <x-ui.buttons.pill type="submit" btnText="{{ __('buttons.save_changes') }}"></x-ui.buttons.pill>
        </x-accordion.form>
    </form>
</div>
