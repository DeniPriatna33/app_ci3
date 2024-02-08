<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title"><?= $sub_judul1 ?>&nbsp;<?= $sub_judul ?>
					<button onclick="add_data()" class="btn btn-primary btn-sm float-right mb-3 fa fa-plus-square"> Tambah Data</button>
				</h4>
				<div class="table-responsive">
					<table class="table" id="Datatable">
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
						<div class="invalid-feedback"></div>
					</div>
					<div class="form-group">
						<label for="nik">NIK</label>
						<input type="text" name="nik" class="form-control" id="nik">
						<div class="invalid-feedback"></div>
					</div>
					<div class="form-group">
						<label for="email">Email</label>
						<input type="text" name="email" class="form-control" id="email">
						<div class="invalid-feedback"></div>
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
						<div class="invalid-feedback"></div>
					</div>
					<input type="hidden" name="id" class="form-control" id="id">

					<!-- Add more fields as needed -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" onclick="save()" class="btn btn-primary float-right btn-save" >Tambah Data</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	var Datatable;
	var save_method;
	$(document).ready(function(){
		Datatable = $('#Datatable').DataTable({
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

	function add_data() {
		save_method = 'add';
		$('#form')[0].reset();	
		$('#modal_form').modal('show');
		$('.modal-title').text('Tambah Data');
	}

	function message(icon, text) {
		Swal.fire({
			icon: icon,
			title: 'Berhasil',
			text: text,
			showConfirmButton: false,
			timer: 1500
		});
	}
	function save() {
		$('.btn-save').text('Mohon Tunggu...');
		$('.btn-save').attr('disabled',true);
		var url;
		if(save_method == 'add') {
			url = "<?= base_url('crud/Crud_serverside_v3/add') ?>";
		} else {
			url = "<?= base_url('crud/Crud_serverside_v3/update') ?>";
		}
		$.ajax({
			url: url,
			type: "POST",
			data: $('#form').serialize(),
			dataType: "JSON",
			success: function(data) {
				if(data.status == true) { // Jika sukses
					$('#modal_form').modal('hide');
					Datatable.draw(); // Memuat ulang data pada DataTable
					if (save_method == 'add') {
						message('success','Data berhasil ditambahkan');
					}else{
						message('success','Data berhasil diubah');
					}
				}else{
					for (var i = 0; i < data.inputerror.length; i++) {
						$('input[name="'+data.inputerror[i]+'"]').addClass('is-invalid');
						$('input[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]);	
					}
				}
				$('.btn-save').text('Tambah Data'); // Mengubah teks tombol kembali ke semula
				$('.btn-save').attr('disabled',false); // Mengaktifkan kembali tombol tambah data
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('Error adding / update data');
				$('.btn-save').text('Tambah Data'); // Mengubah teks tombol kembali ke semula
				$('.btn-save').attr('disabled',false); // Mengaktifkan kembali tombol tambah data
			}
		});
		
	}

	function edit_data(id,type) {
		if (type == 'edit') {
			save_method = 'update';
			$('#form')[0].reset(); // reset form on modals
			$('.form-group').removeClass('has-error'); // clear error class
			$('.help-block').empty(); // clear error string
		}

		//Load data dari ajax
		$.ajax({
			url : "<?= base_url('crud/Crud_serverside_v3/byid/') ?>" + id,
			type: "POST",
			dataType: "JSON",
			success: function(data) {
				if (data.status == true) {
					data1 = data.data;
					$('#form').find('input').removeClass('is-valid');
					$('[name="id"]').val(data1.id);
					$('[name="nama').val(data1.nama);
					$('[name="nik"]').val(data1.nik);
					$('[name="email"]').val(data1.email);
					$('[name="jurusan"]').val(data1.jurusan);
				}
				$('#modal_form').modal('show'); // show bootstrap modal when complete loaded
				$('.modal-title').text('Edit Data'); // Set title to Bootstrap modal title
			},
			error: function (jqXHR, textStatus, errorThrown) {
				message('info','sever ada gangguan, mohon hubungi IT');
			}
		});
	}

	function delete_data(id) {
		swal.fire({
			title: 'Apakah Anda yakin?',
			text: 'Anda tidak akan dapat mengembalikan data ini!',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Ya, hapus data!'
		}).then((result) => {
			if (result.isConfirmed) {
				$.ajax({
					url : "<?= base_url('crud/Crud_serverside_v3/delete/') ?>" + id,
					type: "POST",
					dataType: "JSON",
					success: function(data) {
						if(data.status) {
							message('success','Data berhasil di delete');
							Datatable.draw();
						} else {
							message('info','Gagal di delete');
						}
					},
					error: function(jqXHR, textStatus, errorThrown) {
						message('info','sever ada gangguan, mohon hubungi IT');
					}
				});
			}
		});
	}

	
</script>
