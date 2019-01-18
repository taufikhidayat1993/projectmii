
<div class="page-bar">
  <?php echo $this->breadcrumb->show() ?>                     
					   </div>
                <form class="form-horizontal" id="form_add_pelanggan" action="<?php echo site_url('sales/sales_quotations/simpan'); ?>" method="post">
					      <div class="row">

                                                               <div class="portlet-body form">
                                                             
                                                                     <div class="form-body">
                                                          <div class="col-md-6 ">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Order By</label>
                                                                <div class="col-md-9">
                                                                    <select  class='form-control select2 akun' name="costumer" id="costumer">
                                                                      <option value="">Cari Nama Costumer</option>
                                                             </select>
                                                                </div>
                                                            </div>   
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Quote To</label>
                                                                <div class="col-md-9">
                                                                	<textarea class="form-control" name="quote_to" id="quote_to"></textarea>
                                                                </div>
                                                            </div>
                                                           
                                                           </div>
                                                            <div class="col-md-6 ">
                                                                <div class="form-group has-warning">
                                                                <label class="col-md-3 control-label">Quote No.</label>
                                                                <div class="col-md-6">
                                                                    
                                                                <input type="text" id="quote_no" name="quote_no" class="form-control input-sm" >           
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Date Quote</label>
                                                                <div class="col-md-6">
                                                                  <div class="input-group">
                                                          <input type="text" id="date_quote"  name="date_quote" class="form-control  dp" value="<?php echo date('d/m/Y'); ?>">
                                                             <span  class="input-group-btn">
                                                              <button class="btn default" type="button">
                                                                <i class="fa fa-calendar"></i>
                                                              </button>
                                                             </span>
                                                               </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <!--
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
                                                               <input type="hidden" value="1" name="val_tunai" id="val_tunai"  />
                                                            </div>
                                                          -->
                                                            
                                                           </div>
                                                        </div>
                                                        
                                                     
                                                    </div>
                                                   
                                                  </div>
                                                </form>
                                           
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
							<th>Nama Barang</th>
							<th>Kode Item</th>
							<th>QTY</th>
							<th>Satuan</th>
							<th>Unit Price</th>
						  <th>Disc %</th>
							<th>Ammount</th>	
              <th>Opsi</th>					
						</tr>
						</thead>

						<tbody id="data_item">

	
  					</tbody>

					</table>
				

					</div></div>
					 <div class="form-actions right">
						<button id='BarisBaru' class='btn btn-default pull-left'><i class='fa fa-plus fa-fw'></i> Baris Baru (F7)</button>
						  
					</div></div></div></div>
				

				</div>
      
				 <div class='row'>
<form id="rekapan" class="form-horizontal">
				 <div class='col-md-12'>
				   <div class='portlet light'>
                                    <div class='portlet-body form'>
									
							
									<div class='form-body'>
									<div class="row">
                    <div class='col-md-6'>
      <!--
         <div class='form-group' id="uangmuka" style="display: none">
            <label class='col-md-3 control-label'>Uang Muka</label>
                <div class='col-md-9'>                          
                  <input type='text'  id="uang_muka" name="uang_muka"  class='form-control'>
         </div>
     </div>
   -->
        <div class='form-group'>
                <label class='col-md-3 control-label'>Biaya Pengiriman</label>
            <div class='col-md-9'>
            <input type="text" class="form-control input-sm" name="biaya_pengiriman" id="biaya_pengiriman">                        
            </div>
        </div>
        <div class='form-group'>
                <label class='col-md-3 control-label'>Keterangan</label>
                      <div class='col-md-9'>
                       <textarea class="form-control" name="keterangan"></textarea>
            </div>
        </div>
  
                      </div>
									 <div class='col-md-6' >
        
        <div class='form-group'>
                <label class='col-md-3 control-label'>Subtotal
                                   </label>
                      <div class='col-md-9'>
      <input type='hidden'  id="TotalSubtotalhidden" name="TotalSubtotalhidden"  class='form-control'>
                  <span id="TotalSubtotal" class="form-control-static"></span>
            </div>
        </div>
       
         <div class='form-group'>
            <label class='col-md-3 control-label'>Diskon :</label>
                <div class='col-md-6'> 
                  <div class="input-group input-group-sm " >
                                                            <input type="text" class="form-control input-xsmall"
                                                             name="diskon_persen" id="diskon_persen" >
                                                            <span class="input-group-addon input-small"> % = </span>
                                                            <input type="text" class="form-control input-small" name="total_diskon"
 id="total_diskon"
                                                            "> </div>
                                                        <!-- /input-group -->
                                                       
                                                    </div>
                                                        <!-- /input-group -->                            
                                                
                                                     
                                                           
                                                     
                                                
        
                 
         </div>
    <div class='form-group'>
            <label class='col-md-3 control-label'>PPN 10 %</label>
                <div class='col-md-9'>
                <div class="input-group input-group-sm input-medium input-small">    
