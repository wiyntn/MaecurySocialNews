<template>
    <!-- 1. Global Loader ကို ဒီနေရာတွင် ထည့်ပေးပါ -->
    <!-- <GlobalLoader /> -->

    <RouterView></RouterView>
</template>

<script>
    import { defineComponent, computed, ref } from 'vue';
    // import GlobalLoader from '@/apps/desktop/components/general/GlobalLoader.vue'; // Loader Import လုပ်ပါ

    export default defineComponent({
        props: {
        },
        setup: function(props) {
            return {
            };
        },
        // components: {
        //     GlobalLoader: GlobalLoader // Component Register လုပ်ပါ
        // }
    });
</script>