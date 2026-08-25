<template>
    <SoundbarPlayer v-if="showSoundbar"></SoundbarPlayer>
</template>

<script>
    import { defineComponent, computed } from 'vue';
    import { useAudioStore } from '@D/store/audio/audio.store.js';
    import { useUIStore } from '@D/store/global/ui.store.js';
    import SoundbarPlayer from '@D/components/soundbar/SoundbarPlayer.vue';

    export default defineComponent({
        setup: function(props) {
            const audioStore = useAudioStore();
            const uiStore = useUIStore();

            return {
                showSoundbar: computed(() => {
                    // cheatSheet panel ပွင့်နေပါက soundbar ကို ပိတ်မည်
                    if (uiStore?.cheatSheet?.isOpen) {
                        return false;
                    }

                    // audioStore သို့မဟုတ် postAudioData မရှိသေးပါက false ကို Safe Return ပြန်မည်
                    return (audioStore?.postAudioData ?? null) !== null;
                })
            };
        },
        components: {
            SoundbarPlayer: SoundbarPlayer
        }
    });
</script>