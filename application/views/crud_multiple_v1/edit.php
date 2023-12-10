<style>
	.row_n {
		display: flex;
	}
</style>
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title"><?= $sub_judul1 ?>&nbsp;<?= $sub_judul ?>
					<a href="<?= base_url('crud/crud_multiple_v1/') ?>" class="btn btn-primary btn-sm float-right"><i class="fa fa-arrow-left"></i></a>
				</h4>
				<form action="<?= base_url('crud/Crud_multiple_v1/update_all') ?>" method="POST" enctype="multipart/form-data">
					<?php foreach ($query as $key => $value) { ?>
						<div class="row_n">
							<div class="col-sm-3">
								<div class="form-group">
									<label for="">Nama</label>
									<input type="text" class="form-control" id="nama" name="nama[]" placeholder="Nama" value="<?= $value->nama ?>">
									<input type="hidden" class="form-control" id="id" name="id[]" placeholder="id" value="<?= $value->id ?>">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label for="">Nik</label>
									<input type="text" class="form-control" id="nik" name="nik[]" placeholder="Nik" value="<?= $value->nik ?>">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label for="">Email</label>
									<input type="text" class="form-control" id="email" name="email[]" placeholder="Email" value="<?= $value->email ?>">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label for="jurusan">Jurusan</label>
									<select class="form-control" id="jurusan" name="jurusan[]">
										<?php foreach ($jurusan as $dt) : ?>
											<?php if ($dt == $value->jurusan) : ?>
												<option value="<?= $dt; ?>" selected><?= $dt; ?></option>
											<?php else : ?>
												<option value="<?= $dt; ?>"><?= $dt; ?></option>
											<?php endif; ?>
										<?php endforeach; ?>
									</select>
								</div>
							</div>
							
							<!-- <div class="col-sm-2">
								<div class="form-group">
									<button onclick="education_fields();" class="btn rounded-pill px-4 btn-light-success text-success font-weight-medium waves-effect waves-light mt-4" style="padding-top: 10px;" type="button">
										<i class="fa fa-plus-circle"></i>
									</button>
								</div>
							</div> -->
						</div>
					<?php } ?>
					<div id="education_fields" class="m-t-20"></div>
					<div class="col-sm-3">
						<button type="submit" class="btn btn-primary">Update Data</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
