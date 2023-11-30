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
				<a href="" class="btn btn-primary mb-3 float-right fa fa-plus-square" data-toggle="modal" data-target="#tambahModal"> Add New Menu</a>
				<div class="table-responsive">
					<table class="table table-hover" id="datatable">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Menu</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<?php $no = 1;
							foreach ($menu as $mn) { ?>
								<tr>
									<th scope="row"><?= $no++ ?></th>
									<td><?= $mn['menu'] ?></td>
									<td>
										<a href="javascript:void(0)" onclick="edit_data('<?= $mn['id'] ?>','<?= $mn['menu'] ?>')" class="badge badge-warning">edit</a>
										<a href="<?= base_url('menu/delete_menu/' . $mn['id']) ?>" class="badge badge-danger" onclick="return confirm('Apakah anda yakin hapus?');">delete</a>
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
<div class="modal fade" id="tambahModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="title">Add New Menu</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="<?= base_url('menu') ?>" method="post">
				<div class="modal-body">
					<div class="form-group">
						<input type="text" name="menu" class="form-control" id="menu" placeholder="Menu Name">
						<input type="hidden" name="id" class="form-control" id="id">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" id="btn_save">Add</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	function edit_data(id, menu) {
		$('#tambahModal').modal('show');
		$('#title').html('Edit Menu');
		$('#btn_save').html('Edit');
		// $('#btn_save').removeAttr("type").attr("type", "button");

		$('#id').val(id);
		$('#menu').val(menu);
	}
</script>
