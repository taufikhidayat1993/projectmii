<style>
td.details-control {
    background: url('https://cdn.rawgit.com/DataTables/DataTables/6c7ada53ebc228ea9bc28b1b216e793b1825d188/examples/resources/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('https://cdn.rawgit.com/DataTables/DataTables/6c7ada53ebc228ea9bc28b1b216e793b1825d188/examples/resources/details_close.png') no-repeat center center;
}
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
                                            <span class="caption-subject bold uppercase">List Purchase Request</span>
                                        </div>
                                        <div class="actions">
                                            <div class="btn-group btn-group-devided" >
                                             <a href="<?php echo base_url(); ?>purchases/purchase_request_add"											 class="btn sbold green">Add Purchase Request
											 <i class="fa fa-plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-toolbar">
                                            <div class="row">
                                               
                                             
                                            </div>
                                        </div>
										<input type='text' id='datepicker1'>	<input type='text' id='datepicker2'>
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column sample_1" id="sample_1">
                                            <thead>
                                                <tr>
                                                   
                                                    <th> NO PR</th>
                                                    <th>TANGGAL PR </th>
                                                    <th> NAMA PEMOHON </th>
                                                    <th> STATUS </th>
                                                    <th> Actions </th>
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
			          var html="";
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
		    	
		        var table =  $('#sample_1').DataTable( {
					processing:true,
					
					serverSide: true,
                    "ajax": {
						"url": "<?php echo base_url('serverajax/purchase_request'); ?>",
						"type": "POST",
						"data":function(data) {
							data.from = $('#datepicker1').val();
							data.to = $('#datepicker2').val();
						    data.<?php echo $this->security->get_csrf_token_name(); ?> = "<?php echo $this->security->get_csrf_hash(); ?>";
						},
					},
					
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
				
			
		    });
		</script>