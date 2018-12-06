<br> 
<script type="tex/javascript">
</script>
<div class="content" id="page">
  <!-- START CONTAINER FLUID -->
  <div class="container-fluid container-fixed-lg">
    <ul class="breadcrumb">
      <li>
        <a href="#">User</a>
      </li>
      <li><a href="#" class="active">Koordinator & Tukang</a>
      </li>
    </ul>
    <!-- END BREADCRUMB -->
  </div>
  <!-- START CONTAINER FLUID -->
  <div class="container-fluid container-fixed-lg">
    <div class="panel panel-transparent">
      <div class="panel-body">
        <div class="row">
            <div id="portlet-circular" class="panel panel-default">
              <div class="panel-heading ">
                <div class="panel-title">Koordinator & Tukang
                </div>
                <div class="panel-controls">
                  <ul>
                    <li><a href="#" class="portlet-collapse" data-toggle="collapse"><i class="portlet-icon portlet-icon-collapse"></i></a>
                    </li>
                    <li><a href="#" class="portlet-refresh" onclick="loadData()"><i class="portlet-icon portlet-icon-refresh"></i></a>
                    </li>
                    <li><a href="#" class="portlet-close" data-toggle="close"><i class="portlet-icon portlet-icon-close"></i></a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="panel-body">
                  <div class="pull-left">
                      <div class="col-xs-12">
                          <button id="show-modal" onclick="showUser()" class="btn btn-primary btn-cons"><i class="fa fa-plus"></i> Add Koordinator & Tukang </button>
                      </div>
                  </div>
                  <div class="pull-right">
                      <div class="col-xs-12">
                        <input type="text" id="search-table" class="form-control pull-right" placeholder="Search">
                      </div>
                  </div>
                  <br>
                  <table class="table table-hover demo-table-search" id="tableWithSearch">
                      <thead>
                        <tr>
                          <th style="width:5%">No</th>
                          
                          <th style="width:10%">Name</th>
						  <th style="width:10%">Posisi</th>
                        
                          <th style="width:10%">Mobile Phone</th>
                          <th style="width:10%">Status</th>
                          <th style="width:10%">Join Date</th>
                          <th style="width:15%">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                          <?
                              $getUser  = $this->db->query("SELECT a.*,b.nama_area FROM coordinator a left join area b on a.kode_area=b.kode_area");
                              $i        = 1;
                              foreach($getUser->result() as $data):
                              ?>
                          <tr>
                              <td><?=$i++;?></td>
                              
                              <!--<td><? if($data->photo_profile == NULL) { echo '';} else{ ?><img src="<? echo base_url('assets/user/'.$data->photo_profile)?>" width="100%"><? } ?></td>-->
                              <td><?=$data->name?></td>
							  <td><?php 
							  if ($data->posisi==1) {
								  echo "Koordinator<br>";
								  echo "Area : <span style='color:blue;'>".$data->nama_area."</span>";
							  }else {
								 echo "Tukang<br>";  
								 $view=$this->db->query("SELECT name FROM coordinator where coor_id='".$data->coor_id."'");
								 $row=$view->row_array();
								echo "Coord : <span style='color:red;'>".$row['name']."</spa>";
								 
							  }?></td>
                         
                              <td><?=$data->phone?></td>
                              <td>Active</td>
                              <td><?=$data->join_date?></td>
                              <td><button class="btn btn-sm  btn-rounded btn-warning" onclick="editUser()"><i class="fa fa-edit"></i></button>
                                <button class="btn btn-sm  btn-rounded btn-danger" onclick="deleteUser()"><i class="fa fa-trash"></i></button>
                              </td>
                          </tr>
                          <?
                          endforeach;
                          ?>
                      </tbody>
                    </table>
					 
                </div>
                <div class="portlet-progress" id="progress" style="background-color: rgba(255, 255, 255, 0.8); display: block; display: none;"><div class="progress-circle-indeterminate progress-circle-master"></div></div>                
            </div>
        </div>
      </div>
    </div>
  </div>
  <!-- END CONTAINER FLUID -->
</div>

