import '@M/bootstrap/initialization/index.js';

import { createApp, defineAsyncComponent } from 'vue';

import ColibriPlusMobile from '@M/bootstrap/boot/ColibriPlusMobile.vue';
import Router from '@M/router/index.js';

import globalHelpers from '@M/core/global/global.helpers.js';

// -------------------------------------------------------------
// ၁။ Code တွေလိုက်မပြင်ဘဲ Missing Global Variables များကို ကြိုတင်ဖြည့်ထားခြင်း
// -------------------------------------------------------------
window.BackendEmbeds = window.BackendEmbeds || {
    config: {
        app: {
            name: 'Colibri'
        }
    }
};
window.HIDE_AUTHOR_ATTRIBUTION = window.HIDE_AUTHOR_ATTRIBUTION || false;

// -------------------------------------------------------------
// ၂။ App Instance ဖန်တီးခြင်း
// -------------------------------------------------------------
const Application = createApp(ColibriPlusMobile);

// -------------------------------------------------------------
// ၃။ Component တွေထဲမှာ Import မလုပ်ဘဲ သုံးထားတဲ့ Components များကို Global Register လုပ်ခြင်း
// -------------------------------------------------------------
Application.component('PrimarySpinAnimation', defineAsyncComponent(() => 
    import('@D/components/general/animations/PrimarySpinAnimation.vue')
));
Application.component('Border', defineAsyncComponent(() => 
    import('@D/components/general/Border.vue')
));
Application.component('PrimaryTransition', defineAsyncComponent(() => 
    import('@D/components/general/transitions/PrimaryTransition.vue')
));

// -------------------------------------------------------------
// ၄။ Plugins & Mount
// -------------------------------------------------------------
Application.use(Router);
Application.use(globalHelpers);

Application.mount("#colibriplus-mobile-app");