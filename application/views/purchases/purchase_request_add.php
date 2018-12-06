
<div class="page-bar">
  <?php echo $this->breadcrumb->show() ?>

                     
					   </div>
					   <div class='row'>
					   	<div class='col-md-12'>
				 <div class="portlet">
				  <div id="info"></div>
				<div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-shopping-cart"></i>List Purchase Request </div>
                                      
                                    </div>
     <div class="portlet-body">
	  
                                            <div class="form-body">
                                        <div class="table-scrollable">
										
			<table class="table table-striped table-hover" id="TabelTransaksi">
						<thead>
						<tr class='w3-blue'>
							<th>#</th>
							<th>BARANG</th>
							<th>JUMLAH</th>
							<th>SATUAN</th>
							<th>OPSI</th>
						
						</tr>
						</thead>

						<tbody >
						</tbody>
						
					</table>
				

					</DIV></DIV>
					 <div class="form-actions right">
						<button id='BarisBaru' class='btn btn-default pull-left'><i class='fa fa-plus fa-fw'></i> Baris Baru (F7)</button>
						
					</div></div></div></div>
					

				</div>
				 <div class='row'>
				 
				 <div class='col-md-12'>
				   <div class='portlet light'>
                                    <div class='portlet-body form'>
									
									<form action="<?php echo base_url();?>purchases/purchase_request_simpan" class="form-horizontal"  method="post" id="form_sample_1"  accept-charset="utf-8">
									<div class='form-body'>
									<div class="row">
									 <div class='col-md-6'>
									 <div class='form-group'>
                                                    <label >Keterangan</label>
                                                
                   <textarea class="form-control" name="keterangan" id="keterangan"></textarea>
					 
												
                                                </div>
									 </div>
									 <div class='col-md-6'>
        <div class='form-group'>
            <label class='col-md-3 control-label'>PR No</label>
                <div class='col-md-9'>													
                  <input type='text'  id="pr_no" name="pr_no" value="<?php echo $kodeunik; ?>"  class='form-control'>
				 </div>
         </div>
        <div class='form-group'>
                <label class='col-md-3 control-label'>PR Date</label>
                      <div class='col-md-9'>
       <input type='text' value="<?php echo date('Y-m-d'); ?>" id="tgl_pr" name="tgl_pr"  class='form-control dp'>
            </div>
        </div>
  
											</div>
											</div>
											</div>
											<div class='form-actions'>
											<div class='row'>
											<button class='btn sbold blue' type="submit" style='width:100%;'  id='SimpanTransaksi' ><i class='fa fa-cart-plus'></i> Simpan</button>
											</div>
											</div>
										</div>
									</form>
					</div>
				
					
				</div>
			</div>
		
			

<script>
$(document).ready(function(){
$(".dp").datepicker({
							dateFormat : "yy-mm-dd",
							showAnim : "fold"
						});
	for(B=1; B<=1; B++){
		BarisBaru();
	}

	$('#BarisBaru').click(function(){
		BarisBaru();
	});

	$("#TabelTransaksi tbody").find('input[type=text],textarea,select').filter(':visible:first').focus();
});

function BarisBaru()
{
	var Nomor = $('#TabelTransaksi tbody tr').length + 1;
	var Baris = "<tr>";
		Baris += "<td>"+Nomor+"</td>";
		Baris += "<td>";
			Baris += " <input type='text' class='form-control' name='kode_barang[]' id='kode_barang' placeholder='Ketik Kode / Nama Barang'></div>";
			Baris += "<div id='hasil_pencarian'>";
		Baris += "</td>";

		Baris += "<td><input type='text' class='form-control' id='jumlah_beli' name='jumlah_beli[]' onkeypress='return check_int(event)' ></td>";

		Baris += "<td><select name='id_satuan[]' class='form-control' id='id_satuan' onchange='Pilih("+Nomor+",value)' ><option value=''>Pilih Satuan</option>";
		<?php
		foreach($user as $u) { ?>
		Baris += "<option value='<?php echo $u->nama_satuan; ?>'><?php echo $u->nama_satuan; ?></option>";
		<?php
		}
		?>
		Baris += "</select><input type='hidden' id='satuan"+Nomor+"' name='satuan[]'></td>";
		Baris += "<td><button class='btn btn-default' id='HapusBaris'><i class='fa fa-times' style='color:red;'></i></button></td>";
		Baris += "</tr>";

	$('#TabelTransaksi tbody').append(Baris);

	$('#TabelTransaksi tbody tr').each(function(){
		$(this).find('td:nth-child(2) input').focus();
	});


}

$(document).on('click', '#HapusBaris', function(e){
	e.preventDefault();
	$(this).parent().parent().remove();

	var Nomor = 1;
	$('#TabelTransaksi tbody tr').each(function(){
		$(this).find('td:nth-child(1)').html(Nomor);
		Nomor++;
	});

	HitungTotalBayar();
});

