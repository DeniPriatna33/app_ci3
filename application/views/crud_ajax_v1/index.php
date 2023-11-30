<div class="row">

	<div class="col-12">
		<div class="card">
			<div class="card-body">

				<h4 class="card-title"><?= $sub_judul1 ?>&nbsp;<?= $sub_judul ?>
					<button type="button" class="tambah btn btn-primary btn-sm  float-right mb-3" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-plus"> Tambah Data</i>
					</button>
				</h4>

				<div class="table-responsive">
					<div id="tampil">
						<!-- Data tampil disini -->
						<div id='ajax-wait'>
							<img alt='loading...' src='<?= base_url('assets/images/Rolling.png') ?>' />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type: 'POST',
			url: "<?= base_url('crud/crud_ajax_v1/tampilMahasiswa') ?>",
			cache: false,
			success: function(data) {
				$("#tampil").html(data);
			},
		});

	});


	$(document).ajaxStart(function() {
		$("#ajax-wait").css({
			left: ($(window).width() - 20) / 2 + "px", // 32 = lebar gambar
			top: ($(window).height() - 20) / 2 + "px", // 32 = tinggi gambar
			display: "block"
		})
	}).ajaxComplete(function() {
		$("#ajax-wait").fadeOut();
	});
</script>
