 <div   data-always-visible="1" data-rail-visible1="1">
          <div id="info"></div>
                                                            <div class="row">
                                                               <div class="portlet-body form">
                                                                <form class="form-horizontal" id="form_add_pelanggan" action="<?php echo site_url('costumer/add_costumer'); ?>" method="post">
                                                                     <div class="form-body">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Nama costumer</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" id="nama_costumer" name="nama_costumer" class="form-control" placeholder="Enter text">
                                                                  
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">No Telp</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" id="no_telp" name="no_telp" class="form-control" placeholder="Enter text">
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Email</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" id="email" name="email" class="form-control" placeholder="Enter text">   
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Alamat</label>
                                                                <div class="col-md-9">
                                                                    <textarea name="alamat" id="alamat" class="form-control" id="Address"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Deskripsi</label>
                                                                <div class="col-md-9">
                                                                   <textarea name="deskripsi" id="des" class="form-control" id="deskripsi"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </form>
                                                    </div>
                                                              
                                                            </div>
                                                        </div>
                                                        <script>
function tambahcostumer()
{

        $.ajax({
        url: $('#form_add_pelanggan').attr('action'),
        type: 'post' ,
        data:  $('#form_add_pelanggan').serialize(),
        dataType: 'json',
        success: function(response) {
          if(response.success == true) {
            $('#info').append('<div class="alert alert-success">' + 'Data Tersimpan' + '</div>');
         
            $('.form-group').removeClass('has-error').removeClass('has-success');
            $('.text-danger').remove();
            $('#form_add_pelanggan')[0].reset();

            $('.alert-success').delay(500).show(10, function() {
                $('#form_add_pelanggan').delay(3000).hide(10, function() {
                    $('#responsive').remove();
                });
            })
 table.draw();
          } else {
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
                                                        </script>