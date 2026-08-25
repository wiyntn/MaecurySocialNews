<template>
    <ContentModal v-if="state.isOpen">
        <ModalHeader v-on:close="closeSwitcher" v-bind:modalTitle="$t('labels.account_switcher.title')"></ModalHeader>

        <div v-if="state.isLoading" class="block">
            <div class="py-12 flex justify-center">
                <PrimarySpinAnimation></PrimarySpinAnimation>
            </div>
        </div>
        <div v-else class="block max-h-96 overflow-y-auto">
            <LinkedAccountItem 
                v-for="accountData in linkedAccounts" 
                v-bind:key="accountData.id" 
                v-bind:accountData="accountData" 
                v-on:switch="switchAccount">
            </LinkedAccountItem>
        </div>

        <Border height="h-3"></Border>
        <div class="block p-4">
            <div class="mb-2">
                <p class="text-par-s text-lab-sc">
                    {{ $t('labels.account_switcher.description', { app_name: $config('app.name') }) }}
                </p>
            </div>
            <a v-bind:href="$getRoute('user_linker_index')" class="block">
                <PrimaryPillButton
                    v-bind:buttonText="$t('labels.account_switcher.button')"
                    buttonSize="lm"
                    buttonType="button"
                    buttonRole="accent"
                    v-bind:buttonFluid="true">
                </PrimaryPillButton>
            </a>
        </div>
    </ContentModal>
</template>

<script>
    import { defineComponent, computed, reactive, onMounted, onUnmounted, ref } from 'vue';
    import { useAuthStore } from '@D/store/auth/auth.store.js';
    import { colibriEventBus } from '@/kernel/events/bus/index.js';
    import { colibriAPI } from '@/kernel/services/api-client/native/index.js';

    import ContentModal from '@D/components/general/modals/ContentModal.vue';
    import ModalHeader from '@D/components/general/modals/parts/ModalHeader.vue';
    import PrimaryIconButton from '@D/components/inter-ui/buttons/PrimaryIconButton.vue';
    import PrimaryPillButton from '@D/components/inter-ui/buttons/PrimaryPillButton.vue';
    import LinkedAccountItem from '@D/components/accounts/parts/LinkedAccountItem.vue';
    import PrimarySpinAnimation from '@D/components/general/PrimarySpinAnimation.vue';
    import Border from '@D/components/general/Border.vue';

    export default defineComponent({
        setup: function() {
            const state = reactive({
                isOpen: false,
                isLoading: true
            });

            const authStore = useAuthStore();
            const linkedAccounts = ref([]);

            const closeSwitcher = () => {
                state.isOpen = false;
            };

            const openSwitcher = async () => {
                state.isOpen = true;
                state.isLoading = true;

                try {
                    const response = await colibriAPI().userSettings().getFrom('account/linked');
                    linkedAccounts.value = response?.data?.data ?? response?.data ?? [];
                } catch (error) {
                    if (error?.response?.data?.message) {
                        alert(error.response.data.message);
                    }
                    linkedAccounts.value = [];
                } finally {
                    state.isLoading = false;
                }
            };

            onMounted(() => {
                colibriEventBus.on('account-switcher:open', openSwitcher);
                colibriEventBus.on('account-switcher:close', closeSwitcher);
            });

            onUnmounted(() => {
                colibriEventBus.off('account-switcher:open', openSwitcher);
                colibriEventBus.off('account-switcher:close', closeSwitcher);
            });

            const switchAccount = async (accountData) => {
                const currentUserId = authStore?.userData?.id;

                if (accountData?.id && currentUserId !== accountData.id) {
                    accountData.isSwitching = true;

                    try {
                        await colibriAPI().userSettings().with({
                            account_id: accountData.id
                        }).sendTo('account/switch');

                        window.location.reload();
                    } catch (error) {
                        if (error?.response?.data?.message) {
                            alert(error.response.data.message);
                        }
                        accountData.isSwitching = false;
                    }
                }
            };

            return {
                linkedAccounts: linkedAccounts,
                state: state,
                closeSwitcher: closeSwitcher,
                ME: computed(() => {
                    return {
                        id: authStore?.userData?.id ?? null,
                        name: authStore?.userData?.name ?? ''
                    };
                }),
                switchAccount: switchAccount
            };
        },
        components: {
            ContentModal: ContentModal,
            PrimaryIconButton: PrimaryIconButton,
            ModalHeader: ModalHeader,
            PrimaryPillButton: PrimaryPillButton,
            LinkedAccountItem: LinkedAccountItem,
            PrimarySpinAnimation: PrimarySpinAnimation,
            Border: Border
        }
    });
</script>