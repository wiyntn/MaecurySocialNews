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

import '@/kernel/helpers/embeds/index.js';
import '@/kernel/websockets/index.js';
import '@D/core/global/global.js';

// 1. Loader Store ကို Import လုပ်ပါ
import { useLoaderStore } from '@/stores/loader.store.js'; 

window.HIDE_AUTHOR_ATTRIBUTION = import.meta.env.VITE_HIDE_AUTHOR_ATTRIBUTION;

axios.defaults.withCredentials = true;
axios.defaults.withXSRFToken = true;

window.axios = axios;

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

// --- Global Axios Loader Interceptors ---

// Request ပို့လိုက်လျှင် Loader စတင်ဖွင့်မည်
window.axios.interceptors.request.use(
    (config) => {
        try {
            const loaderStore = useLoaderStore();
            loaderStore.showLoader();
        } catch (e) {
            // Pinia မဆောက်ရသေးမီ API ခေါ်ပါက Error မတက်အောင် catch ထားခြင်း
        }
        return config;
    },
    (error) => {
        try {
            const loaderStore = useLoaderStore();
            loaderStore.hideLoader();
        } catch (e) {}
        return Promise.reject(error);
    }
);

// Response ပြန်ရောက်လျှင် (သို့မဟုတ် Error တက်လျှင်) Loader ပြန်ပိတ်မည်
window.axios.interceptors.response.use(
    (response) => {
        try {
            const loaderStore = useLoaderStore();
            loaderStore.hideLoader();
        } catch (e) {}
        return response;
    },
    (error) => {
        try {
            const loaderStore = useLoaderStore();
            loaderStore.hideLoader();
        } catch (e) {}
        return Promise.reject(error);
    }
);