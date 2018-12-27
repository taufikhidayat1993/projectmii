<style>

</style> 

       <div class="row">
       
                            <div class="col-md-12">
                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption font-dark">
                                            <i class="icon-settings font-dark"></i>
                                            <span class="caption-subject bold uppercase">List Account
                                            </span>
                                        </div>
                                     
                                    </div>
                                       <form class="form-horizontal" id="form_add_pelanggan" 
                action="<?php echo site_url('purchase_payment/purchase_payment_simpan'); ?>" method="post">
                                    <div class="portlet-body">		
                                    <div id="Notifikasi" style="display: none;"></div>	
                                        <table class="table table-striped table-bordered table-hover order-column" id="sample_1">
                                            <thead>
                                                <tr>
                                                   
                                                    <th>No. Account</th>
                                                    <th>Nama Account</th>
                                                    <th>Tipe</th>
                                                    <th width="15%">Per Tanggal</th>
                                                   
                                                   <th width="15%" >Saldo Awal</th>
                                                </tr>
                                            </thead>
                                           <tbody>
                                            <?php
                                                foreach ($account as $row) {
                                                   ?>

<tr>
<td><?php echo $row->kode_account; ?><input type="hidden" value="<?php echo $row->kode_account; ?>" name="kode_account[]"></td>
<td><?php echo $row->nama_account; ?></td>
<td><?php echo $row->nama_header; ?></td>
<td>
<?php 
if($row->periode_tanggal =='0000-00-00'){
$tanggal=date('01/m/Y');
}else{
$tanggal=$row->periode_tanggal;
}
?>
    <input type="text" class="form-control dp" value="<?php echo $tanggal; ?>" name="periode[]"></td>


<td><input type="text" class="form-control" value="<?php echo $row->saldo_awal; ?>" name="saldoawal[]"></td>
</tr>
                                                   <?php
                                                }


                                            ?>
										   </tbody>
										</table>
                                    </div>
                                        <div class='form-actions'>
                                            <div class='row'>
                                            <button class='btn sbold blue' type="submit" style='width:100%;'  id='SimpanTransaksi' ><i class='fa fa-cart-plus'></i> Simpan</button>
                                            </div>
                                            </div>
                                </form>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                     	<script>
	
		    $(document).ready(function () {
                    $(".dp").datepicker({
                            dateFormat : "dd/mm/YYYY",
                            showAnim : "fold"
                        });
                $("div.dataTables_filter").html("");
		    	

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