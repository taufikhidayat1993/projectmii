
<div class="page-bar">
  <?php echo $this->breadcrumb->show() ?>                     
					   </div>
					      <div class="row">

                                                               <div class="portlet-body form">
                                                                <form class="form-horizontal" id="form_add_pelanggan" action="<?php echo site_url('header/header_add'); ?>" method="post">
                                                                     <div class="form-body">
                                                          <div class="col-md-6 ">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Tanggal PO</label>
                                                                <div class="col-md-6">
                                                                	<div class="input-group">
                                                          <input type="text" id="tanggal_po"  name="tanggal_po" class="form-control  dp" value="<?php echo date('d/m/Y'); ?>">
                                                             <span  class="input-group-btn">
                                                             	<button class="btn default" type="button">
                                                             		<i class="fa fa-calendar"></i>
                                                             	</button>
                                                             </span>
                                                               </div>
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">No. PO</label>

                                                                <div class="col-md-6">
                                                                	  <div class="input-group" id="no_po">
                                                                	  	<span  class="input-group-btn">
                                                                	  		<button class="btn btn-primary" type="button">
                                                             	PO
                                                             </button>
                                                             </span>
                                                                    <input type="text"  name="no_po" class="form-control" > 
                                                                   	<span  class="input-group-btn">
                                                                   		<button class="btn btn-primary" type="button">
                                                             	MII/XII/2018
                                                             </button>
                                                             </span>
                                                                    </div> 
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">No. Request</label>
                                                                <div class="col-md-6">
                                                                	  <div class="input-group">
                                                                <input type="text" id="no_request" name="no_request" class="form-control" readonly placeholder="Enter text">      <a href="<?php echo site_url('purchase_order/list_request'); ?>" class="input-group-addon" id="cari_request">
                                                                    	<i class="fa fa-search font-red"></i>
                                                                    </a> 
                                                                </div>
                                                                </div>
                                                            </div>
                                                           </div>
                                                            <div class="col-md-6 ">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Vendor</label>
                                                                <div class="col-md-9">
                                                                    <select  class='form-control select2 akun' name="vendor" id="vendor">
                                                                    	<option value="">Pilih Nama Vendor</option>
                                                             </select>
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Tunai</label>
                                                                <div class="col-md-9">
                                                                	  <div class="mt-checkbox-list">
                                                                   <label class="mt-checkbox mt-checkbox-outline"> 
                                                            <input type="checkbox" value="1" name="test" id="tunai" checked />
                                                            <span></span>
                                                        </label>
                                                    </div>
                                                                </div>
                                                            </div>
                                                             <div class="form-group" id="jatuhtempo" style="display: none;">
                                                                <label class="col-md-3 control-label">Jatuh Tempo</label>
                                                                <div class="col-md-9">
                                                                <input type="text" id="tgl_jatuhtempo" name="nama_header" class="form-control dp"
                                                                 data-date-format="dd/mm/yyyy"
                                                                 autocomplete="off" placeholder="Enter text">   
                                                                </div>
                                                            </div>
                                                           </div>
                                                        </div>
                                                        
                                                        </form>
                                                    </div>
                                                  </div>
					   <div class='row'>
					   	<div class='col-md-12'>
				 <div class="portlet">
				  <div id="info"></div>			
     <div class="portlet-body">	  
        <div class="form-body">
          <div class="table-scrollable">										
			<table class="table table-striped table-hover" id="TabelTransaksi">
						<thead>
						<tr class='w3-blue'>
							<th>No</th>
							<th>Nama Barang</th>
							<th>Kode</th>
							<th>Request</th>
							<th>Order</th>
							<th>Satuan</th>
						    <th>Harga</th>
						    <th>Subtotal</th>
							<th>OPSI</th>						
						</tr>
						</thead>

						<tbody id="data_request">
						</tbody>
						
					</table>
				

					</div></div>
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
            <label class='col-md-3 control-label'>PPN</label>
                <div class='col-md-9'>													
                  <input type='text'  id="ppn" name="ppn"  class='form-control input-medium'>
				 </div>
         </div>
        <div class='form-group'>
                <label class='col-md-3 control-label'>Subtotal
                                   </label>
                      <div class='col-md-9'>
      <input type='hidden'  id="TotalSubtotalhidden" name="TotalSubtotalhidden"  class='form-control'>
                  <span id="TotalSubtotal" class="form-control-static"></span>
            </div>
        </div>
         <div class='form-group'>
                <label class='col-md-3 control-label'>Total Payment
                                   </label>
                      <div class='col-md-9'>
       <input type='hidden'  id="TotalBayarHidden" name="pr_no"  class='form-control'>
                  <span id="TotalBayar" class="form-control-static"></span>
				 </div>
            </div>
        </div>

  
										
		<div class='col-md-6'>
         <div class='form-group' id="uangmuka" style="display: none">
            <label class='col-md-3 control-label'>Uang Muka</label>
                <div class='col-md-9'>													
                  <input type='text'  id="uang_muka" name="uang_muka"  class='form-control'>
         </div>
     </div>
        <div class='form-group'>
                <label class='col-md-3 control-label'>Kas Pembayaran</label>
                      <div class='col-md-9'>
                      	<select class="form-control" name="kas_bayar">
     <?php
