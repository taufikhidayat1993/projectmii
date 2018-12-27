
<div class="page-bar">
  <?php echo $this->breadcrumb->show() ?>                     
					   </div>
                <form class="form-horizontal" id="form_add_pelanggan" 
                action="<?php echo site_url('purchase_payment/purchase_payment_simpan'); ?>" method="post">
					      <div class="row">

                                                               <div class="portlet-body form">
                                                             
                                                                     <div class="form-body">
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
                                                                <label class="col-md-3 control-label">Tanggal Payment</label>
                                                                <div class="col-md-6">
                                                                  <div class="input-group">
                                                          <input type="text" id="tanggal_po"  name="tanggal_payment" class="form-control  dp" value="<?php echo date('d/m/Y'); ?>">
                                                             <span  class="input-group-btn">
                                                              <button class="btn default" type="button">
                                                                <i class="fa fa-calendar"></i>
                                                              </button>
                                                             </span>
                                                               </div>
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Form No</label>

                                                                <div class="col-md-6">
                                                                    <div class="input-group" id="form_no">
                                                                      <span  class="input-group-btn">
                                                                        <button class="btn btn-primary" type="button">
                                                              VP
                                                             </button>
                                                             </span>
                                                              <input type="text"  name="no_po" 
                                                              value="<?php echo $kode_po; ?>" class="form-control" > 
                                                                    <span  class="input-group-btn">
                                                                      <button class="btn btn-primary" type="button">
                                                              MII/XII/2018
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
							<th>Invoice No.</th>
							<th>Tanggal</th>
							<th>Jatuh Tempo</th>
							<th>Tot. Invoice</th>
							<th>Sisa Tagihan</th>
							<th>Payment</th>						  
							<th>Pay</th>						
						</tr>
						</thead>
						<tbody id="data_invoice">

						</tbody>
						
					</table>
				

					</div></div>
					</div></div></div>
				

				</div>
        
				 <div class='row'>
				 
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
                <label class='col-md-3 control-label'>Bank</label>
                <div class='col-md-9'>
                  <input type="text" name="kode_account" id="kode_account"
                  value="<?php echo $default->kode_account; ?>"
                   class=" form-control input-inline input-xsmall col-md-3" readonly>

                   <select class="form-control input-inline input-medium" name="kas_bayar"  id="kas_bayar">
     <?php
foreach($account as $row){
     echo "<option value='".$row->kode_account."'>".$row->nama_account."</option>";
}
     ?>
      </select>
                </div>                      
        </div>
        <div class='form-group'>
                <label class='col-md-3 control-label'>Bank Balance</label>
                <div class='col-md-9'>
                  <input type="text" name="bank_balance" class="form-control input-small">            
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
									
					</div>
				
					
				</div>
			</div>
		</form>
			

<script>
$(document).ready(function(){
	$(".dp").datepicker({
							dateFormat : "dd/mm/YYYY",
							showAnim : "fold"
						});
$("#vendor").on("change", function() {
        var kodenya= $("#vendor").val();
          $('#data_invoice').load("<?php echo base_url();?>/purchase_payment/get_pi/"+kodenya);
    });

$("#kas_bayar").on("change", function() {
      var kodenya= $("#kas_bayar").val();
          $('#kode_account').val(kodenya);
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
   var arr = $(this).attr('href').split("/");
   $("#no_request").val(""+arr[6]+"");
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
  $("#cek_ppn").click(function () {
          HitungTotalBayar();
        });
});

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

$(document).on('click', '#pay', function(){
  if ($(this).is(':checked')) {
	  $(this).parent().parent().find("input").each(function(){ 
         $(this).removeAttr("readonly");
          $(this).focus();

    });
  }else{
     $(this).parent().parent().find("input").each(function(){ 
         $(this).attr("readonly",true);
    });

  }

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
 var ppn = document.getElementById("cek_ppn");

	var Total = 0;
 
	$('#TabelTransaksi tbody tr').each(function(){
		if($(this).find('td:nth-child(8) input').val() > 0)
		{
			var SubTotal = $(this).find('td:nth-child(8) input').val();
			Total = parseInt(Total) + parseInt(SubTotal);
		}
	});
    if (ppn.checked == true){
   var total_ppn=parseInt(Total)*0.1;
  var Totalnya=parseInt(Total)+(parseInt(Total)*0.1);
  } else {
       var total_ppn=0;
  var Totalnya=parseInt(Total);
  }

	$('#TotalBayar').html(to_rupiah(Totalnya));
  $('#ppn').val(to_rupiah(total_ppn));
  $('#ppn2').val(total_ppn);
	$('#TotalBayarHidden').val(Totalnya);
	$('#TotalSubtotal').html(to_rupiah(Total));
	$('#TotalSubtotalhidden').val(Total);

}
function SimpanTransaksi()
{

	var FormData =$('#form_add_pelanggan').serialize();     
	$.ajax({
		url: "<?php echo site_url('purchase_order/purchase_order_simpan'); ?>",
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



  function Pilih(no,val)
{

	$('#satuan'+no).val(val);
}

</script>
