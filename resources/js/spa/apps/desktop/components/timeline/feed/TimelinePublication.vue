<template>
    <div class="relative border-b border-gray-200 bg-white mb-6 pb-4 sm:max-w-[470px] sm:mx-auto">
        <!-- Header: Avatar, Username, Options -->
        <div class="flex items-center justify-between px-0 py-3">
            <div class="flex items-center">
                <AvatarSmall v-bind:avatarSrc="postData.relations.user.avatar_url" class="!w-8 !h-8"></AvatarSmall>
                <div class="ml-3 flex-1 overflow-hidden flex flex-col justify-center">
                    <RouterLink v-bind:to="{ name: 'profile_index', params: { id: postData.relations.user.username } }" class="flex items-center gap-1 leading-none">
                        <span class="font-bold text-[14px] text-lab-pr2 truncate">
                            {{ postData.relations.user.name }}
                        </span>
                        <VerificationBadge v-if="postData.relations.user.verified"></VerificationBadge>
                        <span class="text-lab-sc text-[14px] ml-1">· {{ postData.date.time_ago }}</span>
                    </RouterLink>
                </div>
            </div>
            
            <div class="relative">
                <div class="opacity-100 cursor-pointer">
                    <DropdownButton v-on:click.stop="toggleMenu"></DropdownButton>
                </div>
                <div class="absolute top-full right-0 z-50" v-if="state.isMenuOpen">
                    <DropdownMenu v-outside-click="toggleMenu" v-on:click="toggleMenu">
                        <DropdownMenuItem v-on:click="openReactionsPicker" iconName="heart-rounded" v-bind:textLabel="$t('dd.add_reaction')"></DropdownMenuItem>
                        <template v-if="postHasContent && isTranslatable">
                            <DropdownMenuItem v-if="state.isTranslated" v-on:click="cancelTranslation" iconName="translate-01" v-bind:textLabel="$t('labels.show_untranslated')"></DropdownMenuItem>
                            <DropdownMenuItem v-else v-on:click="translate" iconName="translate-01" v-bind:textLabel="$t('dd.translate')"></DropdownMenuItem>
                        </template>
                        <Border/>
                        <template v-if="! isOnPostPage">
                            <RouterLink v-bind:to="{ name: 'publication_index', params: { hash_id: postData.hash_id }}">
                                <DropdownMenuItem iconName="arrow-up-right" v-bind:textLabel="$t('dd.post.open_post')"></DropdownMenuItem>
                            </RouterLink>
                        </template>
                        <DropdownMenuItem v-on:click="quotePost" iconName="pencil-line" v-bind:textLabel="$t('dd.post.quote_post')"></DropdownMenuItem>
                        <DropdownMenuItem v-on:click="mentionAuthor" iconName="at-sign" v-bind:textLabel="$t('dd.post.mention_author', { name: `@${postData.relations.user.name}`})"></DropdownMenuItem>
                        <Border/>
                        <DropdownMenuItem v-on:click="bookmarkPost" v-bind:iconName="postData.meta.activity.bookmarked ? 'bookmark-minus' : 'bookmark'" v-bind:textLabel="postData.meta.activity.bookmarked ? $t('dd.post.unbookmark') : $t('dd.post.bookmark')"></DropdownMenuItem>
                        <DropdownMenuItem v-on:click="sharePost" iconName="share-06" v-bind:textLabel="$t('dd.post.share')"></DropdownMenuItem>
                        <DropdownMenuItem v-on:click="copyLink" iconName="copy-06" v-bind:textLabel="$t('dd.post.copy_link')"></DropdownMenuItem>
                        <DropdownMenuItem v-if="postHasContent" v-on:click="copyContent" iconName="type-01" v-bind:textLabel="$t('dd.copy_text')"></DropdownMenuItem>
                        <Border/>
                        <DropdownMenuItem v-if="canReportPost" v-on:click="reportPost" itemColor="text-red-900" iconName="annotation-alert" v-bind:textLabel="$t('dd.post.report_post')"></DropdownMenuItem>
                        <template v-if="canDeletePost">
                            <DropdownMenuItem v-on:click="$emit('delete', postData)" itemColor="text-red-900" iconName="trash-04" v-bind:textLabel="$t('dd.post.delete_post')"></DropdownMenuItem>
                        </template>
                    </DropdownMenu>
                </div>
            </div>
        </div>

        <!-- Media Area -->
        <div class="w-full sm:rounded-lg overflow-hidden mb-2 relative bg-black/5" v-if="postHasMedia">
            <template v-if="PostTypeUtils.isImage(postData.type)">
                <div v-on:click="lightboxImages" class="block cursor-pointer">
                    <PublicationImage v-bind:key="postData.hash_id" v-bind:isSensitive="isSensitive" v-bind:postMedia="postMedia"></PublicationImage>
                </div>
            </template>
            <template v-if="PostTypeUtils.isGif(postData.type)">
                <PublicationGif v-on:click="lightboxImages" v-bind:postMedia="postMedia"></PublicationGif>
            </template>
            <template v-else-if="PostTypeUtils.isVideo(postData.type)">
                <PublicationVideo v-bind:postMedia="postMedia" v-bind:key="postData.id"></PublicationVideo>
            </template>
            <template v-else-if="PostTypeUtils.isDocument(postData.type)">
                <PublicationDocument v-bind:postMedia="postMedia" class="px-4 pb-2"></PublicationDocument>
            </template>
            <template v-else-if="PostTypeUtils.isAudio(postData.type)">
                <PublicationAudio v-bind:postMedia="postMedia" v-bind:label="postData.relations.user.name" v-bind:key="postData.id" class="px-4 pb-2"></PublicationAudio>
            </template>
        </div>
        <div class="overflow-hidden mb-4" v-else-if="postHasPoll">
            <PublicationPoll v-bind:postPoll="postPoll"></PublicationPoll>
        </div>
        <div v-else-if="postData.meta.is_quoting" class="overflow-hidden mb-2">
            <PublicationQuote v-if="quotedPost" v-bind:quotedPost="quotedPost" v-bind:key="postData.id"></PublicationQuote>
            <PublicationQuotePlaceholder v-else></PublicationQuotePlaceholder>
        </div>
        <div v-else-if="postLinkSnapshot" class="overflow-hidden mb-2">
            <a v-bind:href="postLinkSnapshot.url" target="_blank">
                <LinkSnapshot v-bind:linkSnapshot="postLinkSnapshot"></LinkSnapshot>
            </a>
        </div>

        <!-- Action Buttons -->
        <div class="flex items-center justify-between py-2 px-0">
            <div class="flex items-center gap-4">
                <div class="relative">
                    <PrimaryIconButton iconSize="icon-normal" v-on:click.stop="openReactionsPicker" iconName="heart-rounded" iconType="line" class="!text-brand-500 hover:opacity-70 transition-opacity"></PrimaryIconButton>
                    <PrimaryTransition v-if="state.isReactionPickerOpen">
                        <div class="absolute left-0 bottom-8 origin-top-left z-20">
                            <ReactionsPicker v-on:add="addReaction" v-outside-click="closeReactionsPicker"></ReactionsPicker>
                        </div>
                    </PrimaryTransition>
                </div>
                
                <RouterLink v-if="!isOnPostPage" v-bind:to="{ name: 'publication_index', params: { hash_id: postData.hash_id }}" class="cursor-pointer">
                    <PrimaryIconButton iconSize="icon-normal" iconName="message-circle-02" iconType="line" class="!text-blue-500 hover:opacity-70 transition-opacity"></PrimaryIconButton>
                </RouterLink>
                <PrimaryIconButton v-else v-bind:disabled="true" iconSize="icon-normal" iconName="message-circle-02" iconType="line" class="!text-blue-500"></PrimaryIconButton>

                <div class="relative">
                    <PrimaryIconButton v-on:click.stop="sharePost" iconSize="icon-normal" iconName="share-06" iconType="line" class="!text-green-500 hover:opacity-70 transition-opacity"></PrimaryIconButton>
                    <PrimaryTransition v-if="state.isSharePostOpen">
                        <div class="absolute left-0 bottom-8 origin-top-left z-20">
                            <PublicationShare v-outside-click="cancelSharePost" v-on:click.stop="cancelSharePost" v-bind:postLink="postLink"></PublicationShare>
                        </div>
                    </PrimaryTransition>
                </div>
            </div>
            <div class="shrink-0">
                <PrimaryIconButton v-on:click="bookmarkPost" v-bind:iconName="postData.meta.activity.bookmarked ? 'bookmark-minus' : 'bookmark'" v-bind:iconType="postData.meta.activity.bookmarked ? 'solid' : 'line'" class="!text-yellow-500 hover:opacity-70 transition-opacity" iconSize="icon-normal"></PrimaryIconButton>
            </div>
        </div>

        <!-- Reactions Info -->
        <div class="block mb-1 px-0 font-bold text-[14px] text-lab-pr" v-if="postReactions.length">
            {{ postData.relations.reactions.length }} likes
        </div>

        <!-- Caption -->
        <div class="px-0 pt-1 text-[14px] leading-snug break-words text-lab-pr">
            <template v-if="postHasContent">
                <span class="font-bold mr-1">{{ postData.relations.user.name }}</span><PublicationText v-bind:postContent="postContent" class="inline"></PublicationText>
                
                <div v-if="state.isTranslated" class="mt-2 block w-full">
                    <TranslationService></TranslationService>
                </div>
            </template>
        </div>

        <!-- Comments Link -->
        <div class="px-0 mt-1" v-if="!isOnPostPage && postData.relations.comments.length">
            <RouterLink v-bind:to="{ name: 'publication_index', params: { hash_id: postData.hash_id }}" class="text-[14px] text-lab-sc hover:text-lab-pr2 transition-colors">
                View all {{ postData.comments_count.formatted }} comments
            </RouterLink>
        </div>
    </div>
