import Axios from 'axios';

// Slash အပိုများကို အလိုအလျောက် ဖြတ်ထုတ်ပေးရန် function
const cleanUrlPart = (part) => {
    if (!part) return '';
    return part.replace(/^\/+|\/+$/g, '');
};

const rawBaseURL = import.meta.env.VITE_API_BASE_URL || 'https://maecurysocialnews.onrender.com/api';
const rawPrefix = import.meta.env.VITE_APP_API_PREFIX || '';

const baseURL = cleanUrlPart(rawBaseURL);
const appApiPrefix = cleanUrlPart(rawPrefix);

// မှန်ကန်သော baseURL ပုံစံ တည်ဆောက်ခြင်း
const finalBaseURL = appApiPrefix ? `${baseURL}/${appApiPrefix}/` : `${baseURL}/`;

const AxiosAuthHeaders = {
    Accept: 'application/json',
    'X-Requested-With': 'XMLHttpRequest'
};

if(window.ColibriBRD && window.ColibriBRD.connector) {
    AxiosAuthHeaders['X-Socket-ID'] = window.ColibriBRD.connector.pusher.connection.socket_id;
}

// Create an Axios instance
const AxiosAuth = Axios.create({
    baseURL: finalBaseURL,
    headers: AxiosAuthHeaders
});

AxiosAuth.defaults.withCredentials = true;

export { AxiosAuth, Axios };