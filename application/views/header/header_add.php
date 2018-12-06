 <div   data-always-visible="1" data-rail-visible1="1">
          <div id="info"></div>
                                                            <div class="row">
                                                               <div class="portlet-body form">
                                                                <form class="form-horizontal" id="form_add_pelanggan" action="<?php echo site_url('header/header_add'); ?>" method="post">
                                                                     <div class="form-body">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Header</label>
                                                                <div class="col-md-9">
                                                                  <select class="form-control" id="groupid" name="groupid">
                                                                  <?php 
                                                                  foreach($list as $row){
                                                                    ?>
                                                                           <option value="<?php echo $row->groupid; ?>"><?php echo $row->kode_group.'-'.$row->nama_group; ?></option>
                                                                    <?php
                                                                  } 
                                                                  ?>
                                                                </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">No Header</label>
                                                                <div class="col-md-3">
                                                                    <input type="text" id="kode_header" name="kode_header" class="form-control col-md-3" placeholder="Enter text">
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Nama Header</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" id="nama_header" name="nama_header" class="form-control" placeholder="Enter text">   
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Keterangan</label>
                                                                <div class="col-md-9">
                                                                 <textarea class="form-control"></textarea>
                                                                </div>
                                                            </div>
                                                           
                                                        </div>
                                                        
                                                        </form>
                                                    </div>
                                                              
                                                            </div>
                                                        </div>
                                                        <script>
function tambahheader()
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