var room = 1;

function education_fields() {
	room++;
    var objTo = document.getElementById('education_fields')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "form-group removeclass" + room);
    var rdiv = 'removeclass' + room;
	divtest.innerHTML = '<div class="row_n ">'+
					'<div class="col-sm-3">'+
					'	<div class="form-group">'+
					'		<input type="text" class="form-control" id="nama" name="nama[]" placeholder="Nama">'+
					'	</div>'+
					'</div>'+
					'<div class="col-sm-2">'+
					'	<div class="form-group">'+
					'		<input type="text" class="form-control" id="nik" name="nik[]" placeholder="Nik">'+
					'	</div>'+
					'</div>'+
					'<div class="col-sm-2">'+
					'	<div class="form-group">'+
					'		<input type="text" class="form-control" id="email" name="email[]" placeholder="Email">'+
					'	</div>'+
					'</div>'+
					'<div class="col-sm-3">'+
					'	<div class="form-group">'+
					'		<select class="form-control" id="jurusan_'+room+'" name="jurusan[]">'+
					'			<option value="Teknik Informatika">Teknik Informatika</option>'+
					'			<option value="Teknik Industri">Teknik Industri</option>'+
					'			<option value="Teknik Pangan">Teknik Pangan</option>'+
					'			<option value="Teknik Mesin">Teknik Mesin</option>'+
					'			<option value="Teknik Planologi">Teknik Planologi</option>'+
					'			<option value="Teknik Lingkungan">Teknik Lingkungan</option>'+
					'		</select>'+
					'	</div>'+
					'</div>'+
					'<div class="col-sm-2">'+
					'	<div class="form-group">'+
					'		<button class="btn btn-danger" type="button" onclick="remove_education_fields(' + room + ');"><i class="fa fa-minus"></i></button>'+
					'	</div>'+
					'</div>'+
				'</div>' 
    objTo.appendChild(divtest);
	$('#jurusan_'+room+'').select2();
}

function remove_education_fields(rid) {
    $('.removeclass' + rid).remove();
}
