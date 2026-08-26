<template>
    <div
        v-if="isGlobalLoading"
        class="fixed inset-0 z-[9999] flex items-center justify-center bg-black/50 backdrop-blur-sm pointer-events-auto"
    >
        <div class="text-white">Loading...</div>
    </div>
</template>

<script setup>
import { isGlobalLoading } from '@/kernel/helpers/loaderState.js';
</script>