</template>

<script>
    import { defineComponent, defineAsyncComponent, reactive, computed, ref } from 'vue';
    import { useRoute } from 'vue-router';
    import { PostTypeUtils } from '@/kernel/enums/post/post.type.js';
    import { colibriEventBus } from '@/kernel/events/bus/index.js';
    import { colibriAPI } from '@/kernel/services/api-client/native/index.js';
    import { useLightboxStore } from '@D/store/lightbox/lightbox.store.js';
    import { colibriTranslator } from '@/kernel/services/translator/index.js';

    import AvatarSmall from '@D/components/general/avatars/AvatarSmall.vue';
    import DropdownButton from '@D/components/general/dropdowns/parts/DropdownButton.vue';
    import DropdownMenu from '@D/components/general/dropdowns/parts/DropdownMenu.vue';
    import DropdownMenuItem from '@D/components/general/dropdowns/parts/DropdownMenuItem.vue';
    import DropdownReactions from '@D/components/general/dropdowns/parts/DropdownReactions.vue';
    import ViewsCounter from '@/kernel/vue/components/general/counters/ViewsCounter.vue';
    import PrimaryIconButton from '@D/components/inter-ui/buttons/PrimaryIconButton.vue';
    import TextTranslateButton from '@D/components/inter-ui/buttons/TextTranslateButton.vue';
    import TranslationService from '@D/components/general/TranslationService.vue';
    import PublicationQuote from '@D/components/timeline/feed/parts/quote/PublicationQuote.vue';

    export default defineComponent({
        props: {
            isPinned: {
                type: Boolean,
                default: false
            },
            postData: {
                type: Object,
                default: {}
            }
        },
        setup: function(props) {
            const route = useRoute();
            const state = reactive({
                isMenuOpen: false,
                isReactionPickerOpen: false,
                isTranslating: false,
                isTranslated: false,
                isSharePostOpen: false
            });

            const postTranslatedContent = ref('');
            const postData = computed(() => {
                return props.postData;
            });

            const lightboxStore = useLightboxStore();

            const openReactionsPicker = function() {
                debounce(() => {
                    state.isReactionPickerOpen = true;
                }, 50);
            }

            const closeReactionsPicker = function() {
                state.isReactionPickerOpen = false;
            }

            const postContent = computed(() => {
                return state.isTranslated ? postTranslatedContent.value : postData.value.content;
            });

            const postLink = computed(() => {
                return base_url(`publication/${postData.value.hash_id}`);
            });

            return {
                toggleMenu: () => {
                    state.isMenuOpen = !state.isMenuOpen;
                },
                postContent: postContent,
                openReactionsPicker: openReactionsPicker,
                PostTypeUtils: PostTypeUtils,
                closeReactionsPicker: closeReactionsPicker,
                postData: postData,
                state: state,
                isSensitive: computed(() => {
                    return postData.value.meta.is_sensitive;
                }),
                userLocaleName: embedder('locale_name'),
                addReaction: (reactionId) => {
                    closeReactionsPicker();

                    colibriAPI().userTimeline().with({
                        unified_id: reactionId,
                        post_id: postData.value.id
                    }).sendTo('post/reaction/add').then((response) => {
                        postData.value.relations.reactions = response.data.data;
                    }).catch((error) => {
                        if (error.response) {
                            toastError(error.response.data.message);
                        }
                    });
                },
                postHasMedia: computed(() => {
                    return postData.value.relations.media?.length;
                }),
                postHasPoll: computed(() => {
                    return postData.value.relations.poll;
                }),
                postHasContent: computed(() => {
                    return postData.value.content.length;
                }),
                postLinkSnapshot: computed(() => {
                    return postData.value.relations.link_snapshot;
                }),
                quotedPost: computed(() => {
                    return postData.value.relations.quoted_post;
                }),
                isTranslatable: computed(() => {
                    return postData.value.meta.is_translatable;
                }),
                postMedia: computed(() => {
                    return postData.value.relations.media;
                }),
                postPoll: computed(() => {
                    return postData.value.relations.poll;
                }),
				postLink: postLink,
                postReactions: computed(() => {
                    return postData.value.relations.reactions;
                }),
                lightboxImages: () => {
                    lightboxStore.add({
                        albumName: `${postData.value.relations.user.name} ${postData.value.relations.user.caption}`,
                        date: postData.value.date.iso,
                        images: postData.value.relations.media.map((item) => {
                            return item.source_url;
                        })
                    });
                },
                postUserCaption: computed(() => {
                    return postData.value.relations.user.caption;
                }),
                canDeletePost: computed(() => {
                    return postData.value.meta.permissions.can_delete;
                }),
                canReportPost: computed(() => {
                    return postData.value.meta.permissions.can_report;
                }),
                mentionAuthor: () => {
                    colibriEventBus.emit('post-editor:open', {
                        mentionName: postData.value.relations.user.username
                    });
                },
                bookmarkPost: () => {
                    colibriAPI().userTimeline().with({
                        id: postData.value.id
                    }).sendTo('post/bookmarks/add').then((response) => {
                        postData.value.meta.activity.bookmarked = response.data.data.bookmarked;

                        if(response.data.data.bookmarked) {
                            toastSuccess(__t('toast.post.bookmarked'));
                        }
                        else {
                            toastSuccess(__t('toast.post.unbookmarked'));
                        }
                    }).catch((error) => {
                        if (error.response) {
                            toastError(error.response.data.message);
                        }
                    });
                },
                translate: async () => {
                    if (state.isTranslating || state.isTranslated) {
                        return false;
                    }

                    state.isTranslating = true;
                    const translatedText = await colibriTranslator().translate(postContent.value);

                    if (translatedText) {
                        postTranslatedContent.value = translatedText;
                        state.isTranslated = true;
                    }

                    state.isTranslating = false;
                },
                cancelTranslation: () => {
                    state.isTranslated = false;
                    postTranslatedContent.value = '';
                },
                copyContent: () => {
                    navigator.clipboard.writeText(postContent.value).then(() => {
                        toastSuccess(__t('toast.post.content_copied'), 1000);
                    });
                },
                copyLink: () => {
                    navigator.clipboard.writeText(postLink.value).then(() => {
                        toastSuccess(__t('toast.post.link_copied'), 1000);
                    });
                },
                reportPost: () => {
                    colibriEventBus.emit('report:open', {
                        type: 'post',
                        reportableId: postData.value.id
                    });
                },
				quotePost: () => {
					colibriEventBus.emit('post-editor:open', {
						quotePostId: postData.value.id
					});
				},
                sharePost: async () => {
					debounce(() => {
						state.isSharePostOpen = true;
					}, 50);
                },
				cancelSharePost: () => {
					state.isSharePostOpen = false;
				},
                isOnPostPage: computed(() => {
                    return route.name === 'publication_index';
                })
            }
        },
        components: {
            AvatarSmall: AvatarSmall,
            DropdownButton: DropdownButton,
            DropdownMenu: DropdownMenu,
            DropdownMenuItem: DropdownMenuItem,
            DropdownReactions: DropdownReactions,
            PrimaryIconButton: PrimaryIconButton,
            TextTranslateButton: TextTranslateButton,
            PublicationQuote: PublicationQuote,
            ReactionsViewer: defineAsyncComponent(() => {
                return import('@/kernel/vue/components/reactions/ReactionsViewer.vue');
            }),
            ViewsCounter: ViewsCounter,
            TranslationService: TranslationService,
            ReactionsPicker: defineAsyncComponent(() => {
                return import('@D/components/reactions/ReactionsPicker.vue');
            }),
            PublicationImage: defineAsyncComponent(() => {
                return import('@D/components/timeline/feed/parts/media/PublicationImage.vue');
            }),
            PublicationGif: defineAsyncComponent(() => {
                return import('@D/components/timeline/feed/parts/media/PublicationGif.vue');
            }),
            PublicationVideo: defineAsyncComponent(() => {
                return import('@D/components/timeline/feed/parts/media/PublicationVideo.vue');
            }),
            PublicationDocument: defineAsyncComponent(() => {
                return import('@D/components/timeline/feed/parts/media/PublicationDocument.vue');
            }),
            PublicationAudio: defineAsyncComponent(() => {
                return import('@D/components/timeline/feed/parts/media/PublicationAudio.vue');
            }),
            PublicationPoll: defineAsyncComponent(() => {
                return import('@D/components/timeline/feed/parts/poll/PublicationPoll.vue');
            }),
            PublicationText: defineAsyncComponent(() => {
                return import('@D/components/timeline/feed/parts/text/PublicationText.vue');
            }),
            AvatarExtraSmall: defineAsyncComponent(() => {
                return import('@D/components/general/avatars/AvatarExtraSmall.vue');
            }),
			PublicationShare: defineAsyncComponent(() => {
				return import('@D/components/timeline/feed/parts/share/PublicationShare.vue');
			}),
            PublicationQuotePlaceholder: defineAsyncComponent(() => {
                return import('@D/components/timeline/feed/parts/quote/PublicationQuotePlaceholder.vue');
            }),
            LinkSnapshot: defineAsyncComponent(() => {
                return import('@D/components/media/links/LinkSnapshot.vue');
            })
        }
    });
</script>
