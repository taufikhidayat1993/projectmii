
                                                               <div class="portlet-body form">
                                                                  <div class="form-body">
                                        <div class="table-scrollable">
                                                               <table class="table table-striped table-hover" id="daftarpo">
															   <thead>
															   <tr>
															   <th>Tgl PO</th>
															   <th>No. PO</th>
                                 <th>Total Po</th>
                                 <th>PPN</th>
                                 <th>Ammount</th>
															   <th>Keterangan</th>
                                 </tr>
															   </thead>
															   <tbody>
															   <?php
															   foreach($list as $row){																   
																   echo"<tr>
                                   <td>".$row->tgl_po."</td>
                                   <td id='kode_po'>".$row->kode_po."</td>
                                   <td id='total_po'>".$row->total_po."</td>
                                    <td id='ppn'>".$row->total_ppn."</td>
                                    <td id='ppn'>".$row->ammount."</td>
                                   <td>".$row->keterangan."</td>
                                  
                                   </tr>";
															   }
															   
															   ?>
															   </tbody>
															   </table>
                               </div></div>
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