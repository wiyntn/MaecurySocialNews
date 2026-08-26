import { defineStore } from 'pinia';
import { useRouter } from 'vue-router';
import { colibriAPI } from '@/kernel/services/api-client/native/index.js';
import { useAuthStore } from '@D/store/auth/auth.store.js';

const useAppStore = defineStore('app', {
    state: () => {
        return {
            appData: null
        };
    },
    actions: {
        bootstrapApplication: async function() {
            let state = this;

            const authStore = useAuthStore();
            const router = useRouter();

            try {
                await fetch('sanctum/csrf-cookie', {
                    method: 'GET',
                    credentials: 'include'
                });

                // .bootstrap() ကို ဖြုတ်ပြီး .getFrom('bootstrap') ဖြင့် တိုက်ရိုက်ခေါ်ပါ
                const response = await colibriAPI().getFrom('bootstrap');
                
                console.log('FULL BOOTSTRAP RESPONSE:', response);

                state.appData = response.data.data;

                if (state.appData && state.appData.auth && state.appData.auth.user) {
                    authStore.setUser(state.appData.auth.user);
                    console.log('User successfully set in authStore:', state.appData.auth.user);
                } else {
                    console.warn('Auth or user object is missing in appData:', state.appData);
                }

            } catch (error) {
                console.error('Bootstrap application error:', error);
                if (error.response) {
                    router.push({ name: 'server_error_bootstrap' });
                }
            }
        }
    }
});

export { useAppStore };