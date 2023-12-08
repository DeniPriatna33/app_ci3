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
					<a href="<?= base_url('crud/crud_multiple_v1/add') ?>" class="btn btn-primary btn-sm float-right mb-3 fa fa-plus-square"> Tambah Data</a>
				</h4>
				<div class="table-responsive">
					<table class="table" id="dataTable_2">
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

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	var dataTable
	$(document).ready(function() {
		dataTable = $('#dataTable_2').DataTable({
			"processing": true,
			"serverSide": true,
			"ajax": {
				url: "<?= base_url('crud/Crud_multiple_v1/get_records'); ?>",
				type: "POST"
			},
			"columns": [{
					"data": "0"
				},
				{
					"data": "1"
				},
				{
					"data": "2"
				},
				{
					"data": "3"
				},
				{
					"data": "4"
				},
				{
					"data": "5"
				}
				// Add more columns as needed
			]
		});
	});

	function delete_data(id) {
		Swal.fire({
			title: "Are you sure?",
			text: "You won't be able to revert this!",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#3085d6",
			cancelButtonColor: "#d33",
			confirmButtonText: "Yes, delete it!"
		}).then((result) => {
			if (result.isConfirmed) {

				$.ajax({
					url: "<?= base_url('crud/Crud_multiple_v1/delete') ?>",
					type: "POST",
					data: {
						id: id
					},
					dataType: "JSON",
					success: function(data) {
						dataTable.draw();
						Swal.fire({
							title: "Deleted!",
							text: "Your file has been deleted.",
							icon: "success"
						});
					},
					error: function(jqXHR, textStatus, errorThrown) {
						alert('Error deleting data');
					}
				});
			}
		});
		// if (confirm('Are you sure to delete this data?')) {

		// }
	}
</script>
