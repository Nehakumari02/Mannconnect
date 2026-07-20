<?php

namespace App\Notifications\User\Birthday;

use Illuminate\Bus\Queueable;
use App\Constants\Notifications;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Notifications\Channels\WebPushChannel;
use App\Notifications\Traits\BaseNotification;
use Illuminate\Notifications\Messages\MailMessage;

class UserBirthdayNotification extends Notification implements ShouldQueue
{
    use Queueable, BaseNotification;

    public array $actorData;
    public $notificationType;

    public function __construct(array $actorData)
    {
        $this->actorData = $actorData;
        $this->notificationType = Notifications::BIRTHDAY;
    }

    public function via(object $notifiable): array
    {
        $channels = [];

        if($notifiable->pushNotificationSettings->birthdays) {
            if($this->isPushEnabled()) {
                array_push($channels, WebPushChannel::class);
            }

            if($this->isBroadcastEnabled()) {
                array_push($channels, 'broadcast');
            }

            array_push($channels, 'database');
        }

        if($notifiable->emailNotificationSettings->birthdays) {
            if($this->isEmailEnabled()) {
                array_push($channels, 'mail');
            }
        }

        return $channels;
    }

    public function toPush(object $notifiable): array
    {
        return [];
    }

    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage())
            ->subject(__('notifications.subjects.birthday', ['name' => $this->actorData['name']], $notifiable->language))
            ->view($this->notificationViewPath, [
                'notifiable' => $notifiable,
                'data' => $this->getData(),
                'notificationType' => $this->notificationType,
                'destinationLink' => $this->getDestinationLink(),
                'locale' => $notifiable->language
            ]);
    }

    public function toDatabase(): array
    {
        return $this->getData();
    }

    private function getData()
    {
        return [
            'message_group' => 'user',
            'message_key' => 'birthday',
            'message_params' => [],
            'entity' => [
                'id' => $this->actorData['id'],
                'username' => $this->actorData['username']
            ],
            'actor' => $this->actorData,
            'metadata' => [
                'is_viewable' => true
            ]
        ];
    }

    protected function getDestinationLink(): string
    {
        return url("/@{$this->actorData['username']}");
    }
}
