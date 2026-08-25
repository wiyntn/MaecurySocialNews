import { showGlobalLoader, hideGlobalLoader } from '@/kernel/helpers/loaderState.js';

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