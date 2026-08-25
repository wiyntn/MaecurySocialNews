import { useUIStore } from '@D/store/global/ui.store.js';
import { computed } from 'vue';

function useCheatSheet() {

    const uiStore = useUIStore();

    const openCheatSheetPanel = () => {
        uiStore?.openCheatSheet();
    };

    const closeCheatSheetPanel = () => {
        uiStore?.closeCheatSheet();
    };

    const isOpen = computed(() => {
        // uiStore.cheatSheet သို့မဟုတ် isOpen မရှိခဲ့လျှင် false ကို Safe ပြန်ပေးမည်
        return uiStore?.cheatSheet?.isOpen ?? false;
    });

    return {
        openCheatSheetPanel: openCheatSheetPanel,
        closeCheatSheetPanel: closeCheatSheetPanel,
        isOpen: isOpen
    };
}

export { useCheatSheet };