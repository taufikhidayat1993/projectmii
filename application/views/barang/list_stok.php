 <div   data-always-visible="1" data-rail-visible1="1">
          <div id="info"></div>
           
                                                                 <form class="form-horizontal" id="form_add_pelanggan"  method="post"
                                                                 action="<?php echo site_url('barang/list_stokbarang'); ?>" >
                                                                  <input value="<?php echo $kode; ?>" name="kode_barang" type="hidden">
                                                            <div class="row">
                                                                     <div class="input-group">                  
                                                        <span class="input-group-btn">
                                                             <div class="col-md-7">
                                                        <div class="input-group input-large date-picker input-daterange" data-date="10/11/2012" data-date-format="dd/mm/yyyy" >
                                                    <input type="text"  class="form-control" value="<?php echo date('01/m/Y'); ?>" 
                                                            id="from" name="from" placeholder="Mulai Tanggal">
                                                            <span class="input-group-addon"> s:d </span>
                                                            <input type="text" id="to" 
 value="<?php echo date('d/m/Y'); ?>" 
                                                            class="form-control" name="to" placeholder="Sampai Tanggal"> </div>
                                                        <!-- /input-group -->
                                                        
                                                    </div>
                                                        <button class="btn btn-primary " id="caristok" type="button">Search
                                                        </button>
                                                           
                                                        </span>
                                                    </div>
              <div class="portlet-body form">  
                      <div class="form-body">
                           <table class="table table-striped table-bordered table-hover" >
                                            <thead>
                                                <tr>                                                   
                                                    <th>Tanggal</th>
                                                    <th>Source No</th>
                                                     <th>Deskripsi</th>
                                                    <th>In</th>
                                                    <th>Out</th>
                                                    <th>Qty</th>                            
                                                </tr>
                                            </thead>

                                           <tbody id="out_stok">

                                            
                       </tbody>
                    </table>
                                                        </div>
                                                    
                                                    </div>
                                                        </form>
                                                  </div>
                                                        </div>
 <script>
$(document).ready(function () {      
       stok();

        $('#caristok').on( 'click change', function (event) {
                    event.preventDefault();
                      stok();
                } );
     });

 function stok(){
         $.ajax({
        url: $('#form_add_pelanggan').attr('action'),
        type: 'post' ,
        data:  $('#form_add_pelanggan').serialize(),
        success: function(response) {
            $("#out_stok").html(response);
        }

    }
    );
       }
                                                
</script>