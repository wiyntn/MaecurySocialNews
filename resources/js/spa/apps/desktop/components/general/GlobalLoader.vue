<template>
    <div
        v-if="isGlobalLoading"
        class="fixed inset-0 z-[9999] flex items-center justify-center bg-black/50 backdrop-blur-sm"
    >
        <div class="size-8 inline-block">
            <svg
                class="animate-spin size-full"
                viewBox="0 0 32 32"
            >
                <circle
                    cx="16"
                    cy="16"
                    r="14"
                    fill="none"
                    stroke-width="2"
                    class="stroke-white"
                    style="opacity: 0.2"
                />
                <circle
                    cx="16"
                    cy="16"
                    r="14"
                    fill="none"
                    stroke-width="2"
                    class="stroke-white"
                    style="stroke-dasharray: 80; stroke-dashoffset: 60"
                />
            </svg>
        </div>
    </div>
</template>

<script setup>
import { isGlobalLoading } from '@/kernel/helpers/loaderState.js';
</script>