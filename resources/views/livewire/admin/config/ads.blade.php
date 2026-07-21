<div>
    <form wire:submit.prevent="submitForm">
        @csrf
        <x-accordion.form title="Ads Settings">
            <div class="mb-6">
                <x-form.text-input
                    inputType="number"
                    wire:model="formData.price_per_view"
                    name="formData.price_per_view"
                    labelText="Price Per View"
                placeholder="0.01">
                </x-form.text-input>
            </div>
            <div class="mb-6">
                <x-form.text-input
                    inputType="number"
                    wire:model="formData.price_per_click"
                    name="formData.price_per_click"
                    labelText="Price Per Click"
                placeholder="0.10">
                </x-form.text-input>
            </div>
            <div class="mb-6 flex gap-2">
                <input type="checkbox" wire:model="formData.default_approval" id="default_approval" class="rounded text-brand-900 border-bord-pr focus:ring-brand-900 focus:ring-2">
                <label for="default_approval" class="text-par-s text-lab-pr">Auto-Approve Ads</label>
            </div>

            <x-ui.buttons.pill type="submit" btnText="{{ __('admin/config.form.save_button') }}"></x-ui.buttons.pill>
        </x-accordion.form>
    </form>
</div>
