<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">

				<h4 class="card-title"><?= $sub_judul1 ?>&nbsp;<?= $sub_judul ?>
					<button onclick="add_data()" class="btn btn-primary btn-sm float-right mb-3 fa fa-plus-square"> Tambah Data</button>
				</h4>
				<div class="table-responsive">
					<table class="table" id="dataTable_2">
						<thead>
							<tr> 
								<th scope="col">#</th>
								<th scope="col">Nama</th>
								<th scope="col">Nik</th>
								<th scope="col">Email</th>
								<th scope="col">Jurusan</th>
								<th scope="col" style="width: 110px;">Aksi</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal form -->
<div id="modal_form" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="POST" id="form">
				<div class="modal-header">
					<h4 class="modal-title">Form</h4>
				</div>
				<div class="modal-body">
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
					<input type="hidden" name="id" class="form-control" id="id">

					<!-- Add more fields as needed -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" onclick="save()" class="btn btn-primary float-right" data-dismiss="modal">Tambah Data</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		$('#dataTable_2').DataTable({
			"processing": true,
			"serverSide": true,
			"order"		: [],
			"ajax"		: {
				"url"	: "<?= base_url("crud/Crud_serverside_v3/get_data") ?>",
				"type"	: "POST"
			},
			"columnDefs": [{
				"target": [-1],
				"orderable":false
			}]
		});
	});
</script>
