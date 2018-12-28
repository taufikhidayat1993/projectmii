<style>

</style> 
 <div class="page-bar">
                            <ul class="page-breadcrumb">
                                <li>
                                    <a href="index.html">Home</a>
                                    <i class="fa fa-circle"></i>
                                </li>
                                <li>
                                    <a href="#">Accounting</a>
                                    <i class="fa fa-circle"></i>
                                </li>
                                <li>
                                    <span>Buku Bank</span>
                                </li>
                            </ul>
                     
					   </div>
       <div class="row">
       
                            <div class="col-md-12">
                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                          
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                       <form action="<?php echo site_url('buku_bank/list_bukubank'); ?>" id="form_add_pelanggan">
                                         <div class="actions">
                                          
                                                <!-- /.col-md-6 -->
                                                 <div class="col-md-4">
                                                    <select class="form-control" name="account">
                                                        <?php foreach ($list_bank as $key ) {
                                                            echo '<option value="'.$key->kode_account.'"">'.$key->nama_account.'</option>';
                                                        }
                                                           ?>
                                                    </select>
                                                 </div>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                   
                                                        <span class="input-group-btn">
                                                             <div class="col-md-6">
                                                        <div class="input-group input-large date-picker input-daterange" data-date="10/11/2012"  data-date-format="dd/mm/yyyy" >
                                                            <input type="text" value="<?php echo date('01/m/Y'); ?>" class="form-control" id="from" name="from" placeholder="Mulai Tanggal">
                                                            <span class="input-group-addon"> s:d </span>
                                                            <input type="text" id="to" 
                                                            value="<?php echo date('d/m/Y'); ?>"
                                                            class="form-control" name="to" placeholder="Sampai Tanggal"> </div>                                                       <!-- /input-group -->
                                                        
                                                    </div>
                                                            <button class="btn btn-primary " id="search" type="button">Search</button>
                                                           
                                                        </span>
                                                    </div>
                                                    <!-- /input-group -->
                                                </div>
                                                 

                                                <!-- /.col-md-6 -->
                                      
                                        </div>
                                    </form>
                                    </div>
                                    <div class="portlet-body">		
                                    <div id="Notifikasi" style="display: none;"></div>	
                                        <table class="table table-striped table-bordered table-hover" >
                                            <thead>
                                                <tr>
                                                   
                                                    <th>Tanggal</th>
                                                    <th>Source No</th>
                                                    <th>Keterangan</th>
                                                    <th>Debet</th>
                                                    <th>Kredit</th>
                                                    <th>Saldo</th>
                                                  
                                                </tr>
                                               
                                            </thead>

                                           <tbody id="list_bukubank">

                                            
										   </tbody>
										</table>
                                    </div>
                                </div>

                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                     	<script>
	
		    $(document).ready(function () {
           
		     $.ajax({
        url: $('#form_add_pelanggan').attr('action'),
        type: 'post' ,
        data:  $('#form_add_pelanggan').serialize(),
        success: function(response) {
            $("#list_bukubank").html(response);
        }

    }
    );
		    });
function list_bukubank()
                {
      

                }
		</script>