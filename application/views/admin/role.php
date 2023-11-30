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
				<a href="" class="btn btn-primary" data-toggle="modal" data-target="#tambahRoleModal">Add New Role</a>
			</div>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Role</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 1;
						foreach ($role as $r) { ?>
							<tr>
								<th scope="row"><?= $no++ ?></th>
								<td><?= $r['role'] ?></td>
								<td>
									<a href="<?= base_url('admin/role_access/') . $r['id'] ?>" class="badge badge-info">access</a>
									<a href="" class="badge badge-warning">edit</a>
									<a href="<?= base_url('menu/delete_role/') . $r['id'] ?>" class="badge badge-danger" onclick="return confirm('Apakah anda yakin hapus?');">delete</a>
								</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="tambahRoleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add New Menu</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="<?= base_url('admin/role') ?>" method="post">
				<div class="modal-body">
					<div class="form-group">
						<input type="text" name="role" class="form-control" id="Role" placeholder="Role Name">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Add</button>
				</div>
			</form>
		</div>
	</div>
</div>