foreach($account as $row){
     echo "<option value='".$row->kode_account."'>".$row->nama_account."</option>";
}
     ?>
      </select>
            </div>
        </div>
  
											</div>
											</div>
											</div>
											<div class='form-actions'>
											<div class='row'>
											<button class='btn sbold blue' type="button" style='width:100%;'  id='SimpanTransaksi' ><i class='fa fa-cart-plus'></i> Simpan</button>
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
							dateFormat : "dd/mm/YYYY",
							showAnim : "fold"
						});

	for(B=1; B<=1; B++){
		BarisBaru();
	}
	$('#BarisBaru').click(function(){
		BarisBaru();
	});

	$("#TabelTransaksi tbody").find('input[type=text],textarea,select').filter(':visible:first').focus();
$(document).on('click', '#cari_request, #Editheader', function(e){
   
    e.preventDefault();
    $('.modal-dialog').removeClass('modal-sm');
    $('.modal-dialog').removeClass('modal-lg');
        if($(this).attr('id') == 'cari_request')
        {
    $('.modal-title').html('Daftar Purchase Request');
 
         } 
    if($(this).attr('id') == 'tambahheader'){
    $('.modal-title').html('Tambah Account Baru');
     $('.modal-footer').html("<button type='button'data-dismiss='modal' class='btn dark btn-outline'>Close</button><button type='button' class='btn green'  onClick='tambahheader()' >Simpan</button>");
        }

    $('.modal-body').load($(this).attr('href'));
  
    $('#responsive').modal('show');
});	
$(document).on('click', '#get_request, #Editheader', function(e){
	 e.preventDefault();	
 $('#data_request').load($(this).attr('href'));
});
 $('.select2').select2({
           minimumInputLength: 2,
           allowClear: true,
           placeholder: 'Pilih Nama Vendor',
           ajax: {
              dataType: 'json',
              url: '<?php echo base_url(); ?>purchase_order/cari_vendor',
              delay: 250,
              data: function(params) {
                return {
                  search: params.term
                }
              },
              processResults: function (data, page) {
              return {
                results: data
              };
            },
          }
      });
  $("#tunai").click(function () {
            if ($(this).is(":checked")) {
                $("#jatuhtempo").hide();
                $("#uangmuka").hide();
				document.getElementById("jatuhtempo").disabled = false;
               
            } else {
                $("#jatuhtempo").show();
               $("#uangmuka").show();
            }
        });
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
      Baris += "<td><input type='text' class='form-control input-xsmall ' name='kode[]' id='kode' readonly></td>";
      Baris += "<td><input type='text' class='form-control input-xsmall' id='jumlah_request' name='jumlah_request[]' onkeypress='return check_int(event)' ></td>";
	  Baris += "<td><input type='text' class='form-control input-xsmall' id='jumlah_order' name='jumlah_order[]' onkeypress='return check_int(event)' ></td>";
				Baris += "<td><span></span></td>";
	  Baris += "<td><input type='text' class='form-control input-xsmall' id='harga' name='harga[]' onkeypress='return check_int(event)' ></td>";
				Baris += "<td><span></span><input type='hidden' class='form-control input-xsmall' id='subtotal' name='subtotal[]' onkeypress='return check_int(event)' ></td>";
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
var Field = $('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)');	
	
	var kodenya = Field.find('span#kodenya').html();
	var NamaBarang = Field.find('span#barangnya').html();
	var satuan = Field.find('span#satuan').html();
