<style>

</style> 

       <div class="row">
       
                            <div class="col-md-12">
                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption font-dark">
                                            <i class="fa fa-calculator"></i>
                                            <span class="caption-subject bold uppercase">Bukti Jurnal Umum
                                            </span>
                                        </div>
                                        <div class="actions">
                                            <div class="btn-group btn-group-devided" data-toggle="buttons">
                                                <button class="btn btn-transparent green btn-outline btn-circle btn-sm active" id="add_buktijurnalumum">
                                             <i class="fa fa-plus"> Tambah Baru </i> </button>
                                              
                                            </div>
                                        </div>
                                    </div>
                            <form action="<?php echo base_url();?>bukti_jurnalumum/simpan" class="form-horizontal"  method="post" id="form_sample_1"  accept-charset="utf-8">
                                    <div class="portlet-body">	
                                        <div class="row">
                                      <div class="col-md-8" >
                                                    <div class="input-group">                  
                                                        <span class="input-group-btn">
                                                             <div class="col-md-6" style="padding-left: 0px;">
                                                        <div class="input-group input-large date-picker input-daterange" data-date="10/11/2012" data-date-format="dd/mm/yyyy" >
                                                            <input type="text" class="form-control" id="from" name="from" placeholder="Mulai Tanggal" value="<?php echo date('01/m/Y'); ?>" >
                                                            <span class="input-group-addon"> s:d </span>
                                                            <input type="text" id="to" class="form-control" name="to" placeholder="Sampai Tanggal" value="<?php echo date('d/m/Y'); ?>" > </div>
                                                    </div>
                                                            <button class="btn btn-primary " id="search" type="button">Search</button>  
                                                        </span>
                                                    </div>
                                                </div>	

</div>
<br>
                                    <div id="Notifikasi" style="display: none;"></div>	
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column sample_1" id="sample_1">
                                            <thead>
                                                <tr>
                                                   
                                                    <th width="10%">Date</th>
                                                    <th>Source</th>
                                                    <th>Source No.</th>
                                                    <th>Account No</th>
                                                    <th>Account Name</th>
                                                    <th>Debet</th>
                                                    <th>Kredit</th>
                                                   
                                                   <th width="10%">ACTION</th>
                                                </tr>
                                            </thead>
                                           <tbody>
										   </tbody>
										</table>                                            
                          <div id="addnew" class="modal fade bs-modal-lg"   aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                        <h4 class="modal-title">Form Bukti Jurnal Umum</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="scroller" style="height:400px" data-always-visible="1" data-rail-visible1="1">
                                                            <div class="row">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Jurnal No.</label>
                                        <div class="col-md-9">
                                        <input type="text" name="junal_no" class="form-control input-sm" placeholder="Default Input">
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-md-3 control-label">Date</label>
                                        <div class="col-md-9">
                                        <input type="text" name="date_jurnal" class="form-control input-sm" placeholder="Default Input">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Description</label>
                                        <div class="col-md-9">
                                        <textarea class="form-control input-sm" name="description" > </textarea> 
                                        </div>
                                    </div>
                                </div>
                                <br>
                            
                                    <table class="table table-bordered table-hover" >
                                        <thead>
                                            <tr>
                                                <th width="300">Account Name</th>
                                                <th width="100">Account No</th>
                                                <th>Debet</th>
                                                <th>Credit</th>
                                            </tr>
                                        </thead>                                  
                                    <tbody id="tabeljurnal">                                      
                                    </tbody>
                                      </table>
                             
                                     <div class="form-actions right">
                        <button id='BarisBaru' class='btn btn-default pull-left'><i class='fa fa-plus fa-fw'></i> Baris Baru (F7)</button>
                          
                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" data-dismiss="modal" class="btn dark btn-outline">Close</button>
                                                        <button type="button" class="btn green">Save changes</button>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                    </div>
                                </form>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                           
                        </div>
                     	<script>
	
		    $(document).ready(function () {
                for(B=1; B<=1; B++){
                   BarisBaru();
                }
                $('#BarisBaru').click(function(){
                     BarisBaru();
                  });

                $("div.dataTables_filter").html("");		    	
		        var table =  $('#sample_1').DataTable( {
					processing:true,
					filter: false,
					serverSide: true,
					"columnDefs": [ {
					'orderable': false,
                    "targets": 0,			
             "defaultContent": ""
         }],
					"ajax": {
						"url": "<?php echo base_url('Jurnal_umum/server_side'); ?>",
						"type": "POST",
						"data":function(data) {
							data.from = $('#from').val();
                            data.to = $('#to').val();
							data.<?php echo $this->security->get_csrf_token_name(); ?> = "<?php echo $this->security->get_csrf_hash(); ?>";
						},
					},
					
				} );

        $(document).on('keydown', '#nama_akun', function(e){      
    if($("#nama_akun").val() !== '')
    {
            var charCode = e.which || e.keyCode;
        if(charCode == 40)
        {
            if($('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').length > 0)
            {
                var Selanjutnya = $('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').next();
                $('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').removeClass('autocomplete_active');
                Selanjutnya.addClass('autocomplete_active');
            }
            else
            {
                $('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)').find('div#hasil_pencarian li:first').addClass('autocomplete_active');
            }
        } 
        else if(charCode == 38)
        {
            if($('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').length > 0)
            {
                var Sebelumnya = $('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').prev();
                $('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)').find('div#hasil_pencarian li.autocomplete_active').removeClass('autocomplete_active');            
                Sebelumnya.addClass('autocomplete_active');
            }
            else
            {
  $('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)').find('div#hasil_pencarian li:first').addClass('autocomplete_active');
            }
        }
            else if(charCode == 13)
        {
    var Field = $('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(1)');  
    var kodenya = Field.find('span#kodenya').html();
    var NamaBarang = Field.find('span#barangnya').html();
        Field.find('div#hasil_pencarian').hide();
        Field.find('input').val(NamaBarang); 
    $('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(2) input').val(kodenya);
var IndexIni = $(this).parent().parent().index() + 1;
var TotalIndex = $('#tabeljurnal tr').length;  
    if(IndexIni == TotalIndex){
        BarisBaru();
        $('html, body').animate({ scrollTop: $(document).height() }, 0);
    }
    else {
        $('#tabeljurnal tr:eq('+Indexnya+') td:nth-child(5) input').focus();
    }
        }
        else 
        {
            AutoCompleteGue($(this).width(), $(this).val(), $(this).parent().parent().index());
        }
    }
    else
    {
        $('#tabeljurnal tr:eq('+$(this).parent().parent().index()+') td:nth-child(2)').find('div#hasil_pencarian').hide();
    }
    <!-- HitungTotalBayar(); -->
});
                $('#search').on( 'click change', function (event) {
                    event.preventDefault();
                        table.draw();
                } );
		    });
