<template>
    <!-- isLoading true ဖြစ်မှ overlay ပွင့်မည် -->
    <div 
        v-if="isLoading" 
        class="fixed inset-0 z-[9999] flex items-center justify-center bg-black/50 backdrop-blur-sm pointer-events-auto"
    >
        <PrimarySpinAnimation />
    </div>
</template>

<script setup>
import { computed } from 'vue';
import { getActivePinia } from 'pinia';
import { useLoaderStore } from '@/stores/loader.store.js';
import PrimarySpinAnimation from '@D/components/general/animations/PrimarySpinAnimation.vue';

// Safe Loader Status Computed (Pinia နိုးမှသာ Store ကို ခေါ်မည်)
const isLoading = computed(() => {
    try {
        if (getActivePinia()) {
            const loaderStore = useLoaderStore();
            return loaderStore.isLoading;
        }
    } catch (e) {
        // Pinia မဆောက်ရသေးပါက error မတက်စေရန် false ပြန်မည်
    }
    return false;
});
</script>