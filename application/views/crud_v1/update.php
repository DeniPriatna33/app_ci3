<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title"><?= $sub_judul1 ?>&nbsp;<?= $sub_judul ?>
					<a href="<?= base_url('crud/crud_v1') ?>" class="btn btn-primary btn-sm float-right"><i class="fa fa-arrow-left"></i></a>
				</h4>
				<form action="" method="post">
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
					<button type="submit" name="ubah" class="btn btn-primary float-right">Ubah Data</button>
				</form>
			</div>
		</div>
	</div>
</div>