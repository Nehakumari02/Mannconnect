<template>
    <div class="max-w-full">
        <swiper-container slides-per-view="auto" space-between="16" speed="200" mousewheel="true" grab-cursor="true" class="w-full">
            <swiper-slide class="w-[74px] shrink-0">
                <div v-on:click="createStory" class="w-[74px] cursor-pointer">
                    <div class="size-[74px] relative p-[2px]">
                        <div class="size-full rounded-full overflow-hidden border border-gray-200 bg-white">
                            <img class="size-full inline-block object-cover" v-bind:src="userData.avatar_url" alt="Image">
                        </div>
                        <div class="border-[3px] border-white rounded-full inline-flex-center text-white size-7 bg-brand-500 absolute bottom-0 right-0 z-10 shadow-sm">
                            <SvgIcon name="plus" class="size-4"></SvgIcon>
                        </div>
                    </div>
                    <div class="text-[12px] mt-1 font-medium text-gray-900 text-center whitespace-nowrap overflow-hidden text-ellipsis">
                        {{ $t('labels.new_story') }}
                    </div>
                </div>
            </swiper-slide>
            <template v-if="storiesFeed.length">
                <swiper-slide v-for="storyData in storiesFeed" v-bind:key="storyData.story_uuid" class="w-[74px] shrink-0">
                    <RouterLink v-bind:to="{ name: 'stories_index', params: { story_uuid: storyData.story_uuid } }">
                        <div class="size-[74px] rounded-full p-[3px] transition-transform hover:scale-105" v-bind:class="[(storyData.is_owner || storyData.is_seen) ? 'border border-gray-200' : 'border-2 border-brand-500']">
                            <div v-if="! storyData.is_seen && ! storyData.is_owner" class="absolute inset-0">
                                <img v-bind:src="$asset('assets/avatars/story-avatar-ring.png')" alt="Image" class="opacity-0">
                            </div>
                            <div class="rounded-full size-full overflow-hidden border border-gray-200 bg-white">
                                <img class="size-full inline-block object-cover" v-bind:src="storyData.relations.user.avatar_url" alt="Image">
                            </div>
                        </div>
                        <div class="text-[12px] mt-1 font-medium text-gray-900 text-center whitespace-nowrap overflow-hidden text-ellipsis">
                            {{ storyData.relations.user.name }}
                        </div>
                    </RouterLink>
                </swiper-slide>
            </template>
        </swiper-container>
    </div>
</template>

<script>
    import { computed, defineComponent, onMounted } from 'vue';
    import { useStoriesEditorStore } from '@D/store/stories/editor.store.js';
    import { useStoriesStore } from '@D/store/stories/stories.store.js';
    import { useAuthStore } from '@D/store/auth/auth.store.js';
    import { register  } from 'swiper/element/bundle';

    register();

    import AvatarMedium from '@D/components/general/avatars/AvatarMedium.vue';

    export default defineComponent({
        setup: function() {
            const storiesEditorStore = useStoriesEditorStore();
            const storiesStore = useStoriesStore();
            const authStore = useAuthStore();

            const userData = computed(() => {
                return authStore.userData;
            });

            onMounted(async () => {
                try {
                    await storiesStore.fetchStoriesFeed();
                } catch (error) {
                    /* Pass */
                }
            });

            const storiesFeed = computed(() => {
                return storiesStore.storiesFeed;
            });

            return {
                storiesFeed: storiesFeed,
                userData: userData,
                createStory: () => {
                    storiesEditorStore.openEditor();
                }
            };
        },
        components: {
            AvatarMedium: AvatarMedium
        }
    });
</script>