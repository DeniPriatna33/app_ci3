<div class="row">
	<div class="col-12">
		<div class="card mb-3 col-lg-8" style="max-width: 540px;">
			<div class="row no-gutters">
				<div class="col-md-4">
					<img src="<?= base_url('assets/images/profile/' . $user['image']) ?>" class="card-img">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title"><?= $user['name'] ?></h5>
						<p class="card-text"><?= $user['email'] ?></p>
						<p class="card-text"><small class="text-muted"><?= date('d F Y', strtotime($user['created_at'])) ?></small></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>