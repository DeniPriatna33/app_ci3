<div class="page-breadcrumb">
	<div class="row">
		<div class="col-5 align-self-center">
			<h4 class="page-title"><?= $sub_judul ?></h4>
		</div>
		<div class="col-7 align-self-center">
			<div class="d-flex align-items-center justify-content-end">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
							<a href="#"><?= $sub_judul ?></a>
						</li>
						<li class="breadcrumb-item active" aria-current="page"><?= $sub_judul1 ?></li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- End Bread crumb and right sidebar toggle -->
<div class="container-fluid">
	<!-- Start Page Content -->
	<?php
	if ($isi) {
		$this->load->view($isi);
	}
	?>
</div>