function AutoCompleteGue(Lebar, KataKunci, Indexnya)
{
	$('div#hasil_pencarian').hide();
	var Lebar = Lebar + 25;

	var Registered = '';
	$('#TabelTransaksi tbody tr').each(function(){
		if(Indexnya !== $(this).index())
		{
			if($(this).find('td:nth-child(2) input').val() !== '')
			{
				Registered += $(this).find('td:nth-child(2) input').val() + ',';
			}
		}
	});
	if(Registered !== ''){
		Registered = Registered.replace(/,\s*$/,"");
	}
	$.ajax({
		url: "<?php echo site_url('penjualan/ajax_kode'); ?>",
		type: "POST",
		cache: false,
		data:'keyword=' + KataKunci + '&registered=' + Registered,
		dataType:'json',
		success: function(json){
			if(json.status == 1)
			{
				$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(2)').find('div#hasil_pencarian').css({ 'width' : Lebar+'px' });
				$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(2)').find('div#hasil_pencarian').show('fast');
				$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(2)').find('div#hasil_pencarian').html(json.datanya);
			}
			
		}
	});

	HitungTotalBayar();
}

$(document).on('keydown', '#kode_barang', function(e){

		
	if($("#kode_barang").val() !== '')
	{
			var charCode = e.which || e.keyCode;
		if(charCode == 40)
		{
			if($('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian li.autocomplete_active').length > 0)
			{
				var Selanjutnya = $('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian li.autocomplete_active').next();
				$('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian li.autocomplete_active').removeClass('autocomplete_active');

				Selanjutnya.addClass('autocomplete_active');
			}
			else
			{
				$('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian li:first').addClass('autocomplete_active');
			}
		} 
		else if(charCode == 38)
		{
			if($('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian li.autocomplete_active').length > 0)
			{
				var Sebelumnya = $('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian li.autocomplete_active').prev();
				$('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian li.autocomplete_active').removeClass('autocomplete_active');
			
				Sebelumnya.addClass('autocomplete_active');
			}
			else
			{
				$('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian li:first').addClass('autocomplete_active');
			}
		}
			else if(charCode == 13)
		{

	var Indexnya   = $(this).parent().parent().parent().parent().index();
	var NamaBarang = $(this).find('span#barangnya').html();
	var Harganya   = $(this).find('span#harganya').html();
    $('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(2)').find('div#hasil_pencarian').hide();
	var IndexIni = Indexnya + 1;
	var TotalIndex = $('#TabelTransaksi tbody tr').length;
	if(IndexIni == TotalIndex){
		BarisBaru();
		$('html, body').animate({ scrollTop: $(document).height() }, 0);
	}
	else {
		$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(5) input').focus();
	}

	

			
		}
		else 
		{
			AutoCompleteGue($(this).width(), $(this).val(), $(this).parent().parent().index());
		}
	}
	else
	{
		$('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian').hide();
	}

	<!-- HitungTotalBayar(); -->
});

$(document).on('click', '#daftar-autocomplete li', function(){
	$(this).parent().parent().parent().find('input').val($(this).find('span#barangnya').html());
	
	var Indexnya = $(this).parent().parent().parent().parent().index();
	var NamaBarang = $(this).find('span#barangnya').html();
	var Harganya = $(this).find('span#harganya').html();
$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(2)').find('div#hasil_pencarian').hide();

	var IndexIni = Indexnya + 1;
	var TotalIndex = $('#TabelTransaksi tbody tr').length;
	if(IndexIni == TotalIndex){
		BarisBaru();
		$('html, body').animate({ scrollTop: $(document).height() }, 0);
	}
	else {
		$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(5) input').focus();
	}

	HitungTotalBayar();
});

$(document).on('keyup', '#jumlah_beli', function(){
	var Indexnya = $(this).parent().parent().index();
	var Harga = $('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(4) input').val();
	var JumlahBeli = $(this).val();
	var KodeBarang = $('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(2) input').val();

	$.ajax({
		url: "<?php echo site_url('barang/cek-stok'); ?>",
		type: "POST",
		cache: false,
		data: "kode_barang="+encodeURI(KodeBarang)+"&stok="+JumlahBeli,
		dataType:'json',
		success: function(data){
			if(data.status == 1)
			{
				var SubTotal = parseInt(Harga) * parseInt(JumlahBeli);
				if(SubTotal > 0){
					var SubTotalVal = SubTotal;
					SubTotal = to_rupiah(SubTotal);
				} else {
					SubTotal = '';
					var SubTotalVal = 0;
				}

				$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(6) input').val(SubTotalVal);
				$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(6) span').html(SubTotal);
				HitungTotalBayar();
			}
			if(data.status == 0)
			{
				$('.modal-dialog').removeClass('modal-lg');
				$('.modal-dialog').addClass('modal-sm');
				$('#ModalHeader').html('Oops !');
				$('#ModalContent').html(data.pesan);
				$('#ModalFooter').html("<button type='button' class='btn btn-primary' data-dismiss='modal' autofocus>Ok, Saya Mengerti</button>");
				$('#ModalGue').modal('show');

				$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(5) input').val('1');
			}
		}
	});
});

