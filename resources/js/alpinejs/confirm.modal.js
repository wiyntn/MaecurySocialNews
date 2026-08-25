import Alpine from 'alpinejs';

document.addEventListener('alpine:init', () => {
    Alpine.store('confirmModal', {
        isOpen: false,
        formAction: '',
        content: {
            title: '',
            desc: '',
            cancelButtonText: 'Cancel',
            confirmButtonText: 'Confirm'
        },

        open: function(options = {}) {
            this.isOpen = true;
            this.formAction = options.formAction ?? '';
            
            // Dynamic text သို့မဟုတ် Default text fallback ပေးခြင်း
            this.content.title = options.title ?? '';
            this.content.desc = options.desc ?? '';
            this.content.cancelButtonText = options.cancelButtonText ?? 'Cancel';
            this.content.confirmButtonText = options.confirmButtonText ?? 'Confirm';
        },

        close: function() {
            this.isOpen = false;
            // Modal ပိတ်သွားလျှင် Data များကို Reset ပြုလုပ်ပေးခြင်း
            this.formAction = '';
        }
    });
});

// Alpine.js ကို Explicitly Start လုပ်ပေးရန်
window.Alpine = Alpine;
Alpine.start();