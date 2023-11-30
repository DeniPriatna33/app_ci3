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
					<a href="<?= base_url('crud/crud_v1/add') ?>" class="btn btn-primary btn-sm float-right mb-3"><i class="fa fa-plus"> Tambah Data</i></a>
				</h4>
				<div style="float: left;">
					<form action="" method="post">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="Cari data mahasiswa.." name="keyword" autocomplete="off" autofocus>
							<div class="input-group-append">
								<input class="btn btn-primary " type="submit" name="submit"></input>
							</div>
						</div>
					</form>
				</div>
				<div class="table-responsive">
					<h5>Result : <?= $total_rows ?></h5>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nama</th>
								<th scope="col">Nik</th>
								<th scope="col">Email</th>
								<th scope="col">Jurusan</th>
								<th scope="col">Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php if (empty($mahasiswa)) { ?>
								<tr>
									<td colspan="5" class="text-center">Data Not Found</td>
								</tr>
							<?php } ?>
							<?php
							foreach ($mahasiswa as $dt) { ?>
								<tr>
									<th scope="row"><?= ++$start ?></th>
									<td><?= $dt['nama'] ?></td>
									<td><?= $dt['nik'] ?></td>
									<td><?= $dt['email'] ?></td>
									<td><?= $dt['jurusan'] ?></td>
									<td>
										<a href="<?= base_url('crud/crud_v1/update/') . $dt['id'] ?>" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>
										<a href="<?= base_url('crud/crud_v1/delete_data/') . $dt['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin Hapus!')"><i class="fa fa-trash"></i></a>
										<a href="<?= base_url('crud/crud_v1/show/') . $dt['id'] ?>" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
									</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
					<?= $this->pagination->create_links(); ?>
				</div>
			</div>
		</div>
	</div>
</div>
