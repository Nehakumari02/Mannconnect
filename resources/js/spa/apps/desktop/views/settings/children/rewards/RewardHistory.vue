<template>
    <div class="col-span-12 xl:col-span-8">
        <PageTitle v-bind:titleLabel="$t('rewards.history_title')" v-bind:descriptionLabel="$t('rewards.history_description')"></PageTitle>

        <div class="bg-fill-pr border border-bord-pr rounded-2xl">
            <div class="border-b border-bord-pr px-6 py-4 flex items-center justify-between">
                <h3 class="text-par-l font-bold text-lab-pr">
                    {{ $t('rewards.history_title') }}
                </h3>
            </div>

            <div class="p-6">
                <div v-if="isLoading" class="text-center py-10">
                    Loading...
                </div>

                <div v-else-if="logs.length > 0">
                    <div v-for="(log, index) in logs" v-bind:key="log.id" class="flex items-center justify-between py-3 border-b border-bord-tr last:border-b-0">
                        <div class="flex items-center gap-3">
                            <div class="w-10 h-10 rounded-full bg-slate-100 flex items-center justify-center text-slate-600">
                                🌟
                            </div>
                            <div>
                                <h4 class="text-par-m font-bold text-lab-pr">{{ log.action_name }}</h4>
                                <p class="text-par-s text-lab-sc">{{ log.created_at }}</p>
                            </div>
                        </div>
                        <div class="text-par-m font-bold text-green-600">
                            +{{ log.points }} pts
                        </div>
                    </div>
                </div>

                <div v-else class="text-center py-10">
                    <div class="text-5xl mb-4">🌟</div>
                    <h4 class="text-par-l font-bold text-lab-pr mb-2">No rewards yet</h4>
                    <p class="text-par-m text-lab-sc">You haven't earned any reward points yet.</p>
                </div>

                <div v-if="hasNextPage" class="mt-6 flex justify-center">
                    <PrimaryTextButton v-bind:buttonText="$t('labels.load_more')" v-on:click="fetchLogs"></PrimaryTextButton>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { defineComponent, ref, onMounted } from 'vue';
    import PageTitle from '@D/components/layout/PageTitle.vue';
    import PrimaryTextButton from '@D/components/inter-ui/buttons/PrimaryTextButton.vue';
    import { colibriAPI } from '@/kernel/services/api-client/native/index.js';

    export default defineComponent({
        components: {
            PageTitle: PageTitle,
            PrimaryTextButton: PrimaryTextButton
        },
        setup() {
            const isLoading = ref(true);
            const isFetchingMore = ref(false);
            const logs = ref([]);
            const page = ref(1);
            const hasNextPage = ref(false);

            const fetchLogs = async () => {
                if (page.value === 1) {
                    isLoading.value = true;
                } else {
                    isFetchingMore.value = true;
                }

                try {
                    const response = await colibriAPI().userSettings().getFrom(`rewards/history?page=${page.value}`);
                    
                    if (page.value === 1) {
                        logs.value = response.data.data;
                    } else {
                        logs.value = [...logs.value, ...response.data.data];
                    }

                    hasNextPage.value = response.data.pagination.has_more_pages;
                    page.value++;
                } catch (error) {
                    console.error(error);
                } finally {
                    isLoading.value = false;
                    isFetchingMore.value = false;
                }
            };

            onMounted(() => {
                fetchLogs();
            });

            return {
                isLoading,
                isFetchingMore,
                logs,
                hasNextPage,
                fetchLogs
            };
        }
    });
</script>
