<template>
    <Teleport v-if="state.isOpen" to="body">
        <ContentModal>
            <ModalHeader v-on:close="closeReportModal" v-bind:modalTitle="$t('labels.report')"></ModalHeader>

            <div v-if="state.isLoading || !reportInfo" class="flex justify-center py-12">
                <PrimaryDotsAnimation></PrimaryDotsAnimation>
            </div>
            <div class="block" v-else>
                <div class="block py-6 px-4 text-center">
                    <div class="flex justify-center">
                        <div class="size-6 text-red-500">
                            <SvgIcon name="alert-hexagon"></SvgIcon>
                        </div>
                    </div>
                    <h3 class="text-title-3 font-bold tracking-tighter text-lab-pr2">
                        {{ reportInfo?.title ?? '' }}
                    </h3>
                    <p class="text-par-s text-lab-sc">
                        {{ reportInfo?.description ?? '' }}
                    </p>
                </div>
                <Border height="h-3"></Border>
                <div class="block max-h-96 overflow-y-auto">
                    <ReasonItem 
                        v-for="(reasonData, idx) in (reportInfo?.reasons ?? [])" 
                        v-bind:key="idx" 
                        v-on:click="selectReason(idx)" 
                        v-bind:isSelected="state.selectedReasonIndex === idx" 
                        v-bind:reasonData="reasonData">
                    </ReasonItem>
                </div>
                <Border></Border>
                <div class="block py-4 px-4">
                    <PrimaryPillButton
                        v-bind:disabled="state.selectedReasonIndex === null"
                        v-bind:buttonText="$t('labels.send_report')"
                        buttonSize="lm"
                        buttonType="button"
                        buttonRole="accent"
                        v-on:click="sendReport"
                        v-bind:buttonFluid="true">
                    </PrimaryPillButton>
                </div>
            </div>
        </ContentModal>
    </Teleport>
</template>

<script>
    import { computed, defineComponent, onMounted, onUnmounted, reactive } from 'vue';
    import { useI18n } from 'vue-i18n';
    import { colibriEventBus } from '@/kernel/events/bus/index.js';
    import { useReportStore } from '@/apps/desktop/store/report/report.store.js';
    import { ToastNotifier } from '@D/core/services/toast-notification/index.js';

    import ContentModal from '@D/components/general/modals/ContentModal.vue';
    import ModalHeader from '@D/components/general/modals/parts/ModalHeader.vue';
    import ReasonItem from '@D/components/reports/parts/ReasonItem.vue';
    import PrimaryPillButton from '@D/components/inter-ui/buttons/PrimaryPillButton.vue';
    import SvgIcon from '@D/components/icons/SvgIcon.vue';
    import Border from '@D/components/general/Border.vue';
import PrimaryDotsAnimation from '@D/components/general/animations/PrimaryDotsAnimation.vue';
    export default defineComponent({
        setup: function() {
            const state = reactive({
                isOpen: false,
                isLoading: true,
                reportType: null,
                reportableId: null,
                selectedReasonIndex: null
            });

            const { t } = useI18n();
            const reportStore = useReportStore();
            const toastNotifier = new ToastNotifier();

            const openReportModal = async (data) => {
                if (!data) return;

                state.isOpen = true;
                state.isLoading = true;
                state.reportType = data.type;
                state.reportableId = data.reportableId;

                try {
                    if (state.reportType && !reportStore?.reportReasons?.[state.reportType]) {
                        await reportStore.fetchReportReasons(state.reportType);
                    }
                } catch (error) {
                    console.error('Failed to fetch report reasons:', error);
                } finally {
                    state.isLoading = false;
                }
            };

            const closeReportModal = () => {
                state.isOpen = false;
                state.isLoading = true;
                state.reportType = null;
                state.reportableId = null;
                state.selectedReasonIndex = null;
            };

            onMounted(() => {
                colibriEventBus.on('report:open', openReportModal);
                colibriEventBus.on('report:close', closeReportModal);
            });

            onUnmounted(() => {
                colibriEventBus.off('report:open', openReportModal);
                colibriEventBus.off('report:close', closeReportModal);
            });

            return {
                state: state,
                closeReportModal: closeReportModal,
                reportInfo: computed(() => {
                    if (!state.reportType || !reportStore?.reportReasons) return null;
                    return reportStore.reportReasons[state.reportType] ?? null;
                }),
                selectReason: function(idx) {
                    if (state.selectedReasonIndex === idx) {
                        state.selectedReasonIndex = null;
                    } else {
                        state.selectedReasonIndex = idx;
                    }
                },
                sendReport: function() {
                    if (state.selectedReasonIndex === null) return;

                    reportStore.sendReport({
                        type: state.reportType,
                        reason_index: state.selectedReasonIndex,
                        reportable_id: state.reportableId
                    });

                    toastNotifier.notifyShort(t('toast.report_sent'));

                    closeReportModal();
                }
            };
        },
        components: {
            ContentModal: ContentModal,
            ModalHeader: ModalHeader,
            ReasonItem: ReasonItem,
            PrimaryPillButton: PrimaryPillButton,
            SvgIcon: SvgIcon,
            Border: Border,
            PrimaryDotsAnimation: PrimaryDotsAnimation
        }
    });
</script>