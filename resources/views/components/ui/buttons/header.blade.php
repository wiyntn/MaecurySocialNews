@props([
    'url' => '#',
    'avatarUrl' => '',
    'iconName' => 'help-01',
    'iconType' => 'solar',
])

<a {{ $attributes }} href="{{ $url }}" class="shrink-0 cursor-pointer items-center">
    <div class="size-full bg-bg-pr overflow-hidden rounded-full border border-edge-sc">
        @if($avatarUrl)
            <img class="w-full h-full object-cover" src="{{!! $avatarUrl !!}}" alt="Image">
        @else
            <div class="size-full flex-center text-lab-pr3 hover:text-brand-900">
                <div class="size-6">
                    <x-ui-icon name="{{ $iconName }}" type="{{ $iconType }}" />
                </div>
            </div>
        @endif
    </div>
</a>
