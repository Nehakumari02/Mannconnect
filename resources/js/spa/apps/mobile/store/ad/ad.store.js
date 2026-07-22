import { defineStore } from 'pinia';
import { colibriAPI } from '@/kernel/services/api-client/native/index.js';

const useAdStore = defineStore('mobile_ad_store', {
    actions: {
        fetchAd: async function(type = 'sidebar') {
            return await colibriAPI().ads().params({
				prev_ad_id: this.ad ? this.ad.id : null,
                type: type
			}).getFrom('ad').then((response) => {
                return response.data.data;
            }).catch((error) => {
                return null;
            });
        }
    }
});

export { useAdStore };