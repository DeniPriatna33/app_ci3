<form method="post" id="form">
	<input type="hidden" name="id" value="<?= $mahasiswa['id']; ?>">
	<div class="form-group">
		<label for="nama">Nama</label>
		<input type="text" name="nama" class="form-control" id="nama" value="<?= $mahasiswa['nama']; ?>">
		<small class="form-text text-danger"><?= form_error('nama'); ?></small>
	</div>
	<div class="form-group">
		<label for="nik">NIK</label>
		<input type="text" name="nik" class="form-control" id="nik" value="<?= $mahasiswa['nik']; ?>">
		<small class="form-text text-danger"><?= form_error('nik'); ?></small>
	</div>
	<div class="form-group">
		<label for="email">Email</label>
		<input type="text" name="email" class="form-control" id="email" value="<?= $mahasiswa['email']; ?>">
		<small class="form-text text-danger"><?= form_error('email'); ?></small>
	</div>
	<div class="form-group">
		<label for="jurusan">Jurusan</label>
		<select class="form-control" id="jurusan" name="jurusan">
			<?php foreach ($jurusan as $j) : ?>
				<?php if ($j == $mahasiswa['jurusan']) : ?>
					<option value="<?= $j; ?>" selected><?= $j; ?></option>
				<?php else : ?>
					<option value="<?= $j; ?>"><?= $j; ?></option>
				<?php endif; ?>
			<?php endforeach; ?>
		</select>
	</div>
	<button id="tombol_edit" type="button" class="btn btn-primary float-right" data-dismiss="modal">Ubah Data</button>
</form>

<script type="text/javascript">
	$(document).ready(function() {
		$("#tombol_edit").click(function(e) {
			e.preventDefault();
			var data = $('#form').serialize();
			$.ajax({
				type: 'POST',
				url: "<?= base_url(); ?>crud/crud_ajax_v1/update_data",
				data: data,
				cache: false,
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
