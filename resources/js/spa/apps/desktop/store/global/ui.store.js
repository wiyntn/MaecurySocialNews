import { defineStore } from 'pinia';

const DEFAULT_CHEAT_SHEET_STATE = {
    isOpen: false
};

const useUIStore = defineStore('ui', {
    state: () => {
        return {
            cheatSheet: { ...DEFAULT_CHEAT_SHEET_STATE }
        };
    },
    getters: {
        // Component တွေမှာ uiStore.isCheatSheetOpen လို့ တိုက်ရိုက် ခေါ်သုံးနိုင်ရန် Safe Getter
        isCheatSheetOpen: (state) => {
            return state.cheatSheet?.isOpen ?? false;
        }
    },
    actions: {
        openCheatSheet: function() {
            if (!this.cheatSheet) {
                this.cheatSheet = { ...DEFAULT_CHEAT_SHEET_STATE };
            }
            this.cheatSheet.isOpen = true;
        },
        closeCheatSheet: function() {
            if (!this.cheatSheet) {
                this.cheatSheet = { ...DEFAULT_CHEAT_SHEET_STATE };
            }
            this.cheatSheet.isOpen = false;
        },
        toggleCheatSheet: function() {
            if (!this.cheatSheet) {
                this.cheatSheet = { ...DEFAULT_CHEAT_SHEET_STATE };
            }
            this.cheatSheet.isOpen = !this.cheatSheet.isOpen;
        },
        resetUI: function() {
            this.cheatSheet = { ...DEFAULT_CHEAT_SHEET_STATE };
        }
    }
});

export { useUIStore };