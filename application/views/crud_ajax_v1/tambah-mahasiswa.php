<form method="POST" id="form">
	<div class="form-group">
		<label for="nama">Nama</label>
		<input type="text" name="nama" class="form-control" id="nama">
		<small class="form-text text-danger"><?= form_error('nama'); ?></small>
	</div>
	<div class="form-group">
		<label for="nik">NIK</label>
		<input type="text" name="nik" class="form-control" id="nik">
		<small class="form-text text-danger"><?= form_error('nik'); ?></small>
	</div>
	<div class="form-group">
		<label for="email">Email</label>
		<input type="text" name="email" class="form-control" id="email">
		<small class="form-text text-danger"><?= form_error('email'); ?></small>
	</div>
	<div class="form-group">
		<label for="jurusan">Jurusan</label>
		<select class="form-control" id="jurusan" name="jurusan">
			<option value="Teknik Informatika">Teknik Informatika</option>
			<option value="Teknik Industri">Teknik Industri</option>
			<option value="Teknik Pangan">Teknik Pangan</option>
			<option value="Teknik Mesin">Teknik Mesin</option>
			<option value="Teknik Planologi">Teknik Planologi</option>
			<option value="Teknik Lingkungan">Teknik Lingkungan</option>
		</select>
	</div>
	<button id="tombol_tambah" type="button" class="btn btn-primary float-right" data-dismiss="modal">Tambah Data</button>
</form>
<script type="text/javascript">
	$(document).ready(function() {
		$("#tombol_tambah").click(function(e) {
			e.preventDefault();
			var data = $('#form').serialize();
			$.ajax({
				type: 'POST',
				url: "<?= base_url('crud/crud_ajax_v1/save_data') ?>",
				data: data,
				success: function(data) {
					$('#tampil').fadeOut(800, function() {
						$.ajax({
							type: 'POST',
							url: "<?= base_url('crud/crud_ajax_v1/tampilMahasiswa') ?>",
							cache: false,
							success: function(data2) {
								$("#tampil").html(data2).delay("fast").fadeIn();
							},
						});
					});
				}
			});
		});
	});
</script>
