@props([
    'titleText' => '',
    'backButton' => null
])

@php
    // If backButton is not explicitly passed, automatically decide based on the route name
    if (is_null($backButton)) {
        $backButton = Route::currentRouteName() && !str_ends_with(Route::currentRouteName(), '.index');
    }
@endphp

<div class="flex gap-2 items-center mb-4 leading-none">
    @if($backButton)
        <a href="javascript:history.back()" class="shrink-0 cursor-pointer text-lab-pr hover:text-lab-pr2 transition-colors">
            <span class="size-icon-normal block">
                <x-ui-icon name="arrow-left" type="solid"></x-ui-icon>
            </span>
        </a>
    @endif
    <div class="flex-1">
        <h2 class="text-title-1 tracking-tight text-lab-pr2 font-bold leading-tight">
            {!! $titleText !!}
        </h2>
    </div>
</div>
