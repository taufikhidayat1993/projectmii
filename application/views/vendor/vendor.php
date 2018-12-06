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
                                            <span class="caption-subject bold uppercase">List Vendor
                                            </span>
                                        </div>
                                         <div class="actions">
                                          
                                                <!-- /.col-md-6 -->
                                                <div class="col-md-6">
                                                    <div class="input-group">
                                                        <input type="text" id="search_name_vendor" class="form-control" placeholder="Vendor Name Search">
                                                        <span class="input-group-btn">
                                                            <button class="btn blue" id="search" type="button">Search</button>
                                                             <a  href="<?php echo site_url('vendor/tambah_vendor'); ?>"  id="tambahvendor"                                            class="btn sbold green">Add New Vendor
                                             <i class="fa fa-plus"></i>
                                                </a>
                                                        </span>
                                                    </div>
                                                    <!-- /input-group -->
                                                </div>
                                                <!-- /.col-md-6 -->
                                      
                                        </div>
                                    </div>
                                    <div class="portlet-body">		
                                    <div id="Notifikasi" style="display: none;"></div>	
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column sample_1" id="sample_1">
                                            <thead>
                                                <tr>
                                                   
                                                    <th>KODE </th>
                                                    <th>NAMA VENDOR</th>
                                                    <th>ALAMAT </th>
                                                    <th>NO TELP </th>
                                                    <th>EMAIL</th>
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
						function format ( d ) {
					
							$.ajax({
		url: "<?php echo site_url('purchases/purchase_request_detail_pr'); ?>",
		type: "POST",
		cache: false,
		data: "kode_pr="+d,
		dataType:'json',
		success: function(data){			        
	                  var i;
                    for(i=0; i<data.length; i++){
                        html += '<tr><td>'+data[i].nama_barang+'</td><td>'+data[i].qty+'</td><td>'+data[i].satuan+'</td></tr>';
                    }
					$("#datadetail").html(html);
		}
    });
							 return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" width="500px"><tbody id="datadetail"></tbody></table>';
						
    // `d` is the original data object for the row

}
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
						"url": "<?php echo base_url('vendor/server_side'); ?>",
						"type": "POST",
						"data":function(data) {
							data.name_vendor = $('#search_name_vendor').val();
							data.<?php echo $this->security->get_csrf_token_name(); ?> = "<?php echo $this->security->get_csrf_hash(); ?>";
						},
					},
					
				} );
                $('#search').on( 'click change', function (event) {
                    event.preventDefault();
                    if($('#search_name_vendor').val()=="")
                    {
                        $('#search_name_vendor').focus();
                    }
                    else
                    {
                        table.draw();
                    }

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
		$(document).on('click', '#tambahvendor, #Editvendor', function(e){
    e.preventDefault();

    $('.modal-dialog').removeClass('modal-sm');
    $('.modal-dialog').removeClass('modal-lg');
        if($(this).attr('id') == 'Editvendor')
        {
    $('.modal-title').html('Edit Vendor');
     $('.modal-footer').html("<button type='button'data-dismiss='modal' class='btn dark btn-outline'>Close</button><button type='button' class='btn green'  onClick='simpanvendor()' >Update</button>");
         } 
    if($(this).attr('id') == 'tambahvendor'){
    $('.modal-title').html('Tambah Vendor Baru');
     $('.modal-footer').html("<button type='button'data-dismiss='modal' class='btn dark btn-outline'>Close</button><button type='button' class='btn green'  onClick='tambahvendor()' >Simpan</button>");
        }

    $('.modal-body').load($(this).attr('href'));
  
    $('#responsive').modal('show');
});		
$(document).on('click', '#hapusvendor', function(e){
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