import { ref } from 'vue';

export const isGlobalLoading = ref(false);

let requestCount = 0;

export const showGlobalLoader = () => {
    requestCount++;
    isGlobalLoading.value = true;
};

export const hideGlobalLoader = () => {
    if (requestCount > 0) requestCount--;
    if (requestCount === 0) {
        isGlobalLoading.value = false;
    }
};