import { defineStore } from 'pinia';
import { colibriAPI } from '@/kernel/services/api-client/native/index.js';

const DEFAULT_UNREAD_COUNT = {
    formatted: 0,
    raw: 0
};

const useNotificationsStore = defineStore('notifications_store', {
    state: function() {
        return {
            isOpen: false,
            unreadCount: { ...DEFAULT_UNREAD_COUNT },
            notifications: []
        }
    },
    actions: {
        openNotifications: function() {
            this.isOpen = true;
        },
        closeNotifications: function() {
            this.isOpen = false;
        },
        fetchNotifications: async function(type = 'all') {
            try {
                const response = await colibriAPI().notifications().getFrom(type);
                this.notifications = response?.data?.data ?? response?.data ?? [];
            } catch (error) {
                this.notifications = [];
            }
        },
        fetchUnreadCount: async function() {
            try {
                const response = await colibriAPI().notifications().getFrom('unread/count');
                const countData = response?.data?.data ?? response?.data;

                // raw property ပါမပါ စစ်ပြီးမှ assign လုပ်ခြင်း (reading 'raw' error ကာကွယ်ရန်)
                if (countData && typeof countData === 'object' && 'raw' in countData) {
                    this.unreadCount = {
                        formatted: countData.formatted ?? countData.raw,
                        raw: countData.raw ?? 0
                    };
                } else if (typeof countData === 'number') {
                    this.unreadCount = {
                        formatted: countData,
                        raw: countData
                    };
                } else {
                    this.unreadCount = { ...DEFAULT_UNREAD_COUNT };
                }
            } catch (error) {
                this.unreadCount = { ...DEFAULT_UNREAD_COUNT };
            }
        },
        deleteNotification: async function(notificationId) {
            // UI ထဲမှ အရင်ဖျက်ထုတ်ခြင်း (Optimistic Update)
            this.notifications = this.notifications.filter((notification) => notification?.id !== notificationId);

            try {
                await colibriAPI().notifications().with({
                    notification_id: notificationId
                }).delete('delete');
            } catch (error) {
                // Error ဖြစ်ပါက အခြေအနေအရ notification ပြန်လည် ခေါ်ယူနိုင်သည်
                console.error('Failed to delete notification:', error);
            }
        },
        setUnreadNotificationsCount: function(unreadCount) {
            // unreadCount က undefined/null ဖြစ်လာခဲ့ရင် raw error မတက်အောင် ကာကွယ်ခြင်း
            if (unreadCount && typeof unreadCount === 'object') {
                this.unreadCount = {
                    formatted: unreadCount.formatted ?? unreadCount.raw ?? 0,
                    raw: unreadCount.raw ?? 0
                };
            } else if (typeof unreadCount === 'number') {
                this.unreadCount = {
                    formatted: unreadCount,
                    raw: unreadCount
                };
            } else {
                this.unreadCount = { ...DEFAULT_UNREAD_COUNT };
            }
        }
    }
});

export { useNotificationsStore };