function BarisBaru()
{
    var Nomor = $('#tabeljurnal tr').length + 1;
    var Baris = "<tr>";
        Baris += " <td><input id='nama_akun' class='form-control input-sm'> <div id='hasil_pencarian'></div></td><td><input type='text' readonly class='form-control  input-sm' name='kode_akun[]'  </td>";
        Baris += " <td> <input type='text' name='debi[]' class='form-control  input-sm'></td>";
        Baris += " <td> <input type='text' name='Kredit[]' class='form-control input-sm'></td>";
                                         
      Baris += "<td><button class='btn btn-default' id='HapusBaris'><i class='fa fa-times' style='color:red;'></i></button></td>";
        Baris += "</tr>";

    $('#tabeljurnal').append(Baris);

    $('#tabeljurnal tr').each(function(){
        $(this).find('td:nth-child(2) input').focus();
    });


}
function AutoCompleteGue(Lebar, KataKunci, Indexnya)
{
    $('div#hasil_pencarian').hide();
    var Lebar = Lebar + 25;
    var Registered = '';
    $('#tabeljurnal tr').each(function(){
        if(Indexnya !== $(this).index())
        {
            if($(this).find('td:nth-child(1) input').val() !== '')
           {
                Registered += $(this).find('td:nth-child(1) input').val() + ',';
           }
        }
    });
    if(Registered !== ''){
        Registered = Registered.replace(/,\s*$/,"");
    }
    $.ajax({
        url: "<?php echo site_url('Bukti_jurnalumum/ajax_kode'); ?>",
        type: "POST",
        cache: false,
        data:'keyword=' + KataKunci + '&registered=' + Registered,
        dataType:'json',
        success: function(json){
            if(json.status == 1)
            {
                $('#tabeljurnal tr:eq('+Indexnya+') td:nth-child(1)').find('div#hasil_pencarian').css({ 'width' : Lebar+'px' });
                $('#tabeljurnal tr:eq('+Indexnya+') td:nth-child(1)').find('div#hasil_pencarian').show('fast');
                $('#tabeljurnal tr:eq('+Indexnya+') td:nth-child(1)').find('div#hasil_pencarian').html(json.datanya);
            }
            
        }
    });

}

              $(document).on('click', '#add_buktijurnalumum', function(e){  
                   $('#addnew').modal('show');
                }); 
		</script>