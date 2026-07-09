<template>
	<div v-if="followRecommendations.length" class="mb-4 bg-white rounded-lg p-5 border border-gray-200">
		<template v-if="state.isLoading">
			<div class="flex justify-center py-8">
				<PrimarySpinAnimation></PrimarySpinAnimation>
			</div>
		</template>
		<template v-else>
			<div class="mb-4">
				<h5 class="text-gray-900 font-bold text-par-l">
					{{ $t('labels.follow_recommendations') }}
				</h5>
			</div>
			<div class="block">
				<FollowListItem v-for="userData in followRecommendations" v-bind:key="userData.id" v-bind:userData="userData" class="mb-2"></FollowListItem>
			</div>
			<div class="mt-4 text-left">
				<RouterLink v-bind:to="{ name: 'explore_people' }" class="text-cap-l font-medium text-brand-500 hover:text-brand-600 dark:text-brand-400 dark:hover:text-brand-300 transition-colors">
					{{ $t('labels.more_suggestions') }}
				</RouterLink>
			</div>
		</template>
	</div>
</template>

<script>
	import { defineComponent, reactive, onMounted, computed, onBeforeUnmount } from 'vue';
	import { useRecommendStore } from '@D/store/recommend/recommend.store.js';

	import FollowListItem from '@D/components/recommend/follow/list/FollowListItem.vue';

	export default defineComponent({
		setup: function(props, context) {
			const recommendStore = useRecommendStore();

			const state = reactive({
				isLoading: false
			});

			const followRecommendations = computed(() => {
				return recommendStore.followRecommendations;
			});

            var updateInterval = null;
            var updateAttempts = 0;

            const updateFollowRecommendations = async function() {
                state.isLoading = true;

                await recommendStore.fetchFollowRecommendations();

                updateAttempts++;

                if(updateAttempts > 10) {
                    clearInterval(updateInterval);
                }

                state.isLoading = false;
            }

			onMounted(async () => {
                if(! followRecommendations.value.length) {
                    await updateFollowRecommendations();
                }

                // Update follow recommendations every 20 minutes.
                updateInterval = setInterval(updateFollowRecommendations, (1000 * 60 * 20));
			});

			onBeforeUnmount(() => {
				if(updateInterval) {
					clearInterval(updateInterval);
				}
			});

			return {
				state: state,
				followRecommendations: followRecommendations,
			};
		},
		components: {
			FollowListItem: FollowListItem
		}
	});
</script>
