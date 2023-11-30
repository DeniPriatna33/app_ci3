<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<?= $this->session->flashdata('message'); ?>

				<h4 class="card-title"><?= $sub_judul ?></h4>
				<h5>Role : <?= $role['role'] ?></h5>
			</div>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Menu</th>
							<th scope="col">Access</th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 1;
						foreach ($menu as $mn) { ?>
							<tr>
								<th scope="row"><?= $no++ ?></th>
								<td><?= $mn['menu'] ?></td>
								<td>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" <?= check_access($role['id'], $mn['id']); ?> data-role="<?= $role['id']; ?>" data-menu="<?= $mn['id']; ?>">
									</div>
								</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>