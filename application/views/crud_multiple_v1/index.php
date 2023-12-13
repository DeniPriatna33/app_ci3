<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<!-- Alert -->
				<?php if ($this->session->flashdata('message')) { ?>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						Data mahasiswa<strong> berhasil</strong> <?= $this->session->flashdata('message');	?>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				<?php } ?>

				<h4 class="card-title"><?= $sub_judul1 ?>&nbsp;<?= $sub_judul ?>
					<a href="<?= base_url('crud/crud_multiple_v1/add') ?>" class="btn btn-primary btn-sm float-right mb-3 fa fa-plus-square"> Tambah Data</a>
					<button type="button" onclick="delete_all()" class="btn btn-danger btn-sm float-right mb-3 fa fa-trash-alt mr-1"> Delete All</button>
					<button type="button" onclick="edit_all()" class="btn btn-warning btn-sm float-right mb-3 fa fa-edit mr-1"> Edit All</button>
				</h4>
				<div class="table-responsive">
					<table class="table" id="dataTable_2">
						<thead>
							<tr>
								<th><input type="checkbox" id="check-all"></th>
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
					<button type="button" onclick="save()" class="btn btn-primary float-right" data-dismiss="modal">Update Data</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	var save_method;
	var dataTable;
	$(document).ready(function() {
		dataTable = $('#dataTable_2').DataTable({
			"processing": true,
			"serverSide": true,
			"ordering": false,
			"ajax": {
				url: "<?= base_url('crud/Crud_multiple_v1/get_records'); ?>",
				type: "POST"
			},
			"columns": [{
					"data": "0"
				},
				{
					"data": "1"
				},
				{
					"data": "2"
				},
				{
					"data": "3"
				},
				{
					"data": "4"
				},
				{
					"data": "5"
				},
				{
					"data": "6"
				},
				// Add more columns as needed
			]
		});

		$("#check-all").click(function() { // Ketika user men-cek checkbox all
			if ($(this).is(":checked")) {
				$(".check-item").prop("checked", true); // ceklis semua checkbox siswa dengan class "check-item"
			} else {
				$(".check-item").prop("checked", false); // un-ceklis semua checkbox siswa dengan class "check-item"
			}
		});

	});

	function click_check() {
		/*#Start Versi 1 Count cheked tidak 10 check-all false bila 10 check-all true (Limit 10 Serveside)
			if ($(".check-item:checkbox:checked").length != 10) {
				$("#check-all").prop("checked", false);
			}else{
				$("#check-all").prop("checked", true);
			}
			
		#END*/

		// Versi 2
		var nodes = dataTable.cells().nodes();
		var checked_pilih = $(nodes).find(".check-item:checkbox:checked").length;
		var checked_all = $(nodes).find(".check-item:checkbox").length;
		if (checked_pilih == checked_all) {
			$("#check-all").prop('checked', true);
		} else {
			$("#check-all").prop('checked', false);
		}
	}

	function edit_all() {
		if ($(".check-item").prop("checked") == true) {
			var id = $("input[name='id[]']:checked").map(function() {
				return $(this).val();
			}).get();


			window.location.href = "<?= base_url('crud/crud_multiple_v1/edit?id=') ?>" + id;
		} else {
			Swal.fire({
				title: "Edit All !",
				text: "Data belum dipilih!",
				icon: "warning"
			});
		}
	}

	function edit_data(id) {
		save_method = 'update';
		$('#form')[0].reset(); // Reset form on modals

		// Ajax Load data from ajax
		$.ajax({
			url: "<?= base_url('crud/Crud_multiple_v1/ajax_edit/') ?>/" + id,
			type: "GET",
			dataType: "JSON",
			success: function(data) {
				$('[name="id"]').val(data.id);
				$('[name="nama"]').val(data.nama);
				$('[name="nik"]').val(data.nik);
				$('[name="email"]').val(data.email);
				$('[name="jurusan"]').val(data.jurusan);
				// Add more fields as needed

				$('#modal_form').modal('show'); // Show modal dialog
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('Error get data from ajax');
			}
		});
	}

	function save() {
		var url;
		url = "<?= base_url('crud/Crud_multiple_v1/update') ?>";

		// Ajax adding data to database
		$.ajax({
			url: url,
			type: "POST",
			data: $('#form').serialize(),
			dataType: "JSON",
			success: function(data) {
				// If success close modal and reload DataTable
				$('#modal_form').modal('hide');
				dataTable.draw();
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('Error adding / updating data');
			}
		});
	}

	function delete_all() {
		if ($(".check-item").prop("checked") == true) {
			// Buat Dapeting data yang di pilih di checkbox (id) 
			var id = $("input[name='id[]']:checked").map(function() {
				return $(this).val();
			}).get();

			Swal.fire({
				title: "Are you sure?",
				text: "You won't be able to revert this!",
				icon: "warning",
				showCancelButton: true,
				confirmButtonColor: "#3085d6",
				cancelButtonColor: "#d33",
				confirmButtonText: "Yes, delete it!"
			}).then((result) => {
				if (result.isConfirmed) {

					$.ajax({
						url: "<?= base_url('crud/Crud_multiple_v1/delete_all') ?>",
						type: "POST",
						data: {
							id: id
						},
						dataType: "JSON",
						success: function(data) {
							dataTable.draw();
							Swal.fire({
								title: "Deleted!",
								text: data.message,
								icon: "success"
							});
						},
						error: function(jqXHR, textStatus, errorThrown) {
							alert('Error deleting data');
						}
					});
				}
			});
		} else {
			Swal.fire({
				title: "Deleted All !",
				text: "Data belum dipilih!",
				icon: "warning"
			});
		}

	}

	function delete_data(id) {
		Swal.fire({
			title: "Are you sure?",
			text: "You won't be able to revert this!",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#3085d6",
			cancelButtonColor: "#d33",
			confirmButtonText: "Yes, delete it!"
		}).then((result) => {
			if (result.isConfirmed) {

				$.ajax({
					url: "<?= base_url('crud/Crud_multiple_v1/delete') ?>",
					type: "POST",
					data: {
						id: id
					},
					dataType: "JSON",
					success: function(data) {
						// console.log(data.status);
						dataTable.draw();
						Swal.fire({
							title: "Deleted!",
							text: data.message,
							icon: "success"
						});
					},
					error: function(jqXHR, textStatus, errorThrown) {
						alert('Error deleting data');
					}
				});
			}
		});
	}
</script>
