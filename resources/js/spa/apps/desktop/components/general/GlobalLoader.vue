<template>
    <!-- isLoading = true ဖြစ်ချိန်မှာ Screen တစ်ခုလုံးကို Fullscreen ဖုံးထားမည် -->
    <div 
        v-if="loaderStore.isLoading" 
        class="fixed inset-0 z-[9999] flex items-center justify-center bg-black/50 backdrop-blur-sm"
    >
        <PrimarySpinAnimation />
    </div>
    
</template>

<script setup>

import { useLoaderStore } from '@/stores/loader.store.js';
import PrimarySpinAnimation from '@D/components/general/animations/PrimarySpinAnimation.vue';

const loaderStore = useLoaderStore();
</script>