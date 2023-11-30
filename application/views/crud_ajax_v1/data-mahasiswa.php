<table class="table table-bordered" id="Datatable_n">
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
		<?php $no = 1;
		foreach ($mahasiswa as $dt) { ?>
			<tr>
				<th scope="row"><?= $no++ ?></th>
				<td><?= $dt['nama'] ?></td>
				<td><?= $dt['nik'] ?></td>
				<td><?= $dt['email'] ?></td>
				<td><?= $dt['jurusan'] ?></td>
				<td>
					<button type="button" id_m="<?= $dt['id'] ?>" class="edit btn btn-warning btn-sm"><i class=" fa fa-edit"></i></button>
					<button type="button" id_m="<?= $dt['id'] ?>" class="hapus btn btn-danger btn-sm"><i class="fa fa-trash"></i></button>
				</td>
			</tr>
		<?php } ?>
	</tbody>
</table>


<!-- The Modal -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title" id="judul"></h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div id="tampil_modal">
					<!-- Data akan di tampilkan disini-->
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-light" data-dismiss="modal">Batal</button>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('#Datatable_n').DataTable();
	});

	$('.tambah').click(function() {
		var aksi = 'Tambah Mahasiswa';
		$.ajax({
			url: '<?= base_url(); ?>crud/crud_ajax_v1/tambah',
			method: 'post',
			data: {
				aksi: aksi
			},
			success: function(data) {
				$('#myModal').modal("show");
				$('#tampil_modal').html(data);
				document.getElementById("judul").innerHTML = 'Tambah Data';

			}
		});
	});

	$('.edit').click(function() {

		var id = $(this).attr("id_m");
		$.ajax({
			url: '<?= base_url(); ?>crud/crud_ajax_v1/edit',
			method: 'post',
			data: {
				id: id
			},
			success: function(data) {
				$('#myModal').modal("show");
				$('#tampil_modal').html(data);
				document.getElementById("judul").innerHTML = 'Edit Data';
			}
		});
	});

	$('.hapus').on('click',function(){

		var result = confirm("Want to delete?");
		if (result) {
			var id = $(this).attr("id_m");
			$.ajax({
				url: '<?= base_url('crud/crud_ajax_v1/hapus') ?>',
				method: 'post',
				data: {
					id: id
				},
				success: function(data) {
					$('#tampil').fadeOut(800, function() {
						$.ajax({
							type: 'POST',
							url: "<?= base_url('crud/crud_ajax_v1/tampilMahasiswa') ?>",
							cache: false,
							success: function(data2) {
								$("#tampil").html(data2).delay("fast").fadeIn();
							},
						});
					});
				}
			});
		}
	});
</script>
