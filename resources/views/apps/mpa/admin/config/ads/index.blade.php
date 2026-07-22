@extends('adminLayout::index')

@section('pageContent')
    <div class="mb-10">
        <x-page-title titleText="Ads Manager Configuration"></x-page-title>
    </div>
    <div class="block">
        <livewire:admin.config.ads />
    </div>
@endsection
