<template>
    <aside class="flex fixed left-0 top-0 bottom-0 sticky-bar-bottom-offset z-50">
        <template v-if="isMessenger">
            <MessengerActionBar></MessengerActionBar>
        </template>
        <template v-else>
            <div class="shrink-0 flex w-page-offset">
                <ApplicationActionBar></ApplicationActionBar>
                <div class="flex-1 h-full shrink-0">
                    <div class="flex flex-col h-full pt-6">
                        <div class="mb-8 mx-6">
                            <div class="flex items-center gap-2">
                                <div class="block">
                                    <RouterLink v-bind:to="{ name: 'home_page' }">
                                        <img class="h-7" v-bind:src="$embedder ? $embedder('assets.logos.url') : ''" alt="Logo">
                                    </RouterLink>
                                </div>
                            </div>
                        </div>
                        <div class="pl-6">
                            <ApplicationNavbar></ApplicationNavbar>
                        </div>
                        <div class="pl-6 mt-auto mb-4">
                            <div class="flex flex-wrap mb-2 leading-5">
                                <RouterLink v-bind:to="{ name: 'theme_settings_page' }" class="hover:underline text-cap-s text-lab-sc mr-2">
                                    {{ $t('labels.theme') }}
                                </RouterLink>
                                <RouterLink v-if="$config('features.jobs.enabled')" v-bind:to="{ name: 'jobs_page' }" class="hover:underline text-cap-s text-lab-sc mr-2">
                                    {{ $t('labels.jobs') }}
                                </RouterLink>
                                <a v-bind:href="$getRoute('privacy_policy')" target="_blank" class="hover:underline text-cap-s text-lab-sc mr-2">
                                    {{ $t('labels.privacy_policy') }}
                                </a>
                                <a v-bind:href="$getRoute('cookies_policy')" target="_blank" class="hover:underline text-cap-s text-lab-sc mr-2">
                                    {{ $t('labels.cookies_policy') }}
                                </a>
                                <a v-bind:href="$getRoute('terms_of_use')" target="_blank" class="hover:underline text-cap-s text-lab-sc mr-2">
                                    {{ $t('labels.terms') }}
                                </a>
                            </div>
                            <div class="leading-5">
                                <span class="text-cap-s text-lab-sc">
                                    {{ appName }} &copy; {{ currentYear }}
                                    <RouterLink v-if="!hideAuthorAttribution" v-bind:to="{ name: 'about_author_page' }">
                                        <span class="block whitespace-nowrap hover:underline hover:text-brand-900">
                                            Created by Wai Yan
                                        </span>
                                    </RouterLink>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </template>

        <div v-if="ContextNavbar" class="w-navbar h-full border-l border-l-fill-pr">
            <component v-bind:is="ContextNavbar" />
        </div>
    </aside>
</template>

<script>
    import { defineComponent, computed, defineAsyncComponent } from 'vue';
    import { useRoute } from 'vue-router';

    import ApplicationNavbar from '@D/components/layout/ApplicationNavbar.vue';
    import ApplicationActionBar from '@D/components/layout/parts/navbar/ApplicationActionBar.vue';
    import MessengerActionBar from '@D/components/layout/parts/navbar/MessengerActionBar.vue';

    // Async Components များကို setup ပြင်ပတွင် ကြိုတင် Define လုပ်ခြင်း (Performance & Re-render Fix)
    const SettingsNavbar = defineAsyncComponent({
        loader: () => import('@D/views/settings/parts/SettingsNavbar.vue'),
        delay: 200,
        timeout: 3000
    });

    const MessengerNavbar = defineAsyncComponent({
        loader: () => import('@D/views/messenger/history/MessengerNavbar.vue'),
        delay: 200,
        timeout: 3000
    });

    export default defineComponent({
        setup: function() {
            const route = useRoute();

            const ContextNavbar = computed(() => {
                if (route.meta?.contextNavbar) {
                    if (route.meta?.sectionName === 'settings') {
                        return SettingsNavbar;
                    } else if (route.meta?.sectionName === 'messenger') {
                        return MessengerNavbar;
                    }
                }
                return null;
            });

            const isMessenger = computed(() => {
                return route.meta?.sectionName === 'messenger';
            });

            const appName = window.BackendEmbeds?.config?.app?.name ?? 'App';
            const hideAuthorAttribution = window.HIDE_AUTHOR_ATTRIBUTION ?? false;

            return {
                isMessenger: isMessenger,
                appName: appName,
                currentYear: new Date().getFullYear(),
                ContextNavbar: ContextNavbar,
                hideAuthorAttribution: hideAuthorAttribution
            };
        },
        components: {
            ApplicationNavbar: ApplicationNavbar,
            ApplicationActionBar: ApplicationActionBar,
            MessengerActionBar: MessengerActionBar
        }
    });
</script>