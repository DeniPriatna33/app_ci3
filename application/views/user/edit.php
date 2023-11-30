<div class="row">
	<div class="col-md-10">
		<?= $this->session->flashdata('message') ?>
		<div class="card">
			<div class="card-body">
				<form action="<?= base_url('user/edit') ?>" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label for="email" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-10">
							<input type="text" name="email" class="form-control" id="email" value="<?= $user['email'] ?>" readonly>
							<?= form_error('email', '<small class="text-danger">', '</small>') ?>

						</div>
					</div>
					<div class="form-group row">
						<label for="name" class="col-sm-2 col-form-label">Full Name</label>
						<div class="col-sm-10">
							<input type="text" name="name" class="form-control" id="name" value="<?= $user['name'] ?>">
							<?= form_error('name', '<small class="text-danger">', '</small>') ?>

						</div>
					</div>
					<div class="form-group row">
						<label for="image" class="col-sm-2 col-form-label">Picture</label>
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-3">
									<img src="<?= base_url('assets/images/profile/') . $user['image']; ?>" class="img-thumbnail">
								</div>
								<div class="col-sm-9">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="image" name="image">
										<label class="custom-file-label" for="image">Choose file</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row justify-content-end">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">Edit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>