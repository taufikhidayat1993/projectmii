<br> 
<div class="content" id="page">
  <!-- START CONTAINER FLUID -->
  <div class="container-fluid container-fixed-lg">
    <ul class="breadcrumb">
      <li>
        <a href="#">Transaction</a>
      </li>
      <li><a href="#" class="active">Payment Confirmation</a>
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
                <div class="panel-title">payment confirmation
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
                          <th style="width:10%">Order ID</th>
                          <th style="width:10%">User</th>
                          <th style="width:10%">Transfer Date</th>
                          <th style="width:10%">Bank Name</th>
                          <th style="width:10%">Bank Account</th>
                          <th style="width:10%">Account Number</th>
                          <th style="width:10%">Status</th>
                          <th style="width:15%">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td>1</td>
                              <td>TK1712000002</td>
                              <td>John Doe</td>
                              <td>04 Dec 2017 23:59</td>
                              <td>BCA</td>
                              <td>John Doe</td>
                              <td>Success</td>
                              <td>Confirmed</td>
                              <td><button class="btn btn-sm  btn-rounded btn-warning" onclick="editUser()"><i class="fa fa-edit"></i></button>
                                <button class="btn btn-sm  btn-rounded btn-danger" onclick="deleteUser()"><i class="fa fa-trash"></i></button>
                              </td>
                          </tr>
                          <tr>
                              <td>2</td>
                              <td>TK1712000003</td>
                              <td>John Doe</td>
                              <td>04 Dec 2017 23:59</td>
                              <td>BCA</td>
                              <td>John Doe</td>
                              <td>Success</td>
                              <td>Confirmed</td>
                              <td><button class="btn btn-sm  btn-rounded btn-warning" onclick="editUser()"><i class="fa fa-edit"></i></button>
                                <button class="btn btn-sm  btn-rounded btn-danger" onclick="deleteUser()"><i class="fa fa-trash"></i></button>
                              </td>
                          </tr>
                          <tr>
                              <td>1</td>
                              <td>TK1712000004</td>
                              <td>John Doe</td>
                              <td>04 Dec 2017 23:59</td>
                              <td>BCA</td>
                              <td>John Doe</td>
                              <td>Success</td>
                              <td>Confirmed</td>
                              <td><button class="btn btn-sm  btn-rounded btn-warning" onclick="editUser()"><i class="fa fa-edit"></i></button>
                                <button class="btn btn-sm  btn-rounded btn-danger" onclick="deleteUser()"><i class="fa fa-trash"></i></button>
                              </td>
                          </tr>
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
          <h5 id="title"><span class="semi-bold">Add User</span></h5>
        </div>
        <div class="modal-body">
          <form role="form" id="addUser">
            <div class="form-group-attached">
              <div class="row">
                <div class="col-sm-5">
                  <div class="form-group form-group-default">
                    <label>Firstname</label>
                    <input type="text" class="form-control" id="u_firstname">
                  </div>
                </div>
                <div class="col-sm-7">
                  <div class="form-group form-group-default">
                    <label>Lastname</label>
                    <input type="text" class="form-control" id="u_lastname">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Phone</label>
                    <input type="email" class="form-control" id="u_phone">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Email</label>
                    <input type="text" class="form-control" id="u_email">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Password</label>
                    <input type="password" class="form-control" id="u_pass">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default form-group-default-select2">
                    <label class="">Usergroup</label>
                    <select class="full-width" data-placeholder="Select Usergroup" data-init-plugin="select2" id="u_usergroup">
                        <option selected></option>
                        
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </form>
          <div class="row">
            <div class="col-sm-4 col-sm-offset-8 m-t-10 sm-m-t-10">
              <button type="button" class="btn btn-primary btn-block m-t-5" onclick="doSave()">Save</button>
            </div>
          </div>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script type="text/javascript">
    function doSave(){
        $('#myModalUser').modal('hide');
        $('#tableWithSearch').DataTable({
            destroy: true
        });
        $.ajax({
            url: BASE_URL + 'user/addUser/',
            type: 'POST',
            data: {
                FNAME: $('#u_firstname').val(),
                LNAME: $('#u_lastname').val(),
                PHONE: $('#u_phone').val(),
                EMAIL: $('#u_email').val(),
                PASS: $('#u_pass').val(),
                USERGROUP: $('#u_usergroup').val()
            },
            success: function (response) {
                if(response == "success "){
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
                }          
            }
        });
    }
    function doEdit(){
        $.ajax({
            url: BASE_URL + 'user/editUser/',
            type: 'POST',
            data: {
                FNAME: $('#firstname').val(),
                LNAME: $('#lastname').val(),
                PHONE: $('#phone').val(),
                EMAIL: $('#email').val(),
                USERGROUP: $('#usergroup').val(),
                UID: $('#userID').val()
            },
            success: function (response) {
                if(response == "success"){
                    $('#myModal').modal('hide');
                    $('body').pgNotification({
                        style: 'bar',
                        message: 'User successfully edited',
                        position: 'top',
                        timeout: 0,
                        type: 'success'
                    }).show();
                } else if(response == "failed"){
                    $('#myModal').modal('hide');
                    $('body').pgNotification({
                        style: 'bar',
                        message: 'Edit user failed',
                        position: 'top',
                        timeout: 0,
                        type: 'danger'
                    }).show();
                }          
            }
        });
    }
    function showUser(){
        $('#myModalUser').modal();    
    }
    function editUser(UID){
        $.ajax({
            url: BASE_URL + 'user/setDataUser/',
            type: 'POST',
            data: {
                UID: UID
            },
            success: function (response) {
                var data = JSON.parse(response);
                var usergroup_id = data.usergroup_id;
                document.getElementById("firstname").value  = data.u_firstname;
                document.getElementById("lastname").value   = data.u_lastname;
                document.getElementById("phone").value      = data.u_phone;
                document.getElementById("email").value      = data.u_email;
                document.getElementById("userID").value    = data.u_id;
                $("#usergroup > [value=" + usergroup_id + "]").attr("selected", "true");
                document.getElementById("userID").value     = data.u_id_user;
                //$("#usergroup > [value=" + u_usergroup_id + "]").attr("selected", "true");
                
                $('#myModal').modal();                
            }
        });
    }
    
    function deleteUser(UID){
        $.ajax({
            url: BASE_URL + 'user/deleteUser/',
            type: 'POST',
            data: {
                UID: UID
            },
            success: function (response) {
                if(response == "success"){
                    $('body').pgNotification({
                        style: 'bar',
                        message: 'User successfully deleted',
                        position: 'top',
                        timeout: 0,
                        type: 'success'
                    }).show();
                } else if(response == "failed"){
                    $('body').pgNotification({
                        style: 'bar',
                        message: 'Failed deleting user',
                        position: 'top',
                        timeout: 0,
                        type: 'danger'
                    }).show();
                }          
            }
        });
    }
    
    $('#portlet-circular').portlet({
        progress: 'circle',
        onRefresh: function() {
            $('#result').hide();
            $('#tableWithSearch').DataTable({
                    destroy: true
            });
            setTimeout(function() {
                // Hides progress indicator
                $('#portlet-circular').portlet({
                    refresh: false
                });
            }, 2000);
            $('#result').show();
        }
    });
    
    function setStatus(UID, STATUS){
        $.ajax({
            url: BASE_URL + 'user/setStatus/',
            type: 'POST',
            data: {
                UID: UID,
                STATUS: STATUS
            },
            success: function (response) {
                if(response == "success"){
                    $('body').pgNotification({
                        style: 'bar',
                        message: 'User status successfully changed',
                        position: 'top',
                        timeout: 0,
                        type: 'success'
                    }).show();
                } else if(response == "failed"){
                    $('body').pgNotification({
                        style: 'bar',
                        message: 'Failed change user status',
                        position: 'top',
                        timeout: 0,
                        type: 'danger'
                    }).show();
                }          
            }
        });
    }
    
    function loadData(){
        $('#tableWithSearch').hide();
        $('#progress').show();
        $('#tableWithSearch').DataTable({
                destroy: true
        });
        $('#tableWithSearch').show();
        $('#progress').hide();
    }
</script>