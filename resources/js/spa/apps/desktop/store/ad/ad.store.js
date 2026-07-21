import { defineStore } from 'pinia';
import { colibriAPI } from '@/kernel/services/api-client/native/index.js';

const useAdStore = defineStore('ad', {
    state: function() {
        return {
            sidebarAd: null,
            feedAd: null
        };
    },
    actions: {
        fetchSidebarAd: async function() {
            await colibriAPI().ads().params({
				prev_ad_id: this.sidebarAd ? this.sidebarAd.id : null,
                type: 'sidebar'
			}).getFrom('ad').then((response) => {
                this.sidebarAd = response.data.data;
            }).catch((error) => {
                if(error.response) {
					this.sidebarAd = null;
                }
            });
        },
        fetchFeedAd: async function() {
            await colibriAPI().ads().params({
				prev_ad_id: this.feedAd ? this.feedAd.id : null,
                type: 'feed'
			}).getFrom('ad').then((response) => {
                this.feedAd = response.data.data;
            }).catch((error) => {
                if(error.response) {
					this.feedAd = null;
                }
            });
        }
    }
});

export { useAdStore };