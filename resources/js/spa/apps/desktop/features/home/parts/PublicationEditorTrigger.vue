<template>
    <div class="cursor-pointer mx-4 mt-4 mb-2 p-3 rounded-full border border-gray-200 bg-gray-50 hover:bg-gray-100 transition-colors flex items-center gap-3 shadow-sm" v-on:click="openPostEditorModal">
        <div class="bg-brand-500 rounded-full p-2 flex items-center justify-center">
            <SvgIcon name="pencil-line" type="line" classes="size-5 text-white"></SvgIcon>
        </div>
        <span class="text-par-l font-medium text-gray-500">
            {{ $t('editor.post_text_input_placeholder') }}
        </span>
    </div>
</template>

<script>
    import { defineComponent } from 'vue';

    import { colibriEventBus } from '@/kernel/events/bus/index.js';

    export default defineComponent({
        setup: function() {
            return {
                openPostEditorModal: () => {
                    colibriEventBus.emit('post-editor:open');
                }
            };
        }
    });
</script>