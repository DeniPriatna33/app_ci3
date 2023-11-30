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
					<table class="table table-bordered" id="Datatable_n">
						<thead>
							<tr>
								<th scope="col" style="width: 5px;">#</th>
								<th scope="col">Nama</th>
								<th scope="col">Nik</th>
								<th scope="col">Email</th>
								<th scope="col">Jurusan</th>
								<th scope="col" style="width: 110px;">Aksi</th>
							</tr>
						</thead>
						<tbody id="dataBody">
							<!-- Data will be populated dynamically -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Create Modal -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Form</h4>
			</div>
			<div class="modal-body">

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
					<input type="hidden" name="id" class="form-control" id="id">
					<button type="submit" class="btn btn-primary float-right">Tambah Data</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	// Handle form submission

	$(document).ready(function() {
		// Load initial data
		loadData();

		// Load data from the server
		function loadData() {
			$.ajax({
				url: '<?= base_url('crud/crud_ajax_v2/read'); ?>',
				type: 'POST',
				dataType: 'json',
				beforeSend: function() {
					$('#Datatable_n').DataTable().destroy();
				},
				success: function(response) {
					var html = '';
					$.each(response, function(index, item) {
						index++;
						html += '<tr>';
						html += '<td >' + index + '</td>';
						html += '<td>' + item.nama + '</td>';
						html += '<td>' + item.nik + '</td>';
						html += '<td>' + item.email + '</td>';
						html += '<td>' + item.jurusan + '</td>';
						html += '<td>';
						html += '<button class="btn btn-sm btn-primary mr-1 fa fa-edit editBtn" data-id="' + item.id + '"> Edit</button>';
						html += '<button class="btn btn-sm btn-danger fa fa-trash-alt deleteBtn" data-id="' + item.id + '"> Delete</button>';
						html += '</td>';
						html += '</tr>';
					});
					$('#dataBody').html(html);
					$('#Datatable_n').DataTable();
				}
			});
		}


		$('#form').on('submit', function(e) {
			e.preventDefault();
			var formData = $(this).serialize();
			$.ajax({
				url: '<?= base_url('crud/crud_ajax_v2/save_data'); ?>',
				type: 'POST',
				data: formData,
				dataType: 'json',
				success: function(response) {
					if (response.status) {
						$('#myModal').modal('hide');
						alert(response.message);
						loadData();
						$('#form')[0].reset();
					} else {
						alert(response.message);
					}
				}
			});
		});



		// Handle edit button click
		$(document).on('click', '.editBtn', function() {
			var id = $(this).data('id');
			$.ajax({
				url: '<?php echo base_url('crud/crud_ajax_v2/read_id'); ?>',
				type: 'POST',
				data: {
					id: id
				},
				dataType: 'json',
				success: function(response) {
					$('#myModal').modal('show');
					$('#id').val(response.id);
					$('#nama').val(response.nama);
					$('#nik').val(response.nik);
					$('#email').val(response.email);
					$('#jurusan').val(response.jurusan);
					// Set values for other fields
				}
			});
		});

		// Handle update button click
		$('#updateBtn').click(function() {
			var id = $('#editId').val();
			var formData = $('#editForm').serialize();
			$.ajax({
				url: '<?php echo base_url('CrudController/update'); ?>',
				type: 'POST',
				data: formData,
				dataType: 'json',
				success: function(response) {
					if (response.status) {
						alert(response.message);
						loadData();
						$('#editModal').modal('hide');
					} else {
						alert(response.message);
					}
				}
			});
		});

		// Handle delete button click
		$(document).on('click', '.deleteBtn', function() {
			var id = $(this).data('id');
			if (confirm('Are you sure you want to delete this record?')) {
				$.ajax({
					url: '<?= base_url('crud/crud_ajax_v2/delete'); ?>',
					type: 'POST',
					data: {
						id: id
					},
					dataType: 'json',
					success: function(response) {
						if (response.status) {
							alert(response.message);
							loadData();
						} else {
							alert(response.message);
						}
					}
				});
			}
		});


	});
</script>
