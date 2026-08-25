/*
|------------------------------------------------------------------
| Desktop Bootstrap Initialization
|------------------------------------------------------------------
| This file is part of the pre initialization of the VueJS application.
| It prepares the framework before the actual application starts.
|
| @Author: (Mansur Terla)
*/

import '@/kernel/helpers/helpers.js';
import '@/kernel/helpers/javascript/index.js';

import axios from 'axios';
import { getActivePinia } from 'pinia';

import '@/kernel/helpers/embeds/index.js';
import '@/kernel/websockets/index.js';
import '@D/core/global/global.js';

// Loader Store
import { useLoaderStore } from '@/stores/loader.store.js'; 

window.HIDE_AUTHOR_ATTRIBUTION = import.meta.env.VITE_HIDE_AUTHOR_ATTRIBUTION;

axios.defaults.withCredentials = true;
axios.defaults.withXSRFToken = true;

window.axios = axios;

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

// Safe Store Helper Function (Pinia နိုးမနိုး စစ်ဆေးပေးသည့် Function)
const getSafeLoaderStore = () => {
    if (getActivePinia()) {
        return useLoaderStore();
    }
    return null;
};

// --- Global Axios Loader Interceptors ---

// 1. Request Interceptor (API Request စထွက်ချိန် Loader ပြမည်)
window.axios.interceptors.request.use(
    (config) => {
        try {
            const loaderStore = getSafeLoaderStore();
            if (loaderStore) {
                loaderStore.showLoader();
            }
        } catch (e) {
            console.warn('Loader Store is not ready yet:', e);
        }
        return config;
    },
    (error) => {
        try {
            const loaderStore = getSafeLoaderStore();
            if (loaderStore) {
                loaderStore.hideLoader();
            }
        } catch (e) {}
        return Promise.reject(error);
    }
);

// 2. Response Interceptor (API Response ပြန်ကျချိန် Loader ပိတ်မည်)
window.axios.interceptors.response.use(
    (response) => {
        try {
            const loaderStore = getSafeLoaderStore();
            if (loaderStore) {
                loaderStore.hideLoader();
            }
        } catch (e) {}
        return response;
    },
    (error) => {
        try {
            const loaderStore = getSafeLoaderStore();
            if (loaderStore) {
                loaderStore.hideLoader();
            }
        } catch (e) {}
        return Promise.reject(error);
    }
);