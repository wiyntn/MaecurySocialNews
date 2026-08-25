import { defineStore } from 'pinia';
import { colibriAPI } from '@/kernel/services/api-client/native/index.js';
import { useStoriesStore } from '@D/store/stories/stories.store.js';

const useStoriesEditorStore = defineStore('stories_editor_store', {
    state: function() {
        return {
            opened: false,
            uploadProgress: 0,
            storyMedia: null,
            storyData: {
                content: ''
            }
        }
    },
    getters: {
        isOpen: (state) => {
            return state.opened;
        },
        isFormValid: (state) => {
            return state.storyMedia !== null;
        }
    },
    actions: {
        openEditor: function() {
            this.opened = true;
        },
        closeEditor: function() {
            this.opened = false;
        },
        resetEditor: function() {
            this.uploadProgress = 0;
            this.storyMedia = null;
            this.storyData = {
                content: ''
            }
        },
        publishStory: async function() {
            const state = this;
            const storiesStore = useStoriesStore();
            if (state.storyMedia) {
                try {
                    const response = await colibriAPI().storyEditor().with({
                        content: state.storyData.content
                    }).sendTo('create');

                    // Safe Response Data Check
                    const responseData = response?.data?.data ?? response?.data;
                    if (responseData) {
                        storiesStore.prependFeedItem(responseData);
                    }
                } catch (error) {
                    const errorMessage = error?.response?.data?.message || error?.message || 'Failed to publish story';
                    throw new Error(errorMessage);
                }
            }
        },
        uploadMedia: async function(mediaFile) {
            const formData = new FormData();
            const state = this;

            formData.append('media_file', mediaFile);
            
            try {
                const response = await colibriAPI().storyEditor().with(formData).withHeaders({
                    'Content-Type': 'multipart/form-data'
                }).uploadProgress((progressEvent) => {
                    if (progressEvent.total) {
                        state.uploadProgress = Math.round((progressEvent.loaded / progressEvent.total) * 100);
                    }
                }).sendTo('media/upload');

                // Safe Data Assignment (TypeError: raw / undefined မတက်အောင် ကာကွယ်ခြင်း)
                state.storyMedia = response?.data?.data ?? response?.data ?? null;
                state.uploadProgress = 0;
            } catch (error) {
                state.uploadProgress = 0;
                const errorMessage = error?.response?.data?.message || error?.message || 'Failed to upload media';
                throw new Error(errorMessage);
            }
        },
        deleteMedia: async function() {
            this.storyMedia = null;

            try {
                await colibriAPI().storyEditor().delete('media/delete');
            } catch (error) {
                const errorMessage = error?.response?.data?.message || error?.message || 'Failed to delete media';
                throw new Error(errorMessage);
            }
        }
    }
});

export { useStoriesEditorStore };