<span class="input-group-addon">
                                                            <input type="checkbox" name="cek_ppn" id="cek_ppn" checked> </span>
                  <input type='text'  id="ppn" name="ppn"  class='form-control input-medium input-sm' disabled>
                  <input type='hidden'  id="ppn2" name="ppn2"  class='form-control input-medium'>
                </div>
         </div>
         </div>
         <div class='form-group'>
                <label class='col-md-3 control-label'>Total Invoice
               </label>
                      <div class='col-md-9'>
       <input type='hidden'  id="TotalBayarHidden" name="pr_no"  class='form-control'>
                  <span id="TotalBayar" class="form-control-static"></span>
				 </div>
            </div>
        </div>				</div>
											</div>
											<div class='form-actions'>
											<div class='row'>
											<button class='btn sbold blue' type="button" style='width:100%;'  id='SimpanTransaksi' ><i class='fa fa-cart-plus'></i> Simpan</button>
											</div>
											</div>
										</div>
                  </div>
                </div>
              </form>
              </div>
									  
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
 quote_no();
	$("#data_item").find('input[type=text],textarea,select').filter(':visible:first').focus();
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

 $('.select2').select2({
           minimumInputLength: 2,
           allowClear: true,
           placeholder: 'Cari Nama Costumer',
           ajax: {
              dataType: 'json',
              url: '<?php echo base_url('sales/'); ?>sales_quotations/cari_costumer',
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
$("#costumer").on("change", function() {
   var kodenya= $("#costumer").val();
    $.ajax({
    url: "<?php echo base_url('sales/'); ?>sales_quotations/get_quote_to",
    type: "POST",
    cache: false,
    data:'kode_costumer=' + kodenya,
    success: function(data){
        $('#quote_to').val(data);
    }
  });
         
    });
  $("#cek_ppn").click(function () {
          HitungTotalBayar();
        });
});
function quote_no(){
    $.ajax({
    url: "<?php echo base_url('sales/'); ?>sales_quotations/get_quote_no",
    type: "POST",
    cache: false,
    success: function(data){
            $('#quote_no').val(data);
    }
  });
}
function BarisBaru()
{
	var Nomor = $('#data_item tr').length + 1;
	var Baris = "<tr>";
     	Baris += "<td>";
			Baris += " <input type='text' class='form-control input-sm' name='kode_barang' id='kode_barang' placeholder='Ketik Kode / Nama Barang' autocomplete='off'></div>";
			Baris += "<div id='hasil_pencarian'>";
		Baris += "</td>";
      Baris += "<td><input type='text' class='form-control input-sm input-xsmall' name='kode[]' id='kode' readonly></td>";
      Baris += "<td><input type='text' class='form-control input-sm input-xsmall' id='qty' name='qty[]' onkeypress='return check_int(event)' disabled></td>";
	  Baris += "<td><input type='hidden' class='form-control input-sm'  name='satuan[]'><span></span> </td>";
				Baris += "<td>   <input type='text' class='form-control input-sm input-small' id='unit_price' name='unit_price[]' onkeypress='return check_int(event)' disabled ></td>";
	  Baris += "<td><input type='text' class='form-control input-sm input-xsmall' id='diskon' name='diskon[]' onkeypress='return check_int(event)' disabled></td>";
				Baris += "<td><span></span><input type='hidden' class='form-control input-sm' id='ammount' name='ammount[]' onkeypress='return check_int(event)' ></td>";
	  Baris += "<td><button class='btn btn-default' id='HapusBaris'><i class='fa fa-times' style='color:red;'></i></button></td>";
		Baris += "</tr>";
	$('#data_item').append(Baris);
	$('#data_item tr').each(function(){
		$(this).find('td:nth-child(1) input').focus();
	});
}



function AutoCompleteGue(Lebar, KataKunci, Indexnya)
{
	$('div#hasil_pencarian').hide();
	var Lebar = Lebar + 25;
	var Registered = '';
	$('#data_item tr').each(function(){
		if(Indexnya !== $(this).index())
		{
			if($(this).find('td:nth-child(2) input').val() !== '')
			{
				Registered += $(this).find('td:nth-child(1) input').val() + ',';
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
				$('#data_item tr:eq('+Indexnya+') td:nth-child(1)').find('div#hasil_pencarian').css({ 'width' : Lebar+'px' });
				$('#data_item tr:eq('+Indexnya+') td:nth-child(1)').find('div#hasil_pencarian').show('fast');
				$('#data_item tr:eq('+Indexnya+') td:nth-child(1)').find('div#hasil_pencarian').html(json.datanya); }
			
		}
	});

	HitungTotalBayar();
}
$(document).on('keydown', '#kode_barang', function(e){		
	if($("#kode_barang").val() !== '')
	{
    var indexnya=$(this).parent().parent().index();
			var charCode = e.which || e.keyCode;
		if(charCode == 40)
		{
			if($('#data_item tr:eq('+indexnya+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').length > 0)
			{
				var Selanjutnya = $('#data_item tr:eq('+indexnya+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').next();
				$('#data_item tr:eq('+indexnya+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').removeClass('autocomplete_active');
				Selanjutnya.addClass('autocomplete_active');
			}
			else
			{
				$('#data_item tr:eq('+indexnya+') td:nth-child(1)').find('div#hasil_pencarian li:first').addClass('autocomplete_active');
			}
		} 
		else if(charCode == 38)
		{
			if($('#data_item tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').length > 0)
			{
				var Sebelumnya = $('#data_item tr:eq('+indexnya+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').prev();
				$('#data_item tr:eq('+$indexnya+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').removeClass('autocomplete_active');
			
				Sebelumnya.addClass('autocomplete_active');
			}
			else
			{
				$('#data_item tr:eq('+indexnya+') td:nth-child(1)').find('div#hasil_pencarian li:first').addClass('autocomplete_active');
			}
		}
			else if(charCode == 13)
		{
var Field = $('#data_item tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)');		
	var kodenya = Field.find('div#hasil_pencarian li.autocomplete_active span#kodenya').html();
	var NamaBarang = Field.find('div#hasil_pencarian li.autocomplete_active span#barangnya').html();
	var nama_satuan = Field.find('div#hasil_pencarian li.autocomplete_active span#nama_satuan').html();
  var satuan_id = Field.find('div#hasil_pencarian li.autocomplete_active span#satuan_id').html();
  var Harga_jual = Field.find('div#hasil_pencarian li.autocomplete_active span#harga_jual').html();
Field.find('div#hasil_pencarian').hide();
Field.find('input').val(NamaBarang);
  $('#data_item tr:eq('+indexnya+') td:nth-child(6) input').removeAttr('disabled').val(0);
	$('#data_item tr:eq('+indexnya+') td:nth-child(5) input').removeAttr('disabled').val(Harga_jual);
  $('#data_item tr:eq('+indexnya+') td:nth-child(3) input').removeAttr('disabled').val(1);
	$('#data_item tr:eq('+indexnya+') td:nth-child(2) input').val(kodenya);
  $('#data_item tr:eq('+indexnya+') td:nth-child(4) span').html(nama_satuan);
  $('#data_item tr:eq('+indexnya+') td:nth-child(1) input').val(NamaBarang);
  $('#data_item tr:eq('+indexnya+') td:nth-child(7) input').val(Harga_jual);
  $('#data_item tr:eq('+indexnya+') td:nth-child(7) input').html(to_rupiah(Harga_jual));


var IndexIni = $(this).parent().parent().index() + 1;
var TotalIndex = $('#data_item tr').length;	
	if(IndexIni == TotalIndex){
		BarisBaru();
		$('html, body').animate({ scrollTop: $(document).height() }, 0);
	}
	else {
		$('#data_item tr:eq('+indexnya+') td:nth-child(1) input').focus();
	}
    $('#data_item tr:eq('+indexnya+') td:nth-child(7) input').val("100");
    $('#data_item tr:eq('+indexnya+') td:nth-child(7) span').html("000");
    var qty = $('#data_item tr:eq('+indexnya+') td:nth-child(3) input').val();
  var unit_price = $('#data_item tr:eq('+indexnya+') td:nth-child(5) input').val();
  var diskon = $('#data_item tr:eq('+indexnya+') td:nth-child(6) input').val();
    var SubTotal = parseInt(qty) * parseInt(unit_price);
    var tot_diskon=SubTotal*(diskon/100);
        if(SubTotal > 0){
          var SubTotalVal = SubTotal-tot_diskon;
          SubTotal = to_rupiah(SubTotal-tot_diskon);
        } else {
          SubTotal = '';
          var SubTotalVal = 0;
        }

        $('#data_item tr:eq('+indexnya+') td:nth-child(7) input').val(SubTotalVal);
        $('#data_item tr:eq('+indexnya+') td:nth-child(7) span').html(SubTotal);
    HitungTotalBayar();
		}
		else 
		{
			AutoCompleteGue($(this).width(), $(this).val(), $(this).parent().parent().index());
		}
	}
	else
	{
		$('#data_item tr:eq('+indexnya+') td:nth-child(1)').find('div#hasil_pencarian').hide();
	}

});

$(document).on('click', '#daftar-autocomplete li', function(){
        $(this).parent().parent().parent().find('input').val($(this).find('span#barangnya').html());		
	        var Indexnya = $(this).parent().parent().parent().parent().index();
	      	var kodenya = $(this).find('span#kodenya').html();
	        var NamaBarang = $(this).find('span#barangnya').html();
	        var harga_jual = $(this).find('span#harga_jual').html();
$('#data_item tr:eq('+Indexnya+') td:nth-child(1)').find('div#hasil_pencarian').hide();
$('#data_item tr:eq('+Indexnya+') td:nth-child(7) input').html(harga_jual);
$('#data_item tr:eq('+Indexnya+') td:nth-child(7) span').html(to_rupiah(harga_jual));
$('#data_item tr:eq('+Indexnya+') td:nth-child(2) input').val(kodenya);
$('#data_item tr:eq('+Indexnya+') td:nth-child(3) input').removeAttr('disabled').val('1');
$('#data_item tr:eq('+Indexnya+') td:nth-child(6) input').removeAttr('disabled').val('0')
$('#data_item tr:eq('+Indexnya+') td:nth-child(5) input').removeAttr('disabled').val(harga_jual);
$('#data_item tr:eq('+Indexnya+') td:nth-child(4) input').val($(this).find('span#satuan_id').html());
$('#data_item tr:eq('+Indexnya+') td:nth-child(4) span').html($(this).find('span#nama_satuan').html());

	var IndexIni = Indexnya + 1;
	var TotalIndex = $('#data_item tr').length;
	if(IndexIni == TotalIndex){
		BarisBaru();
		$('html, body').animate({ scrollTop: $(document).height() }, 0);
	}
	else {
		$('#data_item tr:eq('+Indexnya+') td:nth-child(5) input').focus();
	}
	HitungTotalBayar();
});

$(document).on('keyup', '#unit_price, #qty, #diskon, #diskon_persen', function(){
	var Indexnya = $(this).parent().parent().index();
	var qty = $('#data_item tr:eq('+Indexnya+') td:nth-child(3) input').val();
	var unit_price = $('#data_item tr:eq('+Indexnya+') td:nth-child(5) input').val();
  var diskon = $('#data_item tr:eq('+Indexnya+') td:nth-child(6) input').val();
    var SubTotal = parseInt(qty) * parseInt(unit_price);
    var tot_diskon=SubTotal*(diskon/100);
   
				if(SubTotal > 0){
					var SubTotalVal = SubTotal-tot_diskon;
					SubTotal = to_rupiah(SubTotal-tot_diskon);
				} else {
					SubTotal = '';
					var SubTotalVal = 0;
				}
        var total_diskon= SubTotalVal*(total_diskon/100); 
    		$('#data_item tr:eq('+Indexnya+') td:nth-child(7) input').val(SubTotalVal);
				$('#data_item tr:eq('+Indexnya+') td:nth-child(7) span').html(SubTotal);
				
		HitungTotalBayar();	
		}
	);


$(document).on('keydown', '#jumlah_beli', function(e){
	var charCode = e.which || e.keyCode;
	if(charCode == 9){
		var Indexnya = $(this).parent().parent().index() + 1;
		var TotalIndex = $('#data_item tr').length;
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
 var ppn = document.getElementById("cek_ppn");
 var diskon_persen=$("#diskon_persen").val()/100;
 var Total = 0;

	$('#data_item tr').each(function(){
		if($(this).find('td:nth-child(7) input').val() > 0)
		{
			var SubTotal = $(this).find('td:nth-child(7) input').val();
			Total = parseInt(Total) + parseInt(SubTotal)+parseInt(SubTotal);
		}
	});
    if (ppn.checked == true){
   var total_ppn=parseInt(Total-(Total*diskon_persen))*0.1;
  var Totalnya=parseInt(Total)-parseInt(Total*diskon_persen)+(parseInt(total_ppn));
  } else {
       var total_ppn=0;
  var Totalnya=parseInt(Total);
  }

  $('#total_diskon').val(Total*diskon_persen);
	$('#TotalBayar').html(to_rupiah(Totalnya));
  $('#ppn').val(to_rupiah(total_ppn));
  $('#ppn2').val(total_ppn);
	$('#TotalBayarHidden').val(Totalnya);
	$('#TotalSubtotal').html(to_rupiah(Total));
	$('#TotalSubtotalhidden').val(Total);

}
function SimpanTransaksi()
{

	var FormData = $('#form_add_pelanggan').serialize();  
      FormData += "&" +$('#data_item input').serialize();   
      FormData += "&" +$('#rekapan').serialize();   
	$.ajax({
		url: "<?php echo site_url('sales/sales_quotations/simpan'); ?>",
		type: "POST",
		cache: false,
		data: FormData,
		dataType:'json',
		success: function(response){
	if(response.success == true) {
			      var $toast = toastr['success']('Proses Transaksi Berhasil Disimpan');				
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



  function Pilih(no,val)
{

	$('#satuan'+no).val(val);
}

</script>