$(document).on('keydown', '#jumlah_beli', function(e){
	var charCode = e.which || e.keyCode;
	if(charCode == 9){
		var Indexnya = $(this).parent().parent().index() + 1;
		var TotalIndex = $('#TabelTransaksi tbody tr').length;
		if(Indexnya == TotalIndex){
			BarisBaru();
			return false;
		}
	}

	HitungTotalBayar();
});
$(document).on('click', 'button#SimpanTransaksi', function(){
	SimpanTransaksi();
});

$(document).on('click', 'button#CetakStruk', function(){
	CetakStruk();
});
$(document).on('click', 'button#SimpanTransaksi', function(){
	SimpanTransaksi();
});

function SimpanTransaksi()
{
	var 
	FormData  = "&tgl_pr="+$('#tgl_pr').val();
	FormData += "&" + $('#TabelTransaksi tbody').serialize();
	FormData += "&keterangan="+$('#keterangan').val();
	FormData += "&pr_no="+$('#pr_no').val();
	if($(".kode_barang").val()==''){
		alert("isi salah satu Barang");
	exit();
	}else{
	$.ajax({
		url: "<?php echo site_url('penjualan/transaksi'); ?>",
		type: "POST",
		cache: false,
		data: FormData,
		dataType:'json',
		success: function(data){
			if(data.status == 1)
			{
				alert(data.pesan);
				window.location.href="<?php echo site_url('purchases'); ?>";
			}
			else 
			{
				  $.each(data.messages,function(key, value){
              var element = $('#' + key);
              element.closest('div.form-group')
              .removeClass('has-error')
              .addClass(value.length > 0 ? 'has-error' : 'has-success')
              .find('.text-danger')
              .remove();
              element.after(value);
            });
				window.location.href="<?php echo site_url('purchases'); ?>";
			}	
		}
	});
	}
}

$(document).on('click', '#TambahPelanggan', function(e){
	e.preventDefault();

	$('.modal-dialog').removeClass('modal-sm');
	$('.modal-dialog').removeClass('modal-lg');
	$('#ModalHeader').html('Tambah Pelanggan');
	$('#ModalContent').load($(this).attr('href'));
	$('#ModalGue').modal('show');
});
  $('#form_sample_1').submit(function(e){
    e.preventDefault();
     var fa = $(this);
	 FormData = fa.serialize();
FormData += "&" + $('#TabelTransaksi tbody input').serialize();
      $.ajax({
        url: fa.attr('action'),
        type: 'post' ,
        data:  FormData,
        dataType: 'json',
        success: function(response) {
          if(response.success == true) {
            $('#info').append('<div class="alert alert-success">' + 
              'Data Tersimpan' + '</div>');
            $('.form-group').removeClass('has-error')
                            .removeClass('has-success');
            $('.text-danger').remove();
            fa[0].reset();

            $('.alert-success').delay(500).show(10, function() {
                $(this).delay(3000).hide(10, function() {
                    $(this).remove();
                });
            })

          } else {
            $.each(response.messages,function(key, value){
              var element = $('#' + key);
              element.closest('div.form-group')
              .removeClass('has-error')
              .addClass(value.length > 0 ? 'has-error' : 'has-success')
              .find('.text-danger')
              .remove();
              element.after(value);
            });
          }
        }
     });

  });
  function Pilih(no,val)
{

	$('#satuan'+no).val(val);
}
function CetakStruk()
{
	if($('#TotalBayarHidden').val() > 0)
	{
		if($('#UangCash').val() !== '')
		{
			var FormData = "nomor_nota="+encodeURI($('#nomor_nota').val());
			FormData += "&tanggal="+encodeURI($('#tanggal').val());
			FormData += "&id_kasir="+$('#id_kasir').val();
			FormData += "&id_pelanggan="+$('#id_pelanggan').val();
			FormData += "&" + $('#TabelTransaksi tbody input').serialize();
			FormData += "&cash="+$('#UangCash').val();
			FormData += "&catatan="+encodeURI($('#catatan').val());
			FormData += "&grand_total="+$('#TotalBayarHidden').val();

			window.open("<?php echo site_url('penjualan/transaksi-cetak/?'); ?>" + FormData,'_blank');
		}
		else
		{
			$('.modal-dialog').removeClass('modal-lg');
			$('.modal-dialog').addClass('modal-sm');
			$('#ModalHeader').html('Oops !');
			$('#ModalContent').html('Harap masukan Total Bayar');
			$('#ModalFooter').html("<button type='button' class='btn btn-primary' data-dismiss='modal' autofocus>Ok</button>");
			$('#ModalGue').modal('show');
		}
	}
	else
	{
		$('.modal-dialog').removeClass('modal-lg');
		$('.modal-dialog').addClass('modal-sm');
		$('#ModalHeader').html('Oops !');
		$('#ModalContent').html('Harap pilih barang terlebih dahulu');
		$('#ModalFooter').html("<button type='button' class='btn btn-primary' data-dismiss='modal' autofocus>Ok</button>");
		$('#ModalGue').modal('show');

	}
}

</script>
