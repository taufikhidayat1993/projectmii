 <div   data-always-visible="1" data-rail-visible1="1">
        
                                                            <div class="row">
                                                               <div class="portlet-body form">
                                                                  <div class="form-body">
                                        <div class="table-scrollable">
                                                               <table class="table table-striped table-hover">
															   <thead>
															   <tr>
															   <th>Tgl Request</th>
															   <th>No. Request</th>
															   <th>Keterangan</th>
                                 <th>Action</th>
															   </tr>
															   </thead>
															   <tbody>
															   <?php
															   foreach($list as $row){																   
																   echo"<tr>
                                   <td>".$row->tgl_pr."</td>
                                   <td>".$row->kode_pr."</td>
                                   <td>".$row->keterangan."</td>
                                   <td><a href='".site_url('purchase_order/get_request/'.$row->kode_pr.'')."'  class='btn btn-primary btn-sm' id='get_request' >Pilih</a></td>
                                   </tr>";
															   }
															   
															   ?>
															   </tbody>
															   </table>
                               </div></div>
                                                    </div>
                                                              
                                                            </div>
                                                        </div>
                                                        <script>
function Getpr(id)
{
alert(id);

}

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