@props([
    'hasLabel' => true,
    'labelText' => '',
    'name' => '',
    'action' => '',
    'defaultValue' => '',
    'placeholder' => '',
    'options' => [],
])

<div class="block">
    @if ($hasLabel)
        <label class="mb-2 font-medium block text-lab-pr2 text-par-s">
            {{ $labelText }}
        </label>
    @endif

    <div class="block relative">
        <div x-data="{ isOpen: false }" @click.outside="isOpen = false" class="cursor-pointer relative {{ (count($options) < 1) ? 'opacity-60 cursor-default' : '' }}" x-cloak>
            <div @click="isOpen = !isOpen" class="w-full bg-input-pr border-none h-12 md:h-14 rounded-md flex items-center px-4">
                <span class="truncate text-lab-sc text-par-s md:text-par-n">{{ $placeholder }}</span>
                <span class="size-4 text-lab-sc shrink-0 ml-auto">
                    <x-ui-icon name="chevron-selector-vertical" type="solid"></x-ui-icon>
                </span>
            </div>
            @if(count($options))
                <div x-show="isOpen" 
                     x-transition:enter="transition ease-out duration-100"
                     x-transition:enter-start="opacity-0 scale-95"
                     x-transition:enter-end="opacity-100 scale-100"
                     x-transition:leave="transition ease-in duration-75"
                     x-transition:leave-start="opacity-100 scale-100"
                     x-transition:leave-end="opacity-0 scale-95"
                     class="absolute shadow-md py-2 rounded-md top-full left-0 bg-bg-pr/80 backdrop-blur-xs w-60 overflow-y-auto max-h-96 z-50"
                     style="display: none;">
                    @foreach ($options as $optionItem)
                        @php
                            // Array ဖြစ်ဖြစ် Object ဖြစ်ဖြစ် Safe ဖြစ်အောင် စစ်ဆေးခြင်း
                            $optKey = is_array($optionItem) ? ($optionItem['key'] ?? '') : ($optionItem->key ?? '');
                            $optValue = is_array($optionItem) ? ($optionItem['value'] ?? '') : ($optionItem->value ?? '');
                        @endphp
                        <div wire:click="saveSelectOption('{{ $action }}', '{{ $optKey }}')" 
                             @click="isOpen = false"
                             class="px-4 py-2 border-b text-par-s md:text-par-n text-lab-sc border-fill-pr last:border-none hover:bg-fill-qt cursor-pointer">
                            {{ $optValue }}
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>
</div>