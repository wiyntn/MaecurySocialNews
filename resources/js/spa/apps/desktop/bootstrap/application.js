import '@D/bootstrap/initialization/index.js';

import { createApp, defineAsyncComponent } from 'vue';
import { createI18n } from 'vue-i18n';
import { createPinia } from 'pinia';
import { postDeleteListener } from '@D/plugins/pinia/post/delete-listener.js';

import outsideClickDirective from '@D/core/directives/click.outside.js';
import Router from '@D/router/index.js';
import LanguageMessages from '@/lang/index.js';

import ColibriPlusDesktop from '@D/bootstrap/boot/ColibriPlusDesktop.vue';
import PrimeVue from 'primevue/config';
import globalProperties from '@D/plugins/global.properties.js';

// -------------------------------------------------------------
// Global Variables Fallback Injection (Sidebar & Layouts Error Fix)
// -------------------------------------------------------------
window.BackendEmbeds = window.BackendEmbeds || {
    locale: 'en',
    config: {
        app: {
            name: 'ColibriPlus'
        }
    }
};
window.HIDE_AUTHOR_ATTRIBUTION = window.HIDE_AUTHOR_ATTRIBUTION || false;

// 1. Vue App Instance ဖန်တီးပါ
const Application = createApp(ColibriPlusDesktop);

// 2. Pinia Instance ဖန်တီးပြီး Plugin တပ်ဆင်ပါ
const pinia = createPinia();
pinia.use(postDeleteListener);

// 3. i18n Initialization Function
async function initializeI18n() {
    const messages = await LanguageMessages.messages();
    const currentLocale = window.BackendEmbeds?.locale || LanguageMessages.langLocale || 'en';

    return createI18n({
        locale: LanguageMessages.langLocale || currentLocale,
        warnHtmlInMessage: false,
        warnHtmlMessage: false,
        legacy: false,
        fallbackLocale: LanguageMessages.langLocale || currentLocale,
        messages: {
            [currentLocale]: messages
        }
    });
}

const ColibriPlusI18n = await initializeI18n();

// -------------------------------------------------------------
// Plugins Registration (Pinia ကို Router ထက် အရင် Use ရမည်)
// -------------------------------------------------------------
Application.use(pinia); // 1. Pinia အရင်
Application.use(Router); // 2. Router ဒုတိယ
Application.use(globalProperties);
Application.use(PrimeVue, { unstyled: true });
Application.use(ColibriPlusI18n);

Application.directive('outside-click', outsideClickDirective);

// -------------------------------------------------------------
// Global Components Registration
// -------------------------------------------------------------
Application.component('Border', defineAsyncComponent(() => {
    return import("@D/components/general/Border.vue");
}));

Application.component('VerificationBadge', defineAsyncComponent(() => {
    return import("@D/components/general/badges/VerificationBadge.vue");
}));

Application.component('SvgIcon', defineAsyncComponent(() => {
    return import("@D/components/icons/SvgIcon.vue");
}));

Application.component('FileFormatIcon', defineAsyncComponent(() => {
    return import("@D/components/icons/FileFormatIcon.vue");
}));

Application.component('PrimaryTransition', defineAsyncComponent(() => {
    return import("@D/components/general/transitions/PrimaryTransition.vue");
}));

Application.component('PrimaryDotsAnimation', defineAsyncComponent(() => {
    return import("@D/components/general/animations/PrimaryDotsAnimation.vue");
}));

Application.component('PrimarySpinAnimation', defineAsyncComponent(() => {
    return import("@D/components/general/animations/PrimarySpinAnimation.vue");
}));

// 4. App ကို Mount လုပ်ပါ
Application.mount("#colibriplus-desktop-app");