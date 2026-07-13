<?php

namespace App\Livewire\Admin\Config;

use App\Settings\RewardSettings;
use App\Support\Views\Flash;
use Livewire\Component;

class Rewards extends Component
{
    public array $formData = [];

    public function mount()
    {
        $rewardSettings = app(RewardSettings::class);

        $this->formData = [
            'registration' => $rewardSettings->registration,
            'email_verification' => $rewardSettings->email_verification,
            'mobile_verification' => $rewardSettings->mobile_verification,
            'profile_photo_upload' => $rewardSettings->profile_photo_upload,
            'complete_profile' => $rewardSettings->complete_profile,
            'daily_login' => $rewardSettings->daily_login,
            'create_post' => $rewardSettings->create_post,
            'upload_image_post' => $rewardSettings->upload_image_post,
            'upload_video_post' => $rewardSettings->upload_video_post,
            'receive_like' => $rewardSettings->receive_like,
            'receive_comment' => $rewardSettings->receive_comment,
            'share_content' => $rewardSettings->share_content,
            'refer_new_user' => $rewardSettings->refer_new_user,
        ];
    }

    public function submitForm()
    {
        $this->validate([
            'formData.registration' => ['required', 'integer', 'min:0'],
            'formData.email_verification' => ['required', 'integer', 'min:0'],
            'formData.mobile_verification' => ['required', 'integer', 'min:0'],
            'formData.profile_photo_upload' => ['required', 'integer', 'min:0'],
            'formData.complete_profile' => ['required', 'integer', 'min:0'],
            'formData.daily_login' => ['required', 'integer', 'min:0'],
            'formData.create_post' => ['required', 'integer', 'min:0'],
            'formData.upload_image_post' => ['required', 'integer', 'min:0'],
            'formData.upload_video_post' => ['required', 'integer', 'min:0'],
            'formData.receive_like' => ['required', 'integer', 'min:0'],
            'formData.receive_comment' => ['required', 'integer', 'min:0'],
            'formData.share_content' => ['required', 'integer', 'min:0'],
            'formData.refer_new_user' => ['required', 'integer', 'min:0'],
        ]);

        $rewardSettings = app(RewardSettings::class);

        $rewardSettings->registration = $this->formData['registration'];
        $rewardSettings->email_verification = $this->formData['email_verification'];
        $rewardSettings->mobile_verification = $this->formData['mobile_verification'];
        $rewardSettings->profile_photo_upload = $this->formData['profile_photo_upload'];
        $rewardSettings->complete_profile = $this->formData['complete_profile'];
        $rewardSettings->daily_login = $this->formData['daily_login'];
        $rewardSettings->create_post = $this->formData['create_post'];
        $rewardSettings->upload_image_post = $this->formData['upload_image_post'];
        $rewardSettings->upload_video_post = $this->formData['upload_video_post'];
        $rewardSettings->receive_like = $this->formData['receive_like'];
        $rewardSettings->receive_comment = $this->formData['receive_comment'];
        $rewardSettings->share_content = $this->formData['share_content'];
        $rewardSettings->refer_new_user = $this->formData['refer_new_user'];

        $rewardSettings->save();

        return redirect()->with('flashMessage', (new Flash(content: __('admin/flash.config.settings_success')))->get())
            ->route('admin.config.rewards');
    }

    public function render()
    {
        return view('livewire.admin.config.rewards');
    }
}
