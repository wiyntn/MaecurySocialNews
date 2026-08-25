import { defineStore } from 'pinia';

export const useLoaderStore = defineStore('loader', {
    state: () => ({
        isLoading: false,
        requestCount: 0 // API ခေါ်ဆိုမှု တပြိုင်နက်တည်း လုပ်ချိန်တွင် ပျောက်မသွားအောင် စုပေါင်းစစ်ရန်
    }),
    actions: {
        showLoader() {
            this.requestCount++;
            this.isLoading = true;
        },
        hideLoader() {
            if (this.requestCount > 0) {
                this.requestCount--;
            }
            if (this.requestCount === 0) {
                this.isLoading = false;
            }
        },
        resetLoader() {
            this.requestCount = 0;
            this.isLoading = false;
        }
    }
});