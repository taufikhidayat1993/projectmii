<div class="page-bar">
  <?php echo $this->breadcrumb->show() ?>

                     
					   </div>
					   <div class='row'><br>
				 <div class='col-md-6'>
				   <div class='portlet light bordered'>
                                    <div class='portlet-body form'>
									 <div id="info"></div>
									<form action="<?php echo base_url();?>purchases/purchase_request_simpan" class="form-horizontal"  method="post" id="form_sample_1" accept-charset="utf-8">
									
                                            <div class='form-body'>
                                                <div class='form-group'>
                                                    <label class='col-md-3 control-label'>Nama Barang</label>
                                                    <div class='col-md-9'>
														<div class='input-group'>
                      <input type='text'  id="nim" name="nim" placeholder='ketik nama barang ...'  class='form-control'>
            
					   <span class='input-group-btn'>
							<a href='#basic' class='btn blue' data-toggle='modal'   >Tambah</a>
													   </span>
													</div>
                                                    </div>
                                                </div>
												<div class='form-group'>
                                                    <label class='col-md-3 control-label'>QTY</label>
                                                    <div class='col-md-6'>
													<div class='input-group'>
                                                        <input type='text'id="username" name="username" placeholder='QTY..'  class='form-control input-small' >
                                                       <span class='input-group-btn'>
													   <div class='btn blue' id='satuan'>Satuan</div>
													   </span>
													</div>
													
                                                    </div>
                                                </div>
												<div class='form-group'>
                                                    <label class='col-md-3 control-label'>Satuan</label>
                                                    <div class='col-md-6'>
													<input type="text" id="email" name="email" class="form-control" >
													<?php
													/*
														$no = 1;
		                                         foreach($user as $u){
													 echo "<option value='".$u->id_satuan."'>".$u->nama_satuan."</option>";
													 
													 
												 }
												 */
?>													 
													
											
                                                    </div>
                                                </div>
											</div>
											<div class='form-actions'>
											<div class='row'>
											<button class='w3-btn w3-red' type="submit" style='width:100%;' id="btnSave" ><i class='fa fa-cart-plus'></i> Tambah Barang</button>
											</div>
											</div>
										</form>
									</div>
					</div>
				
					
				</div>
				<div class='col-md-6'>
				 <div class="portlet">
				<div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-shopping-cart"></i>List Request Product </div>
                                      
                                    </div>
     <div class="portlet-body">
                                        <div class="table-scrollable">
			<table class="table table-striped table-hover">
						<thead>
						<tr class='w3-blue'>
							<th>#</th>
							<th>BARANG</th>
							<th>JUMLAH</th>
							<th>OPSI</th>
						
						</tr>
						</thead>

						<tbody><tr>
								<td>$no</td>
							
								<td>$p[nama_barang]</td>
								<td>$p[qty] $p[satuan]</td>
							
								<td><a href='$aksi?mod=pembelian&act=batal&id=$p[kode_barang]' onclick=\"return confirm('Yakin ingin membatalkan?');\"><i class='fa fa-close w3-tiny w3-text-grey'></i></a></td>
							</tr>
						</tbody>
						
					</table>
</div></div></div>
					<div class='w3-row-padding'>
						<div class='w3-col s7'>&nbsp;</div>
						    <div class='w3-col s5'>
							<form action='$aksi?mod=pembelian&act=simpan' method='POST'>
							<label class='w3-label w3-tiny'>PR No :</label>
					<input type='text' name='no_faktur' id='no_faktur' class='w3-input w3-tiny' placeholder='Nomor Faktur ...' required>
                                   <label class='w3-label w3-tiny'>Nama Pemohon :</label>
								<input type='text' name='supplier'  class='w3-input w3-tiny' placeholder='ketik Nama Supplier ...' required>

								<label class='w3-label w3-tiny'>Tanggal Purchase Request :</label>
								<input type='text' name='tglbeli' class='w3-input w3-tiny dp' value='".date('Y-m-d')."' required>

														<p><button class='w3-btn w3-right w3-tiny' onclick=\"return confirm('Klik OK untuk melanjutkan');\"><i class='fa fa-save'></i> Simpan Pembelian</button></p>
							</form>
						</div>
						
					</div>

				</div>
			
			</div>
			
                                              
                                            </div>
								
			</div>
			<div class='modal fade' id='basic' tabindex='-1' role='basic' aria-hidden='true'>
                                            <div class='modal-dialog'>
                                                <div class='modal-content'>
                                                    <div class='modal-header'>
                                                        <button type='button' class='close' data-dismiss='modal' aria-hidden='true'></button>
                                                        <h4 class='modal-title'>New Item</h4>
                                                    </div>
                                                <div class='modal-body'> 
												<div class='row'>													
                                                 <div class='form-group'>
                                                    <label class='col-md-3 control-label'>Nama Barang1</label>
                                                      <div class='col-md-9'>
                                                          <input type='text' id='nama_barang' name='qty' placeholder='Nama Barang'  class='form-control input-sm'>
                                                      </div>
                                                </div>
												<br>
												 <div class='form-group'>
                                                    <label class='col-md-3 control-label'>Satuan</label>
                                                      <div class='col-md-9'>
                                                          <select class='form-control' id='id_satuan'>";
														  $sq=mysql_query("select nama_satuan from tb_barang_satuan order by nama_satuan");
														  while($row=mysql_fetch_array($sq)){
											echo'<option value="'.$row['nama_satuan'].'">'.$row['nama_satuan'].'</option>';
														  }
														  echo"</select>
                                                      </div>
                                                </div>
												</div>
													</div>
                                                    <div class='modal-footer'>
                                                    <button type='button' class='btn dark btn-outline' data-dismiss='modal'>Close</button>
                                                    <button type='button' id='simpanitem' class='btn green'>Simpan Item</button>
                                            </div>
                                 </div>";

			?>
				 <script type="text/javascript">
				  $('#form_sample_1').submit(function(e){
    e.preventDefault();
     var fa = $(this);

      $.ajax({
        url: fa.attr('action'),
        type: 'post' ,
        data: fa.serialize(),
        dataType: 'json',
        success: function(response) {
          if(response.success == true) {
            $('#info').append('<div class="alert alert-success">' + 
              'Data Tersimpan' + '</div>');
            $('.form-group').removeClass('has-error')
                            .removeClass('has-success');
            $('.text-danger').remove();
            fa[0].reset();

            $('.alert-success').delay(500).show(10, function() {
                $(this).delay(3000).hide(10, function() {
                    $(this).remove();
                });
            })

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

  });
				
    var site = "<?php echo site_url();?>";
    $(function(){
        $('#countries').autocomplete({
            serviceUrl: site+'Pencarian/get_data',
        });
    });
    </script>  
			<?php