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
                                            <span class="caption-subject bold uppercase">List Group Account
                                            </span>
                                        </div>
                                         <div class="actions">
                                          
                                                <!-- /.col-md-6 -->
                                                <div class="col-md-6">
                                                    <div class="input-group">
                                                        <input type="text" id="search_name_group" class="form-control" placeholder="group Name Search">
                                                        <span class="input-group-btn">
                                                            <button class="btn blue" id="search" type="button">Search</button>
                                                             <a  href="<?php echo site_url('group/tambah_group'); ?>"  id="tambahgroup"                                            class="btn sbold green">Add New Group
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
                                                   
                                                    <th>No Group </th>
                                                    <th>Nama Group</th>
                                                    
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
					"orderable":  false,
                    "targets": 0,
			
             "defaultContent": ""
         }],
					"ajax": {
						"url": "<?php echo base_url('group/server_side'); ?>",
						"type": "POST",
						"data":function(data) {
							data.name_group = $('#search_name_group').val();
							data.<?php echo $this->security->get_csrf_token_name(); ?> = "<?php echo $this->security->get_csrf_hash(); ?>";
						},
					},
					
				} );
                $('#search').on( 'click change', function (event) {
                    event.preventDefault();
                    if($('#search_name_group').val()=="")
                    {
                        $('#search_name_group').focus();
                    }
                    else
                    {
                        table.draw();
                    }

                } );
		$(document).on('click', '#tambahgroup, #Editgroup', function(e){
    e.preventDefault();

    $('.modal-dialog').removeClass('modal-sm');
    $('.modal-dialog').removeClass('modal-lg');
        if($(this).attr('id') == 'Editgroup')
        {
    $('.modal-title').html('Edit group');
     $('.modal-footer').html("<button type='button'data-dismiss='modal' class='btn dark btn-outline'>Close</button><button type='button' class='btn green'  onClick='simpangroup()' >Update</button>");
         } 
    if($(this).attr('id') == 'tambahgroup'){
    $('.modal-title').html('Tambah group Baru');
     $('.modal-footer').html("<button type='button'data-dismiss='modal' class='btn dark btn-outline'>Close</button><button type='button' class='btn green'  onClick='tambahgroup()' >Simpan</button>");
        }

    $('.modal-body').load($(this).attr('href'));
  
    $('#responsive').modal('show');
});		
$(document).on('click', '#hapusgroup', function(e){
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