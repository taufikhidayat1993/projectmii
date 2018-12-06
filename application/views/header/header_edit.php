 <div   data-always-visible="1" data-rail-visible1="1">
          <div id="info"></div>
                                                            <div class="row">
                                                               <div class="portlet-body form">
                                                                <form class="form-horizontal" id="form_add_pelanggan" action="<?php echo site_url('header/header_edit_data/'.$header->headerid.''); ?>" method="post">
                                                                     <div class="form-body">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Group</label>
                                                                <div class="col-md-9">
                                                                  <select class="form-control" id="groupid" name="groupid">
                                                                  <?php 
                                                                  foreach($list as $row){
                                                                    if($header->groupid == $row->groupid) {
                                                                    ?>
                                                                           <option value="<?php echo $row->groupid; ?>" selected><?php echo $row->nama_group; ?></option>
                                                                    <?php
                                                                  }else{
                                                                    ?>
<option value="<?php echo $row->groupid; ?>"><?php echo $row->nama_group; ?></option>
                                                                    <?php
                                                                  }
                                                                  } 
                                                                  ?>
                                                                </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">No Header</label>
                                                                <div class="col-md-3">
                                                                    <input type="text" id="kode_header" name="kode_header" class="form-control col-md-3" value="<?php echo $header->kode_header; ?>" placeholder="Enter text">
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Nama Header</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" id="nama_header" name="nama_header" class="form-control" value="<?php echo $header->nama_header; ?>" placeholder="Enter text">   
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Keterangan</label>
                                                                <div class="col-md-9">
                                                                  <textarea class="form-control" name="keterangan"></textarea>
                                                                </div>
                                                            </div>
                                                   
                                                        </div>
                                                        </form>
                                                    </div>
                                                              
                                                            </div>
                                                        </div>
                                                        <script>
function simpanheader()
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

            $('.alert-success').fadeIn('fast').show().delay(3000).fadeOut('fast');
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