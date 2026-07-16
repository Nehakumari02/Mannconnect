<template>
    <div class="col-span-12 xl:col-span-8">
        <PageTitle v-bind:titleLabel="$t('referral.dashboard_title')" v-bind:descriptionLabel="$t('referral.dashboard_description')"></PageTitle>

        <div v-if="isLoading" class="text-center py-10">
            Loading...
        </div>

        <div v-else class="space-y-6">
            <div class="bg-fill-pr border border-bord-pr rounded-2xl">
                <div class="border-b border-bord-pr px-6 py-4 flex items-center justify-between">
                    <h3 class="text-par-l font-bold text-lab-pr">
                        {{ $t('referral.your_link_title') }}
                    </h3>
                </div>

                <div class="p-6">
                    <div class="flex items-center gap-3">
                        <input
                            type="text"
                            readonly
                            v-bind:value="referralLink"
                            class="flex-1 bg-fill-fv border border-bord-tr rounded-xl px-4 py-3 text-par-m text-lab-pr"
                        />
                        <PrimaryTextButton
                            v-bind:buttonText="copyButtonLabel"
                            v-on:click="copyLink"
                        ></PrimaryTextButton>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div class="bg-fill-pr border border-bord-pr rounded-2xl p-6 text-center">
                    <div class="text-3xl font-bold text-lab-pr mb-1">{{ totalReferrals }}</div>
                    <div class="text-par-s text-lab-sc">{{ $t('referral.total_referrals_label') }}</div>
                </div>

                <div class="bg-fill-pr border border-bord-pr rounded-2xl p-6 text-center">
                    <div class="text-3xl font-bold text-green-600 mb-1">+{{ totalPoints }}</div>
                    <div class="text-par-s text-lab-sc">{{ $t('referral.total_points_label') }}</div>
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
            const referralCode = ref('');
            const referralLink = ref('');
            const totalPoints = ref(0);
            const totalReferrals = ref(0);
            const copyButtonLabel = ref('Copy Link');

            const fetchReferralData = async () => {
                isLoading.value = true;

                try {
                    const response = await colibriAPI().userSettings().getFrom('referral/data');

                    referralCode.value = response.data.referral_code;
                    referralLink.value = response.data.referral_link;
                    totalPoints.value = response.data.total_points;
                    totalReferrals.value = response.data.total_referrals;
                } catch (error) {
                    console.error(error);
                } finally {
                    isLoading.value = false;
                }
            };

            const copyLink = () => {
                navigator.clipboard.writeText(referralLink.value);

                copyButtonLabel.value = 'Copied!';

                setTimeout(() => {
                    copyButtonLabel.value = 'Copy Link';
                }, 2000);
            };

            onMounted(() => {
                fetchReferralData();
            });

            return {
                isLoading,
                referralCode,
                referralLink,
                totalPoints,
                totalReferrals,
                copyButtonLabel,
                copyLink
            };
        }
    });
</script>