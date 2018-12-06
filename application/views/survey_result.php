<br> 
<div class="content" id="page">
  <!-- START CONTAINER FLUID -->
  <div class="container-fluid container-fixed-lg">
    <ul class="breadcrumb">
      <li>
        <a href="#">Transaction</a>
      </li>
      <li><a href="#" class="active">Survey Result</a>
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
                <div class="panel-title">Survey Result
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
                          <th style="width:10%">Customer</th>
                          <th style="width:10%">Mandor</th>
                          <th style="width:10%">Date</th>
                          <th style="width:10%">Status</th>
                          <th style="width:15%">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                          <?
                              $getSO  = $this->db->query("SELECT repair_order.repair_order_id, survey_order.survey_order_id, user.name AS u_name, coordinator.name AS c_name, survey_order.date_survey, repair_order.repair_order_status FROM repair_order JOIN survey_order ON repair_order.survey_order_id = survey_order.survey_order_id JOIN user ON survey_order.user_id = user.user_id JOIN sub_service ON sub_service.sub_service_id = survey_order.sub_service_id JOIN coordinator ON coordinator.coor_id = survey_order.coor_id");
                              $i        = 1;
                              foreach($getSO->result() as $data):
                          ?>
                          <tr>
                              <td><?=$i++;?></td>
                              <td><?=$data->survey_order_id?></td>
                              <td><?=$data->u_name?></td>
                              <td><?=$data->c_name?></td>
                              <td><?=$data->date_survey?></td>
                              <td><?=$data->repair_order_status?></td>
                              <td><a href="<?=base_url('transaction/repairDetail/'.$data->repair_order_id)?>" class="btn btn-sm  btn-rounded btn-warning" onclick="editUser()"><i class="fa fa-edit"></i></button>
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