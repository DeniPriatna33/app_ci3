<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">

				<h4 class="card-title"><?= $sub_judul1 ?>&nbsp;<?= $sub_judul ?>
					<a href="<?= base_url('crud/crud_v2/add') ?>" class="btn btn-primary btn-sm float-right mb-3"><i class="fa fa-plus"> Tambah Data</i></a>
				</h4>
			
				<div class="table-responsive">
					<table class="table" id="datatable">
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
							<?php $no=1;
							foreach ($mahasiswa as $dt) { ?>
								<tr>
									<th scope="row"><?= $no++ ?></th>
									<td><?= $dt['nama'] ?></td>
									<td><?= $dt['nik'] ?></td>
									<td><?= $dt['email'] ?></td>
									<td><?= $dt['jurusan'] ?></td>
									<td>
										<a href="<?= base_url('crud/crud_v2/edit/') . $dt['id'] ?>" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>
										<a href="<?= base_url('crud/crud_v2/delete/') . $dt['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin Hapus!')"><i class="fa fa-trash"></i></a>
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
