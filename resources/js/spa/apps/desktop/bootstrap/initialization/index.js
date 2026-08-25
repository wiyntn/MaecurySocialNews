import '@/kernel/helpers/helpers.js';
import '@/kernel/helpers/javascript/index.js';

import axios from 'axios';
import { showGlobalLoader, hideGlobalLoader } from '@/kernel/helpers/loaderState.js';

import '@/kernel/helpers/embeds/index.js';
import '@/kernel/websockets/index.js';
import '@D/core/global/global.js';

window.HIDE_AUTHOR_ATTRIBUTION = import.meta.env.VITE_HIDE_AUTHOR_ATTRIBUTION;

// 1. Axios Defaults များကို သတ်မှတ်ပါ
axios.defaults.withCredentials = true;
axios.defaults.withXSRFToken = true;
axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

// 2. window.axios ကို အရင်ဆုံး Bind လုပ်ပါ (အလွန်အရေးကြီးသည်)
window.axios = axios;

// 3. window.axios ရှိမရှိ သေချာအောင် စစ်ပြီးမှ Interceptor တပ်ဆင်ပါ
if (window.axios && window.axios.interceptors) {
    
    // Request Interceptor
    window.axios.interceptors.request.use(
        (config) => {
            showGlobalLoader();
            return config;
        },
        (error) => {
            hideGlobalLoader();
            return Promise.reject(error);
        }
    );

    // Response Interceptor
    window.axios.interceptors.response.use(
        (response) => {
            hideGlobalLoader();
            return response;
        },
        (error) => {
            hideGlobalLoader();
            return Promise.reject(error);
        }
    );
}