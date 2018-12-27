 <div   data-always-visible="1" data-rail-visible1="1">
          <div id="info"></div>
                                                            <div class="row">
                                                               <div class="portlet-body form">
                                                                <form class="form-horizontal" id="form_add_pelanggan" action="<?php echo site_url('account/account_edit_data/'.$account->kode_account.''); ?>" method="post">
                                                                     <div class="form-body">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Header</label>
                                                                <div class="col-md-9">
                                                                  <select class="form-control" id="headerid" name="headerid">
                                                                  <?php 
                                                                  foreach($list as $row){
                                                                    if($account->headerid == $row->headerid) {
                                                                    ?>
                                                                           <option value="<?php echo $row->headerid; ?>" selected><?php echo $row->nama_header; ?></option>
                                                                    <?php
                                                                  }else{
                                                                    ?>
<option value="<?php echo $row->headerid; ?>"><?php echo $row->nama_header; ?></option>
                                                                    <?php
                                                                  }
                                                                  } 
                                                                  ?>
                                                                </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">No Account</label>
                                                                <div class="col-md-3">
                                                                    <input type="text" id="kode_account" name="kode_account" class="form-control col-md-3" value="<?php echo $account->kode_account; ?>" placeholder="Enter text">
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Nama Akun</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" id="nama_account" name="nama_account" class="form-control" value="<?php echo $account->nama_account; ?>" placeholder="Enter text">   
                                                                </div>
                                                            </div>
                                                             <div class="form-group">
                                                                <label class="col-md-3 control-label">Tipe</label>
                                                                <div class="col-md-9">
                                                                  <select class="form-control" name="tipe" id="tipe">
                                                                    <?php
                                                                        if($account->tipe=='Debet'){
                                                                         ?>
                                                                     <option value="Debet" selected>Debet</option>
                                                                     <option value="Kredit">Kredit</option>
                                                                         <?php
                                                                        }else {
                                                                          ?>
                                                                         <option value="Debet">Debet</option>
                                                                     <option value="Kredit" selected>Kredit</option>
                                                                             <?php
                                                                        }
                                                                    ?>
                                                                    
                                                                  </select>
                                                                </div>
                                                            </div>
                                                           
                                                        </div>
                                                        </form>
                                                    </div>
                                                              
                                                            </div>
                                                        </div>
                                                        <script>
function simpanaccount()
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