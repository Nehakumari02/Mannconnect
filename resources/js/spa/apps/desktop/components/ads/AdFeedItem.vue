<template>
    <div v-if="adData" class="bg-input-pr border border-bord-pr rounded-2xl mb-4 p-4">
        <div class="flex items-center justify-between mb-3">
            <span class="text-cap-s font-semibold text-lab-sc uppercase tracking-wider">Sponsored</span>
        </div>
        <a :href="adData.target_url" target="_blank" @click="trackClick" class="block">
            <h3 class="text-par-l font-bold text-lab-pr mb-2">{{ adData.title }}</h3>
            <p class="text-par-s text-lab-sc mb-3">{{ adData.content }}</p>
            <div class="rounded-xl overflow-hidden mb-3">
                <img :src="adData.preview_image_url" class="w-full h-auto object-cover" />
            </div>
            <div class="flex justify-between items-center mt-2">
                <span class="text-cap-s text-brand-900 truncate max-w-[200px]">{{ adData.target_url }}</span>
                <span class="bg-brand-900 text-white px-3 py-1 text-cap-s rounded-full font-medium">{{ adData.cta_text }}</span>
            </div>
        </a>
    </div>
</template>
<script>
export default {
    props: {
        adData: Object
    },
    setup(props) {
        const trackClick = async () => {
            if (props.adData) {
                await fetch('/api/ads/ad/' + props.adData.id + '/click', { method: 'POST' });
            }
        };
        return { trackClick };
    }
}
</script>
