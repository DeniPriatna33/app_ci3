<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<?= form_error(
					'menu',
					'<div class="alert alert-danger"> <i class="ti-user"></i> 
					<button type="button" class="close"> <span aria-hidden="true">×</span> </button>',
					'</div>'
				) ?>

				<?= $this->session->flashdata('message'); ?>

				<h4 class="card-title"><?= $sub_judul ?></h4>
				<a href="JavaScript:void(0)" class="btn btn-primary float-right mb-3 fa fa-plus-square" data-toggle="modal" data-target="#tambahSubModal"> Add New SubMenu</a>
				
				<div class="table-responsive">
					<table class="table table-hover" id="datatable">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Title</th>
								<th scope="col">Menu</th>
								<th scope="col">Url</th>
								<th scope="col">Ico</th>
								<th scope="col">Urutan</th>
								<th scope="col">Active</th>
								<th scope="col" style="width: 110px;">Action</th>
							</tr>
						</thead>
						<tbody>
							<?php $no = 1;
							foreach ($subMenu as $sm) { ?>
								<tr>
									<th scope="row"><?= $no++ ?></th>
									<td><?= $sm['title'] ?></td>
									<td><?= $sm['menu'] ?></td>
									<td><?= $sm['url'] ?></td>
									<td><?= $sm['icon'] ?></td>
									<td><?= $sm['urutan'] ?></td>
									<td><?= $sm['is_active'] ?></td>
									<td>
										<button type="button" onclick="edit_data('<?= $sm['id'] ?>')" class="btn btn-warning btn-xs fa fa-edit">edit</button>
										<a href="<?= base_url('menu/delete_submenu/' . $sm['id']) ?>" class="btn btn-danger btn-xs fa fa-trash-alt" onclick="return confirm('Apakah anda yakin hapus?');"> delete</a>
									</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="tambahSubModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add New Menu</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="form">
				<div class="modal-body">
					<div class="form-group">
						<input type="hidden" class="form-control" id="id" name="id">
						<input type="text" class="form-control" id="title" name="title" placeholder="Submenu title">
					</div>
					<div class="form-group">
						<select name="menu_id" id="menu_id" class="form-control">
							<option value="">Select Menu</option>
							<?php foreach ($menu as $m) : ?>
								<option value="<?= $m['id']; ?>"><?= $m['menu']; ?></option>
							<?php endforeach; ?>
						</select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="url" name="url" placeholder="Submenu url">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="icon" name="icon" placeholder="Submenu icon">
					</div>
					<div class="form-group">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="1" name="is_active" id="is_active" checked>
							<label class="form-check-label" for="is_active">
								Active?
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="number" class="form-control" id="urutan" name="urutan" placeholder="Masukan Urutan">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" onclick="save()" class="btn btn-primary float-right">Tambah Data</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	var save_method; // For save method string
	function edit_data(id) {
		save_method = 'update';
		$('#form')[0].reset(); // Reset form on modals
		$.ajax({
			url: '<?= base_url('menu/read_id'); ?>',
			type: 'POST',
			data: {
				id: id
			},
			dataType: 'json',
			success: function(response) {
				$('#tambahSubModal').modal('show');
				$('#id').val(response.id);
				$('#title').val(response.title);
				$('#menu_id').val(response.menu_id);
				$('#url').val(response.url);
				$('#icon').val(response.icon);
				$('#is_active').val(response.is_active);
				$('#urutan').val(response.urutan);
				// Set values for other fields
			}
		});
	}

	function save() {
		var url;
		if (save_method == 'update') {
			url = "<?= base_url('menu/update_sub_menu') ?>";
		} else {
			url = "<?= base_url('menu/tambah_sub_menu') ?>";
		}

		// Ajax adding data to database
		$.ajax({
			url: url,
			type: "POST",
			data: $('#form').serialize(),
			dataType: "JSON",
			success: function(data) {
				// If success close modal and reload DataTable
				$('#tambahSubModal').modal('hide');
				location.reload();
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('Error adding / updating data');
			}
		});
	}
</script>