Field.find('div#hasil_pencarian').hide();
Field.find('input').val(NamaBarang);
	$('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(6) span').html(satuan);
	$('#TabelTransaksi tbody tr:eq('+$(this).parent().parent().index()+') td:nth-child(3) input').val(kodenya);
var IndexIni = $(this).parent().parent().index() + 1;
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
		var kodenya = $(this).find('span#kodenya').html();
	var NamaBarang = $(this).find('span#barangnya').html();
	var Harganya = $(this).find('span#harganya').html();

$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(2)').find('div#hasil_pencarian').hide();
$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(3) input').val(kodenya);
$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(5) span').html($(this).find('span#satuan').html());
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

$(document).on('keyup', '#harga, #jumlah_order, #ppn', function(){
	var Indexnya = $(this).parent().parent().index();
	var Harga = $('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(7) input').val();
	var JumlahBeli = $('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(5) input').val();

    var SubTotal = parseInt(Harga) * parseInt(JumlahBeli);
				if(SubTotal > 0){
					var SubTotalVal = SubTotal;
					SubTotal = to_rupiah(SubTotal);
				} else {
					SubTotal = '';
					var SubTotalVal = 0;
				}

				$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(8) input').val(SubTotalVal);
				$('#TabelTransaksi tbody tr:eq('+Indexnya+') td:nth-child(8) span').html(SubTotal);
				
		HitungTotalBayar();	
		}
	);


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



function to_rupiah(angka){
    var rev     = parseInt(angka, 10).toString().split('').reverse().join('');
    var rev2    = '';
    for(var i = 0; i < rev.length; i++){
        rev2  += rev[i];
        if((i + 1) % 3 === 0 && i !== (rev.length - 1)){
            rev2 += '.';
        }
    }
    return 'Rp. ' + rev2.split('').reverse().join('');
}

function HitungTotalBayar()
{
	var Total = 0;
	$('#TabelTransaksi tbody tr').each(function(){
		if($(this).find('td:nth-child(8) input').val() > 0)
		{
			var SubTotal = $(this).find('td:nth-child(8) input').val();
			Total = parseInt(Total) + parseInt(SubTotal);
		}
	});
if($('#ppn').val() >0 ) {
	var ppn =$('#ppn').val();
	var Totalnya=parseInt(Total) + parseInt(ppn);
}else{
	var ppn =$('#ppn').val();
	var Totalnya=parseInt(Total);
}
	$('#TotalBayar').html(to_rupiah(Totalnya));
	$('#TotalBayarHidden').val(Totalnya);
	$('#TotalSubtotal').html(to_rupiah(Total));
	$('#TotalSubtotalHidden').val(Total);

}
function SimpanTransaksi()
{
	
	var 

	FormData =$('#form_add_pelanggan').serialize();
	FormData +="&"+$('#form_sample_1').serialize();		
	$.ajax({
		url: "<?php echo site_url('purchase_order/simpan_po'); ?>",
		type: "POST",
		cache: false,
		data: FormData,
		dataType:'json',
		success: function(response){
	if(response.success == true) {
				alert("jjjj");
				
			}
			else 
			{
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
	
}


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

</script>
