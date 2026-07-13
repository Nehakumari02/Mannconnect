<x-card>
	<div class="p-4">
		<div class="mb-4">
			<x-entity.format format="s3"></x-entity.format>
		</div>
		<h4 class="text-par-l font-semibold mb-1 text-lab-pr2">
			{{ __('admin/info.round_robin_notice.title') }}
		</h4>
		<p class="text-lab-sc text-par-m mb-4">
			{{ __('admin/info.round_robin_notice.line_one') }}
			<br>
			<br>
			{{ __('admin/info.round_robin_notice.line_two') }}
			<br>
			<br>
			{{ __('admin/info.round_robin_notice.line_three') }}
		</p>


	</div>
</x-card>
