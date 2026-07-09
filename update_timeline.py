import re

with open('resources/js/spa/apps/desktop/components/timeline/feed/TimelinePublication.vue', 'r') as f:
    content = f.read()

template_start = content.find('<template>')
template_end = content.find('</template>') + len('</template>')

new_template = """<template>
    <div class="relative border-b border-bord-pr bg-bg-pr mb-6 pb-4 sm:max-w-[470px] sm:mx-auto">
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
                    <span v-if="postUserCaption" class="text-[12px] text-lab-sc truncate mt-0.5">{{ postUserCaption }}</span>
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
        <div class="w-full -mx-4 sm:mx-0 sm:rounded-sm overflow-hidden mb-2 relative bg-black/5" v-if="postHasMedia">
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
        <div class="flex items-center justify-between py-1 px-0">
            <div class="flex items-center gap-4">
                <div class="relative">
                    <PrimaryIconButton iconSize="icon-large" v-on:click.stop="openReactionsPicker" iconName="heart-rounded" iconType="line" class="!text-lab-pr hover:opacity-50"></PrimaryIconButton>
                    <PrimaryTransition v-if="state.isReactionPickerOpen">
                        <div class="absolute left-0 bottom-8 origin-top-left z-20">
                            <ReactionsPicker v-on:add="addReaction" v-outside-click="closeReactionsPicker"></ReactionsPicker>
                        </div>
                    </PrimaryTransition>
                </div>
                
                <RouterLink v-if="!isOnPostPage" v-bind:to="{ name: 'publication_index', params: { hash_id: postData.hash_id }}" class="cursor-pointer">
                    <PrimaryIconButton iconSize="icon-large" iconName="message-circle-02" iconType="line" class="!text-lab-pr hover:opacity-50"></PrimaryIconButton>
                </RouterLink>
                <PrimaryIconButton v-else v-bind:disabled="true" iconSize="icon-large" iconName="message-circle-02" iconType="line" class="!text-lab-pr"></PrimaryIconButton>

                <div class="relative">
                    <PrimaryIconButton v-on:click.stop="sharePost" iconSize="icon-large" iconName="share-06" iconType="line" class="!text-lab-pr hover:opacity-50"></PrimaryIconButton>
                    <PrimaryTransition v-if="state.isSharePostOpen">
                        <div class="absolute left-0 bottom-8 origin-top-left z-20">
                            <PublicationShare v-outside-click="cancelSharePost" v-on:click.stop="cancelSharePost" v-bind:postLink="postLink"></PublicationShare>
                        </div>
                    </PrimaryTransition>
                </div>
            </div>
            <div class="shrink-0">
                <PrimaryIconButton v-on:click="bookmarkPost" v-bind:iconName="postData.meta.activity.bookmarked ? 'bookmark-minus' : 'bookmark'" v-bind:iconType="postData.meta.activity.bookmarked ? 'solid' : 'line'" class="!text-lab-pr hover:opacity-50" iconSize="icon-large"></PrimaryIconButton>
            </div>
        </div>

        <!-- Reactions Info -->
        <div class="block mb-2 px-0" v-if="postReactions.length">
            <ReactionsViewer v-on:add="addReaction" v-bind:reactions="postReactions"></ReactionsViewer>
        </div>

        <!-- Caption -->
        <div class="px-0 pt-1 text-[14px] leading-snug">
            <template v-if="postHasContent">
                <span class="font-bold mr-1">{{ postData.relations.user.name }}</span>
                <PublicationText v-bind:postContent="postContent" class="inline"></PublicationText>
                
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
</template>"""

content = content[:template_start] + new_template + content[template_end:]

with open('resources/js/spa/apps/desktop/components/timeline/feed/TimelinePublication.vue', 'w') as f:
    f.write(content)
print("Updated TimelinePublication.vue")
