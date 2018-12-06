<style>

</style> 
 <div class="page-bar">
                            <ul class="page-breadcrumb">
                                <li>
                                    <a href="index.html">Home</a>
                                    <i class="fa fa-circle"></i>
                                </li>
                                <li>
                                    <a href="#">Tables</a>
                                    <i class="fa fa-circle"></i>
                                </li>
                                <li>
                                    <span>Datatables</span>
                                </li>
                            </ul>
                     
					   </div>
       <div class="row">
       
                            <div class="col-md-12">
                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption font-dark">
                                            <i class="icon-settings font-dark"></i>
                                            <span class="caption-subject bold uppercase">Daftar Purchase Order
                                            </span>
                                        </div>
                                         <div class="actions">
                                          
                                                <!-- /.col-md-6 -->
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                   
                                                        <span class="input-group-btn">
                                                             <div class="col-md-6">
                                                        <div class="input-group input-large date-picker input-daterange" data-date="10/11/2012" data-date-format="dd/mm/yyyy" >
                                                            <input type="text" class="form-control" id="from" name="from" placeholder="Mulai Tanggal">
                                                            <span class="input-group-addon"> s:d </span>
                                                            <input type="text" id="to" class="form-control" name="to" placeholder="Sampai Tanggal"> </div>
                                                        <!-- /input-group -->
                                                        
                                                    </div>
                                                            <button class="btn btn-primary " id="search" type="button">Search</button>
                                                           
                                                        </span>
                                                    </div>
                                                    <!-- /input-group -->
                                                </div>
                                                 <div class="col-md-4">
   <a href="<?php echo base_url(); ?>purchase_order/add" class="btn btn-circle btn-success" id="search" type="button"> <i class="fa fa-plus"></i> Tambah PO</a>
                                                 </div>

                                                <!-- /.col-md-6 -->
                                      
                                        </div>
                                    </div>
                                    <div class="portlet-body">		
                                    <div id="Notifikasi" style="display: none;"></div>	
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column sample_1" id="sample_1">
                                            <thead>
                                                <tr>
                                                   
                                                    <th>Tanggal</th>
                                                    <th>No. PO</th>
                                                    <th>No. Request</th>
                                                    <th>Vendor</th>
                                                    <th>Total PO</th>
                                                   
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
						"url": "<?php echo base_url('Purchase_order/server_side'); ?>",
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