<style>
	.row_n {
		display: flex;
	}
</style>
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<form method="POST" action="<?= base_url('crud/crud_multiple_v1/create') ?>" enctype="multipart/form-data">
					<div class="row_n">
						<div class="col-sm-3">
							<div class="form-group">
								<label for="">Nama</label>
								<input type="text" class="form-control" id="nama" name="nama[]" placeholder="Nama">
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-group">
								<label for="">Nik</label>
								<input type="text" class="form-control" id="nik" name="nik[]" placeholder="Nik">
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-group">
								<label for="">Email</label>
								<input type="text" class="form-control" id="email" name="email[]" placeholder="Email">
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label for="jurusan">Jurusan</label>
								<select class="form-control" id="jurusan" name="jurusan[]">
									<option value="Teknik Informatika">Teknik Informatika</option>
									<option value="Teknik Industri">Teknik Industri</option>
									<option value="Teknik Pangan">Teknik Pangan</option>
									<option value="Teknik Mesin">Teknik Mesin</option>
									<option value="Teknik Planologi">Teknik Planologi</option>
									<option value="Teknik Lingkungan">Teknik Lingkungan</option>
								</select>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-group">
								<button onclick="education_fields();" class="btn rounded-pill px-4 btn-light-success text-success font-weight-medium waves-effect waves-light mt-4" style="padding-top: 10px;" type="button">
									<i class="fa fa-plus-circle"></i>
								</button>
							</div>
						</div>
					</div>
					<div id="education_fields" class="m-t-20"></div>
					<div class="col-sm-3">
						<button type="submit" class="btn btn-primary">Tambah Data</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
