<form wire:submit.prevent="submitForm">
    @csrf
    
    <div class="mb-6">
        <h3 class="font-bold text-lg mb-2">Account Completion Rewards</h3>
    </div>

    <x-form.group>
        <x-form.text-input type="number" labelText="Registration" wire:model="formData.registration" name="formData.registration"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Email Verification" wire:model="formData.email_verification" name="formData.email_verification"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Mobile Verification" wire:model="formData.mobile_verification" name="formData.mobile_verification"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Profile Photo Upload" wire:model="formData.profile_photo_upload" name="formData.profile_photo_upload"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Complete Profile" wire:model="formData.complete_profile" name="formData.complete_profile"></x-form.text-input>
    </x-form.group>

    <div class="mb-6 mt-8">
        <x-div/>
        <h3 class="font-bold text-lg mb-2 mt-6">Activity Points</h3>
    </div>

    <x-form.group>
        <x-form.text-input type="number" labelText="Daily Login (First time in a day)" wire:model="formData.daily_login" name="formData.daily_login"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Create Post (First Post Only)" wire:model="formData.create_post" name="formData.create_post"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Upload Image Post (First Post Only)" wire:model="formData.upload_image_post" name="formData.upload_image_post"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Upload Video Post (First time in a day)" wire:model="formData.upload_video_post" name="formData.upload_video_post"></x-form.text-input>
    </x-form.group>

    <div class="mb-6 mt-8">
        <x-div/>
        <h3 class="font-bold text-lg mb-2 mt-6">Engagement Points</h3>
    </div>

    <x-form.group>
        <x-form.text-input type="number" labelText="Receive Like" wire:model="formData.receive_like" name="formData.receive_like"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Receive Comment" wire:model="formData.receive_comment" name="formData.receive_comment"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Share Content" wire:model="formData.share_content" name="formData.share_content"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Refer New User (Only for verified user)" wire:model="formData.refer_new_user" name="formData.refer_new_user"></x-form.text-input>
    </x-form.group>

    <div class="mb-6 mt-8">
        <x-div/>
        <h3 class="font-bold text-lg mb-2 mt-6">Daily Limits (Max Times Per Day)</h3>
    </div>

    <x-form.group>
        <x-form.text-input type="number" labelText="Max Likes Received Per Day" wire:model="formData.limit_receive_like" name="formData.limit_receive_like"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Max Comments Received Per Day" wire:model="formData.limit_receive_comment" name="formData.limit_receive_comment"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Max Content Shares Per Day" wire:model="formData.limit_share_content" name="formData.limit_share_content"></x-form.text-input>
    </x-form.group>
    <x-form.group>
        <x-form.text-input type="number" labelText="Max New User Referrals Per Day" wire:model="formData.limit_refer_new_user" name="formData.limit_refer_new_user"></x-form.text-input>
    </x-form.group>

    <x-ui.buttons.pill
        type="submit"
        size="sm"
        btnText="{{ __('buttons.save_changes') }}">
    </x-ui.buttons.pill>
</form>
