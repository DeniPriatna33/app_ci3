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
					<button type="button" onclick="tambah_data()" class="btn btn-primary btn-sm float-right mb-3 fa fa-plus-square"> Tambah Data</button>
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
<div id="modal_form" class="modal fade modal-fullscreen" role="dialog" >
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="POST" id="form">
				<div class="modal-header">
					<h4 class="modal-title" id="title_modal">Form Tambah</h4>
				</div>
				<div class="modal-body">
				<div class="row_n" id="tambah_all">
						<div class="col-sm-3">
							<div class="form-group">
								<label for="">Nama</label>
								<input type="text" class="form-control" id="nama" name="nama[]" placeholder="Nama">
								<input type="hidden" class="form-control" id="" name="id[]" placeholder="id" value="">
								<input type="hidden" class="form-control" id="" name="type[]" placeholder="type" value="tambah">
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
								<label for="jurusan">Jurusan</label><br>
								<select class="form-control select2" id="jurusan" name="jurusan[]" style="width: 100%;">
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
					<div class="ml-2">
						<button type="button" class="btn btn-default " data-dismiss="modal">Cancel</button>
						<button type="button" id="btn_save_update" onclick="save()" class="btn btn-primary " data-dismiss="modal">Tambah Data</button>
					</div>
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
				url: "<?= base_url('crud/Crud_multiple_v2/get_records'); ?>",
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

	function tambah_data(){
		save_method = 'save';
		$('#modal_form').modal('show');
		$('#form')[0].reset(); // Reset form on modals
		$('#title_modal').text('Form Tambah Data');
		$('#btn_save_update').text('Tambah Data');
	}

	function save() {
		var url;

		data = $('#form').serialize();
		console.log(data);

		if (save_method == 'save') {
			url = "<?= base_url('crud/Crud_multiple_v2/create_all') ?>";
		}else{
			url = "<?= base_url('crud/Crud_multiple_v2/update_all') ?>";
		}

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

	function click_check() {
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
		save_method = 'edit';
		if ($(".check-item").prop("checked") == true) {
			data = $(".check-item:checked").map(function() {
				return {
					id: $(this).attr("data-id"),
					nama: $(this).attr("data-nama"),
					nik: $(this).attr("data-nik"),
					email: $(this).attr("data-email"),
					jurusan: $(this).attr("data-jurusan"),
				}
			}).get();

			$.ajax({
				type: "POST",
				url: "<?= base_url('crud/crud_multiple_v2/edit_all') ?>",
				data: {
					data:data
				},
				dataType: "json",
				success: function (response) {
					let html = '';
					let select = '';
					let val = '';

					jurusan = response.jurusan;
					data = response.data;
					var count = 0
					jurusan.forEach(function(val_2){
						count++;
						select += '<option value="'+val_2+'">'+val_2+'</option>';
						if(count === jurusan.length) {
							
							data.forEach(function(val,key){
								html += '<div class="row_n">'+
									'<div class="col-sm-3">'+
									'	<div class="form-group">'+
									'		<label for="">Nama</label>'+
									'		<input type="text" class="form-control" id="nama" name="nama[]" placeholder="Nama" value="'+val.nama+'">'+
									'		<input type="hidden" class="form-control" id="" name="id[]" placeholder="id" value="'+val.id+'">'+
									'		<input type="hidden" class="form-control" id="" name="type[]" placeholder="type" value="edit">'+
									'	</div>'+
									'</div>'+
									'<div class="col-sm-2">'+
									'	<div class="form-group">'+
									'		<label for="">Nik</label>'+
									'		<input type="text" class="form-control" id="nik" name="nik[]" placeholder="Nik" value="'+val.nik+'">'+
									'	</div>'+
									'</div>'+
									'<div class="col-sm-2">'+
									'	<div class="form-group">'+
									'		<label for="">Email</label>'+
									'		<input type="text" class="form-control" id="email" name="email[]" placeholder="Email" value="'+val.email+'">'+
									'	</div>'+
									'</div>'+
									'<div class="col-sm-3">'+
									'	<div class="form-group">'+
									'		<label for="jurusan">Jurusan</label><br>'+
									'		<select id_row="'+val.id+'" jurusan_row="'+val.jurusan+'" class="form-control  pilih1" id="" name="jurusan[]" style="width: 100%;">'+
												select +
									'		</select>'+
									'	</div>'+
									'</div>'+
								'</div>'
							});
							if (response.length <= 0) {
								html = "";
							}

							
							$('#tambah_all').hide();			
							$("#education_fields").html(html);
							$('.pilih1').map(function() {
								$(this).val($(this).attr('jurusan_row'));
								$(this).select2();
							});
						}
					});					
				}
			});
			
			
			$('#modal_form').modal('show'); 
			$('#form')[0].reset(); // Reset form on modals
	
		} else {
			Swal.fire({
				title: "Edit All !",
				text: "Data belum dipilih!",
				icon: "warning"
			});
		}
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
