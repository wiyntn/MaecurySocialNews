<template>
    <div class="my-top-offset block">
        <div class="mb-6">
            <PageTitle 
                v-if="userData && userData.first_name" 
                v-bind:hasBack="false" 
                v-bind:titleText="$t('labels.hello_user', { name: userData.first_name })"
            ></PageTitle>
            <div v-else class="h-8 flex items-center">
                <div class="h-5 w-40 bg-slate-200 animate-pulse rounded"></div>
            </div>
        </div>

        <StoriesFeed></StoriesFeed>
        
        <div class="mt-1">
            <SidedContentLayout>
                <template v-slot:content>
                    <TimelineContainer>
                        <!-- ၁။ ပထမဆုံး Data စတင် Load နေချိန် (Initial Loading) -->
                        <div class="block" v-if="state.isLoading">
                            <TimelinePublicationSkeleton v-for="i in 3" v-bind:key="i"></TimelinePublicationSkeleton>
                        </div>

                        <!-- ၂။ Data Load ပြီးသွားချိန် -->
                        <div class="block" v-else>
                            <div class="block">
                                <PublicationEditorTrigger></PublicationEditorTrigger>
                                <div class="h-px bg-bord-pr"></div>
                            </div>
                            
                            <!-- ၂.က) Post တွေ ရှိမှသာ ပြရန် -->
                            <div v-if="timelinePosts.length">
                                <TimelinePublication 
                                    v-for="postData in timelinePosts"
                                    v-bind:postData="postData"
                                    v-on:delete="handlePostDelete(postData)"
                                    v-bind:key="postData.hash_id"></TimelinePublication>

                                <!-- နောက်ထပ်စာမျက်နှာတွေ ထပ်ခေါ်နေချိန် (Infinite Scroll Loading) -->
                                <div v-if="state.isLoadingContent">
                                    <div class="flex justify-center my-4">
                                        <div class="colibri-primary-animation"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- ၂.ခ) Post လုံးဝ မရှိသေးမှသာ (Empty State) ပြရန် -->
                            <div v-else>
                                <div class="block py-72">
                                    <p class="text-lab-sc text-par-s text-center">
                                        Seems that there are no post yet.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </TimelineContainer>
                </template>

                <template v-slot:sidebar>
                    <FollowRecommendationList></FollowRecommendationList>
                    <AdGridItem></AdGridItem>
                </template>
            </SidedContentLayout>
        </div>

        <ScrollTopButton></ScrollTopButton>
    </div>
</template>

<script>
    import { defineComponent, reactive, computed, onMounted } from 'vue';
    import { useAuthStore } from '@D/store/auth/auth.store.js';
    import { useTimelineStore } from '@D/store/timeline/timeline.store.js';
    import { useDeletePost } from '@D/core/composables/delete-post/index.js';
    import { useInfiniteScroll } from '@D/core/composables/infinite-scroll/index.js';
    import { colibriEventBus } from '@/kernel/events/bus/index.js';

    import StoriesFeed from '@D/components/stories/feed/StoriesFeed.vue';
    import TimelinePublication from '@D/components/timeline/feed/TimelinePublication.vue';
    import TimelinePublicationSkeleton from '@D/components/timeline/feed/TimelinePublicationSkeleton.vue';
    import PublicationEditorTrigger from '@D/features/home/parts/PublicationEditorTrigger.vue';
    import PageTitle from '@D/components/layout/PageTitle.vue';
    import TimelineContainer from '@D/components/timeline/feed/TimelineContainer.vue';
    import ScrollTopButton from '@D/components/inter-ui/buttons/ScrollTopButton.vue';
    import FollowRecommendationList from '@D/components/recommend/follow/list/FollowRecommendationList.vue';
    import AdGridItem from '@D/components/ads/AdGridItem.vue';
    import SidedContentLayout from '@D/components/layout/SidedContentLayout.vue';

    export default defineComponent({
        setup: function() {
            const state = reactive({
                isLoading: false,
                isLoadingContent: false,
                noMoreContent: false,
                filter: {
                    page: 1
                }
            });

            const { postDeleter } = useDeletePost();
            
            const authStore = useAuthStore();
            const timelineStore = useTimelineStore();
            
            const userData = computed(() => authStore.user || {});

            const timelinePosts = computed(() => {
                return timelineStore.posts;
            });

            onMounted(async () => {
                state.isLoading = true;

                // Auth store ထဲမှာ ဘာတွေပါလဲ ထပ်စစ်ရန်
                console.log('=== AUTH STORE METHODS & STATE ===', authStore);
                
                // အကယ်၍ authStore ထဲမှာ user စစ်ဆေးတဲ့ function ရှိရင် ခေါ်သုံးနိုင်ပါတယ် (ဥပမာ authCheck)
                if (typeof authStore.authCheck === 'function') {
                    await authStore.authCheck();
                    console.log('After authCheck - User:', authStore.user);
                }

                await timelineStore.initialLoad();
                state.isLoading = false;
            });

            const loadMorePost = async () => {
                try {
                    if(! state.isLoadingContent && ! state.noMoreContent && timelinePosts.value.length) {
                        state.isLoadingContent = true;

                        await timelineStore.loadNextPage().then(function(response) {
                            let content = response.data.data;

                            if(content.length) {
                                timelineStore.appendPosts(content);
                            }
                            else {
                                state.noMoreContent = true;
                            }
                        }).catch((error) => {
                            if(error.response) {
                                state.noMoreContent = true;
                            }
                        });

                        state.isLoadingContent = false;
                    }
                } catch (error) {
                    console.log(error);
                }
            };

            useInfiniteScroll({
                callback: loadMorePost
            });

            return {
                timelinePosts,
                userData,
                state,
                handlePostDelete: (postData) => {
                    postDeleter(postData, (postId) => {
                        colibriEventBus.emit('timeline:post-deleted', postId);
                    });
                }
            };
        },
        components: {
            StoriesFeed,
            TimelinePublication,
            PublicationEditorTrigger,
            TimelinePublicationSkeleton,
            PageTitle,
            TimelineContainer,
            FollowRecommendationList,
            AdGridItem,
            ScrollTopButton,
            SidedContentLayout
        }
    });
</script>