 <div   data-always-visible="1" data-rail-visible1="1">
          <div id="info"></div>
                                                            <div class="row">
                                                               <div class="portlet-body form">
                                                                <form class="form-horizontal" id="form_edit_pelanggan" action="<?php echo site_url('group/group_edit_data/'.$group->groupid.''); ?>" method="post">
                                                                     <div class="form-body">
                                                                       <div class="form-group">
                                                                <label class="col-md-3 control-label">No Group</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" id="kode_group" name="kode_group" class="form-control" value="<?php echo $group->kode_group; ?>" placeholder="Enter text">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Nama group</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" id="nama_group" name="nama_group" class="form-control" value="<?php echo $group->nama_group; ?>" placeholder="Enter text">
                                                                  
                                                                </div>
                                                            </div>
                                                           
                                                        </div>
                                                        </form>
                                                    </div>
                                                  </div>
                                                        </div>
                                                        <script>
function simpangroup()
{

        $.ajax({
        url: $('#form_edit_pelanggan').attr('action'),
        type: 'post' ,
        data:  $('#form_edit_pelanggan').serialize(),
        dataType: 'json',
        success: function(response) {
          if(response.success == true) {
            $('#info').append('<div class="alert alert-success">' + 'Data Berhasil Di Ubah' + '</div>');
            $('.form-group').removeClass('has-error').removeClass('has-success');
            $('.text-danger').remove();
            $('#form_edit_pelanggan')[0].reset();

            $('.alert-success').delay(500).show(10, function() {
                $('#form_edit_pelanggan').delay(3000).hide(10, function() {
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