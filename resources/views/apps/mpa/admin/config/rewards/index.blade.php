@extends('adminLayout::index')

@section('pageContent')
    <x-page-title titleText="Rewards Settings"></x-page-title>

	<x-content>
        @livewire('admin.config.rewards')
	</x-content>
@endsection
