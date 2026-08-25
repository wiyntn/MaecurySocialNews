<header class="border-b border-fill-pr fixed top-0 left-0 right-0 bg-bg-pr/80 backdrop-blur-xs" style="min-width: 320px;">
    <div class="h-14 flex justify-between px-4 md:px-8 items-center relative">
        <div class="text-lab-pr text-par-m font-medium hidden md:block">
            @guest
                {{ __('auth.hi_there') }}
            @else
                {{ __('labels.hi_user', ['name' => me()->name ?? '']) }}
            @endif
        </div>

        <a class="absolute left-1/2 -translate-x-1/2" href="{{ route('user.desktop.index', '/') }}">
            <img class="h-7" src="{{ $logotypeUrl ?? '' }}" alt="Logo">
        </a>

        <div class="inline-flex gap-5 text-lab-pr font-medium items-center ml-auto">
            <!-- Alpine.js Root Element -->
            <div x-data="{ isOpen: false }" @click.outside="isOpen = false" class="relative" x-cloak>
                <button type="button" class="block leading-none cursor-pointer" @click="isOpen = !isOpen">
                    <span class="items-center gap-1 hidden md:flex">
                        <span class="text-par-m">
                            {{ $appLanguages?->getLocaleName() ?? '' }}
                        </span>
                        <span class="size-4 shrink-0">
                            <x-ui-icon name="chevron-down"></x-ui-icon>
                        </span>
                    </span>
                    <div class="inline-block md:hidden size-icon-small">
                        <x-ui-icon name="translate-01" type="line"></x-ui-icon>
                    </div>
                </button>

                <div 
                    x-show="isOpen" 
                    x-transition:enter="transition ease-out duration-100"
                    x-transition:enter-start="opacity-0 scale-95"
                    x-transition:enter-end="opacity-100 scale-100"
                    x-transition:leave="transition ease-in duration-75"
                    x-transition:leave-start="opacity-100 scale-100"
                    x-transition:leave-end="opacity-0 scale-95"
                    class="absolute top-full right-0 rounded-md overflow-hidden min-w-60 shadow-md z-40"
                    style="display: none;"
                >
                    <div class="block bg-bg-pr/80 backdrop-blur-xs divide-y divide-fill-tr">
                        @if(!empty($appLanguages) && method_exists($appLanguages, 'getLanguages'))
                            @foreach ($appLanguages->getLanguages() as $langData)
                                <a href="{{ route('user.language.switch', ['lang' => $langData->alpha_2_code]) }}" 
                                   rel="nofollow" 
                                   title="{{ $langData->name }}" 
                                   class="block px-4 py-2 hover:bg-fill-qt smoothing text-lab-pr2 text-par-s {{ empty($langData->current) ? '' : 'bg-fill-qt' }}">
                                    {{ $langData->name }}
                                </a>
                            @endforeach
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>