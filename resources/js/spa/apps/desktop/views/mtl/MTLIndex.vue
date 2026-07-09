<template>
    <div class="fixed inset-0 bg-bg-sc overflow-y-auto">
        <RouterLink v-bind:to="{ name: 'home_index' }" class="fixed top-6 right-8 z-50">
            <button class="size-8 text-lab-sc hover:text-lab-pr">
                <SvgIcon name="x"></SvgIcon>
            </button>
        </RouterLink>

        <div class="w-content ml-12 md:ml-navbar py-top-offset text-lab-pr">
            <div class="mb-6">
                <div class="mb-4">
                    <h1 class="text-[72px] font-extrabold leading-none mb-2">Welcome!</h1>
                    <h3 class="text-par-l font-bold">Welcome to MannConnect.</h3>
                </div>
            </div>
    
            <div class="mb-6">
                <h3 class="text-par-l font-bold mb-3">About MannConnect</h3>
                <p class="text-par-m text-lab-pr2 mb-2">
                    MannConnect is a modern social networking platform designed to connect people and businesses.
                </p>
                <p class="text-par-m text-lab-pr2 mb-4 font-bold">
                    Key Features:
                </p>
                <div class="text-par-s">
                    <div class="mb-4 border-y border-lab-pr2 py-4">
                        <b>1. Enhanced Architecture:</b>
                        <div>
                            Designed for better performance and easier customization.
                        </div>
                    </div>
                    <div class="mb-4 border-b border-lab-pr2 pb-4">
                        <b>2. Community Focused:</b>
                        <div>
                            Empowering developers and businesses to create cutting-edge social networks.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { defineComponent, onMounted } from 'vue';

    import { useRouter } from 'vue-router';

    export default defineComponent({
        setup: function(props) {
            onMounted(() => {
                if(window.HIDE_AUTHOR_ATTRIBUTION) {
                    useRouter().push({
                        name: 'home_index'
                    });
                }
            });
        }
    });
</script>