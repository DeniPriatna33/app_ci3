<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title"><?= $sub_judul1 ?>&nbsp;<?= $sub_judul ?>
					<a href="<?= base_url('crud/crud_v2') ?>" class="btn btn-primary btn-sm float-right"><i class="fa fa-arrow-left"></i></a>
				</h4>
				<form action="<?= base_url('crud/crud_v2/update') ?>" method="POST">
					<div class="form-group">
						<label for="nama">Nama</label>
						<input type="hidden" name="id" class="form-control" id="id" value="<?= $mahasiswa['id'] ?>">
						<input type="text" name="nama" class="form-control" id="nama" value="<?= $mahasiswa['nama'] ?>">
						<small class="form-text text-danger"></small>
					</div>
					<div class="form-group">
						<label for="nik">NIK</label>
						<input type="text" name="nik" class="form-control" id="nik" value="<?= $mahasiswa['nik'] ?>">
						<small class="form-text text-danger"></small>
					</div>
					<div class="form-group">
						<label for="email">Email</label>
						<input type="text" name="email" class="form-control" id="email" value="<?= $mahasiswa['email'] ?>">
						<small class="form-text text-danger"></small>
					</div>
					<div class="form-group">
						<label for="jurusan">Jurusan</label>
						<select class="form-control" id="jurusan" name="jurusan">
							<?php foreach ($jurusan as $dt) { ?>
								<?php if ($dt == $mahasiswa['jurusan']) : ?>
									<option value="<?= $dt; ?>" selected><?= $dt; ?></option>
								<?php else : ?>
									<option value="<?= $dt; ?>"><?= $dt; ?></option>
								<?php endif; ?>
							<?php } ?>
						</select>
					</div>
					<button type="submit" name="tambah" class="btn btn-primary float-right">Update Data</button>
				</form>
			</div>
		</div>
	</div>
</div>
