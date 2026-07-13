<template>
    <div class="fixed top-0 left-0 right-0 h-16 bg-bg-pr/70 backdrop-blur-md border-b border-bord-pr/50 z-50 flex items-center justify-between px-6 transition-all duration-300">
        <!-- Logo -->
        <div class="flex-shrink-0">
            <RouterLink v-bind:to="{ name: 'home_index' }" class="font-serif italic text-2xl font-bold tracking-wide bg-gradient-to-r from-[#833ab4] via-[#fd1d1d] to-[#fcb045] text-transparent bg-clip-text">
                MannConnect
            </RouterLink>
        </div>

        <!-- Navigation Icons -->
        <div class="flex items-center gap-8">
            <RouterLink v-bind:to="{ name: 'home_index' }" v-slot="{ isActive }" class="block">
                <span class="block w-7 h-7 shrink-0 text-lab-pr" :class="isActive ? 'text-primary' : ''">
                    <SvgIcon name="home-smile" v-bind:type="(isActive == true) ? 'solid' : 'line'"></SvgIcon>
                </span>
            </RouterLink>

            <RouterLink v-bind:to="{ name: 'explore_posts' }" v-slot="{ isActive }" class="block">
                <span class="block w-7 h-7 shrink-0 text-lab-pr" :class="isActive ? 'text-primary' : ''">
                    <SvgIcon name="hash-02"></SvgIcon>
                </span>
            </RouterLink>

            <div v-on:click="openNotificationsModal" class="relative cursor-pointer">
                <span class="block w-7 h-7 shrink-0 text-lab-pr">
                    <SvgIcon name="bell-01" type="line"></SvgIcon>
                </span>
                <div class="absolute -top-1 -right-2">
                    <BadgeCounter v-if="notificationsCount.raw" v-bind:count="notificationsCount.formatted"></BadgeCounter>
                </div>
            </div>

            <RouterLink v-bind:to="{ name: 'messenger_index' }" v-slot="{ isActive }" class="block relative">
                <span class="block w-7 h-7 shrink-0 text-lab-pr" :class="isActive ? 'text-primary' : ''">
                    <SvgIcon name="message-chat-circle" v-bind:type="(isActive == true) ? 'solid' : 'line'"></SvgIcon>
                </span>
                <div class="absolute -top-1 -right-2">
                    <BadgeCounter v-if="inboxCount.raw" v-bind:count="inboxCount.formatted"></BadgeCounter>
                </div>
            </RouterLink>

            <RouterLink v-if="$config('features.marketplace.enabled')" v-bind:to="{ name: 'marketplace_index' }" v-slot="{ isActive }" class="block">
                <span class="block w-7 h-7 shrink-0 text-lab-pr" :class="isActive ? 'text-primary' : ''">
                    <SvgIcon name="shopping-bag-03" v-bind:type="(isActive == true) ? 'solid' : 'line'"></SvgIcon>
                </span>
            </RouterLink>

            <RouterLink v-if="$config('features.jobs.enabled')" v-bind:to="{ name: 'jobs_index' }" v-slot="{ isActive }" class="block">
                <span class="block w-7 h-7 shrink-0 text-lab-pr" :class="isActive ? 'text-primary' : ''">
                    <SvgIcon name="briefcase-01" v-bind:type="(isActive == true) ? 'solid' : 'line'"></SvgIcon>
                </span>
            </RouterLink>
        </div>

        <!-- Profile & Dropdown -->
        <div class="flex items-center gap-4">
            <RouterLink v-bind:to="{ name: 'profile_index', params: { id: userData.username } }" v-slot="{ isActive }" class="block">
                <div class="w-8 h-8 rounded-full overflow-hidden border border-bord-pr">
                    <img :src="userData.avatar.url" alt="Profile" class="w-full h-full object-cover" v-if="userData.avatar"/>
                    <span v-else class="size-icon-normal shrink-0 text-lab-pr">
                        <SvgIcon name="user-01" type="line"></SvgIcon>
                    </span>
                </div>
            </RouterLink>

            <NavbarDropdown></NavbarDropdown>
        </div>
    </div>
</template>

<script>
    import { defineComponent, computed, defineAsyncComponent, onMounted, onUnmounted } from 'vue';
    import { useAuthStore } from '@D/store/auth/auth.store.js';
    import { useNotificationsStore } from '@D/store/notifications/notifications.store.js';
    import { useInboxStore } from '@D/store/chats/inbox.store.js';
    import { colibriSounds } from '@/kernel/services/sounds/index.js';
    import { colibriEventBus } from '@/kernel/events/bus/index.js';

    import BadgeCounter from '@D/components/general/counters/BadgeCounter.vue';
    import BRD from '@/kernel/websockets/brd/index.js';

    export default defineComponent({
        setup: function() {
            const authStore = useAuthStore();
            const notificationsStore = useNotificationsStore();
            const inboxStore = useInboxStore();
            const notificationsCount = computed(() => {
                return notificationsStore.unreadCount;
            });

            const inboxCount = computed(() => {
                return inboxStore.unreadCount;
            });

            onMounted(() => {
                notificationsStore.fetchUnreadCount();
                inboxStore.fetchUnreadCount();

                if(window.ColibriBRD) {
                    ColibriBRD.private(BRD.getChannel('AUTH_USER', [authStore.userData.id])).notification(function (event) {
                        if(event.type === 'chat.notification') {
                            inboxStore.fetchUnreadCount();
                        }
                        else {
                            notificationsStore.setUnreadNotificationsCount(event.data);
                            colibriEventBus.emit('notifications:received');
                        }

                        if(localStorage.getItem('notificationsSound')) {
                            if(event.type === 'chat.notification') {
                                colibriSounds.backgroundChatMessageReceived();
                            }
                            else {
                                colibriSounds.notificationReceived();
                            }
                        }
                    });
                }
            });

            onUnmounted(() => {
                if(window.ColibriBRD) {
                    ColibriBRD.leave(BRD.getChannel('AUTH_USER', [authStore.userData.id]));
                }
            });

            return {
                notificationsCount: notificationsCount,
                inboxCount: inboxCount,
                userData: authStore.userData,
                openNotificationsModal: () => {
                    notificationsStore.openNotifications();
                }
            };
        },
        components: {
            NavbarDropdown: defineAsyncComponent(() => {
                return import('@D/components/layout/parts/navbar/NavbarDropdown.vue');
            }),
            BadgeCounter: BadgeCounter
        }
    });
</script>
