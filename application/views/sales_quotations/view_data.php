<style>

</style> 
 <div class="page-bar">
                             <?php echo $this->breadcrumb->show() ?>
                     <div class="page-toolbar">
                                <div class="btn-group pull-right">
                               <a href="<?php echo base_url('sales/'); ?>sales_quotations/add" class="btn btn-circle btn-success btn-sm"  > <i class="fa fa-plus"></i> Tambah</a>
                                </div>
                            </div>
					   </div>
					   <br>
       <div class="row">
       
                            <div class="col-md-12">
                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                                <form class="form-horizontal form-bordered">               
                                                <!-- /.col-md-6 -->
                                                <div class="form-group">
                                               
                                                    <div class="input-group">                    
                                                        <span class="input-group-btn">
                                                             <div class="col-md-4">
                                                        <div class="input-group input-large date-picker input-daterange" data-date="10/11/2012" data-date-format="dd/mm/yyyy" >
                                                            <input value="<?php echo date('01/m/Y'); ?>"type="text" class="form-control" id="from" name="from" placeholder="Mulai Tanggal">
                                                            <span class="input-group-addon"> s:d </span>
                                                            <input type="text" value="<?php echo date('d/m/Y'); ?>" id="to" class="form-control" name="to" placeholder="Sampai Tanggal"> </div>
                                                        <!-- /input-group -->
                                                        
                                                    </div>
                                                            <button class="btn btn-primary " id="search" type="button">Search</button>
                                                           
                                                        </span>
                                                    </div>
                                                    <!-- /input-group -->
                                              
                                            </div>
                                            </form>
                                             

                                                <!-- /.col-md-6 -->
                                      
                                       
                                    <div class="portlet-body">		
                                    <div id="Notifikasi" style="display: none;"></div>	
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column sample_1" id="sample_1">
                                            <thead>
                                                <tr>
                                                   
                                                    <th>Date</th>
                                                    <th>No. Penawaran</th>
                                                    <th>Dipesan Oleh </th>
                                                    <th>Diskon</th>
                                                    <th>Pajak</th>
                                                    <th>Biaya Kirim</th>
                                                    <th>Nilai Faktur</th>
                                                   
                                                   <th width="10%">ACTION</th>
                                                </tr>
                                            </thead>
                                           <tbody>
										   </tbody>
										</table>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                     	<script>
	
		    $(document).ready(function () {
                $("div.dataTables_filter").html("");
		    	
		        var table =  $('#sample_1').DataTable( {
					processing:true,
					filter: false,
					serverSide: true,
					"columnDefs": [ {
						'orderable':      false,
             "targets": 0,
			
             "defaultContent": ""
         }],
					"ajax": {
						"url": "<?php echo base_url('sales/sales_quotations/server_side'); ?>",
						"type": "POST",
						"data":function(data) {
							data.from = $('#from').val();
                            data.to = $('#to').val();
							data.<?php echo $this->security->get_csrf_token_name(); ?> = "<?php echo $this->security->get_csrf_hash(); ?>";
						},
					},
					
				} );
                $('#search').on( 'click change', function (event) {
                    event.preventDefault();
                   
                        table.draw();
                    

                } );
$('#sample_1 tbody').on('click', 'td.details-control', function(){
        var tr = $(this).closest('tr');
        var row = table.row( tr );

        if(row.child.isShown()){
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        } else {
            // Open this row
            row.child(format(row.data())).show();
            tr.addClass('shown');
        }
});
 $('#btn-show-all-children').on('click', function(){
        // Enumerate all rows
        table.rows().every(function(){
            // If row has details collapsed
            if(!this.child.isShown()){
                // Open this row
                this.child(format(this.data())).show();
                $(this.node()).addClass('shown');
            }
        });
    });

    // Handle click on "Collapse All" button
    $('#btn-hide-all-children').on('click', function(){
        // Enumerate all rows
        table.rows().every(function(){
            // If row has details expanded
            if(this.child.isShown()){
                // Collapse row details
                this.child.hide();
                $(this.node()).removeClass('shown');
            }
        });
    });
		$(document).on('click', '#tambahaccount, #Editaccount', function(e){
    e.preventDefault();
    $('.modal-dialog').removeClass('modal-sm');
    $('.modal-dialog').removeClass('modal-lg');
        if($(this).attr('id') == 'Editaccount')
        {
    $('.modal-title').html('Form Edit Account');
     $('.modal-footer').html("<button type='button'data-dismiss='modal' class='btn dark btn-outline'>Close</button><button type='button' class='btn green'  onClick='simpanaccount()' >Update</button>");
         } 
    if($(this).attr('id') == 'tambahaccount'){
    $('.modal-title').html('Tambah Account Baru');
     $('.modal-footer').html("<button type='button'data-dismiss='modal' class='btn dark btn-outline'>Close</button><button type='button' class='btn green'  onClick='tambahaccount()' >Simpan</button>");
        }

    $('.modal-body').load($(this).attr('href'));
  
    $('#responsive').modal('show');
});		
$(document).on('click', '#hapusaccount', function(e){
        e.preventDefault();
        var Link = $(this).attr('href');
        $('.modal-dialog').removeClass('');
        $('.modal-dialog').addClass('modal-sm');
        $('.modal-title').html('Konfirmasi');
        $('.modal-body').html('Apakah anda yakin ingin menghapus <br /><b>'+$(this).parent().parent().find('td:nth-child(2)').html()+'</b> ?');
        $('.modal-footer').html("<button type='button' class='btn btn-primary' id='YesDelete' data-url='"+Link+"'>Ya, saya yakin</button><button type='button' class='btn btn-default' data-dismiss='modal'>Batal</button>");
        $('#responsive').modal('show');
    });
		$(document).on('click', '#YesDelete', function(e){
        e.preventDefault();
        $('#responsive').modal('hide');

        $.ajax({
            url: $(this).data('url'),
            type: "POST",
            cache: false,
            dataType:'json',
            success: function(data){

                $('#Notifikasi').html(data.pesan);
                $("#Notifikasi").fadeIn('fast').show().delay(3000).fadeOut('fast');
                 table.draw();
                      }
        });
    });	
		    });
		</script>