<div class="modal fade stick-up" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header clearfix text-left">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
          </button>
          <h5 id="title"><span class="semi-bold">Edit User</span></h5>
        </div>
        <div class="modal-body">
          <form role="form">
            <input type="hidden" id="userID">
            <div class="form-group-attached">
              <div class="row">
                <div class="col-sm-5">
                  <div class="form-group form-group-default">
                    <label>Firstname</label>
                    <input type="text" class="form-control" id="firstname">
                  </div>
                </div>
                <div class="col-sm-7">
                  <div class="form-group form-group-default">
                    <label>Lastname</label>
                    <input type="text" class="form-control" id="lastname">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Phone</label>
                    <input type="email" class="form-control" id="phone">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Email</label>
                    <input type="text" class="form-control" id="email">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default form-group-default-select2">
                    <label class="">Usergroup</label>
                    <select class="full-width" data-placeholder="Select Usergroup" data-init-plugin="select2" id="usergroup">
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </form>
          <div class="row">
            <div class="col-sm-4 col-sm-offset-8 m-t-10 sm-m-t-10">
              <button type="button" class="btn btn-primary btn-block m-t-5" onclick="doEdit()">Save</button>
            </div>
          </div>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade stick-up" id="myModalUser" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header clearfix text-left">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
          </button>
          <h5 id="title"><span class="semi-bold">Add Koordinator</span></h5>
        </div>
        <div class="modal-body">
          <form role="form" id="addMandor">
            <div class="form-group-attached">
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Name</label>
                    <input type="text" class="form-control" id="name" name="name">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>NIK</label>
                    <input type="text" class="form-control" id="nik" name="nik">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Phone</label>
                    <input type="email" class="form-control" id="phone" name="phone">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Email</label>
                    <input type="text" class="form-control" id="email" name="email">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Birth place</label>
                    <input type="text" class="form-control" id="birth_place" name="birth_place">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Birth date</label>
                    <input type="text" class="form-control" id="birth_date" name="birth_date">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Address</label>
                    <input type="text" class="form-control" id="address" name="address">
                  </div>
                </div>
              </div>
			  <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Status</label>
                    <input type="radio" onClick="Show()" checked name="status"  > Koordinator
					 <input type="radio" onClick="Hidden()" name="status"  > Tukang
                  </div>
                </div>
				
              </div>
			    <div id="dataarea" >
                 <div class="form-group form-group-default"  area-hidden="true">
                    <label>Area</label>
					  <select name="kode_area" class="full-width" data-placeholder="Select Usergroup" data-init-plugin="select2" id="kode_area">
					<?php
					 $getarea = $this->db->query("SELECT * FROM  area");
                              $i        = 1;
                              foreach($getarea->result() as $dataarea):							  
					?>
					<option value='<?php echo $dataarea->kode_area; ?>'>
					<?php echo $dataarea->nama_area; ?>
                     <?php
                          endforeach;
                          ?>
						  </select>
                  </div>
				</div>
			<input type="hidden" value="1" id="posisi" name="posisi">
				 <div class="row" id="datakoordinator" style="display:none;">
				<div class="col-sm-12">
                  <div class="form-group form-group-default"  area-hidden="true">
                    <label>Koordinator</label>
			<select class="full-width" data-placeholder="Select Usergroup" data-init-plugin="select2" id="coordinator" name="coordinator">
					<?php
					 $getarea = $this->db->query("SELECT * FROM  coordinator where posisi=1");
                              $i        = 1;
                              foreach($getarea->result() as $dataarea):							  
					?>
					<option value='<?php echo $dataarea->coor_id; ?>'>
					<?php echo $dataarea->name; ?>
                     <?php
                          endforeach;
                          ?>
						  </select>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Foto KTP</label>
                    <input type="file" class="form-control" id="ktp" name="ktp" style="text-decoration:none;">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Foto KK</label>
                    <input type="file" class="form-control" id="kk" name="kk" style="text-decoration:none;">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Foto SKCK</label>
                    <input type="file" class="form-control" id="skck" name="skck" style="text-decoration:none;">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Work Experience</label>
                    <input type="text" class="form-control" id="pengalaman_kerja" name="pengalaman_kerja">
                  </div>
                </div>
              </div>
            </div>
          </form>
          <div class="row">
            <div class="col-sm-4 col-sm-offset-8 m-t-10 sm-m-t-10">
              <button type="button" onclick="doSave()" class="btn btn-primary btn-block m-t-5">Save</button>
            </div>
          </div>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script type="text/javascript">
    var BASE_URL    = '<? echo base_url(); ?>'
    function showUser(){
        $('#myModalUser').modal();
    }
    
function Show() {
$("#posisi").val(1);
 document.getElementById('datakoordinator').style.display = 'none';
	document.getElementById('dataarea').style.display = 'block';

  } 
  function Hidden() { 
      document.getElementById('dataarea').style.display = 'none';
	   document.getElementById('datakoordinator').style.display = 'block';
  $("#posisi").val(2);
  }  
    function doSave(){
        $('#myModalUser').modal('hide');
        $.ajax({
            url: BASE_URL + 'user/addUser/',
            type: 'POST',
            data:  new FormData($("#addMandor")[0]),
            processData: false,
            contentType: false,
            success: function (response) {
                console.log(response);
                
                if(response == "success"){
                    $('#tableWithSearch').show();
                    $('body').pgNotification({
                        style: 'bar',
                        message: 'User successfully added',
                        position: 'top',
                        timeout: 0,
                        type: 'success'
                    }).show();
                } else if(response == "failed"){
                    $('body').pgNotification({
                        style: 'bar',
                        message: 'Failed adding user',
                        position: 'top',
                        timeout: 0,
                        type: 'danger'
                    }).show();
                } else {
                    $('body').pgNotification({
                        style: 'bar',
                        message: response,
                        position: 'top',
                        timeout: 0,
                        type: 'danger'
                    }).show();
                }          
            }
        });
    }
</script>