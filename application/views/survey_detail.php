<br>
<div class="content" id="page">
    <!-- START CONTAINER FLUID -->
    <div class="container-fluid container-fixed-lg">
        <ul class="breadcrumb">
            <li>
                <a href="#">Transaction</a>
            </li>
            <li>
                <a href="#">Survey Result</a>
            </li>
            <li>
                <a href="#" class="active">Detail</a>
            </li>
        </ul>
        <!-- END BREADCRUMB -->
    </div>
    <!-- START CONTAINER FLUID -->
    <div class="container-fluid container-fixed-lg">
        <div class="row">
            <div class="col-md-6">
                <!-- START PANEL -->
                <div class="panel panel-transparent">
                    <div class="panel-heading">
                        <div class="panel-title">Survey Order</div>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped" id="stripedTable">
                                <tbody>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Order ID</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->survey_order_id?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Service Type</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->sub_service_name?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Address</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->address?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Order Date</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->date_order?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Detail of Damage</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->damage_desc?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Survey Date</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->date_survey?>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                <div class="panel panel-transparent">
                    <div class="panel-heading">
                        <div class="panel-title">Survey Result</div>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped" id="stripedTable">
                                <tbody>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Material</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->material?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Man Power</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->man_power?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Repair Cost</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>Rp.
                                                <?php echo number_format($survey->repair_cost, 0, ',', '.') ; ?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Repair Schedule</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->schedule?>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="col-sm-5 m-t-10 sm-m-t-10">
                              <button type="button" class="btn btn-primary btn-block" onclick="saveCost()">Edit Schedule and Cost</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- START PANEL -->
                <div class="panel panel-transparent">
                    <div class="panel-heading">
                        <div class="panel-title">Customer</div>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped" id="stripedTable">
                                <tbody>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Name</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->name?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Email</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->email?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Phone</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$survey->phone?>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-transparent">
                    <div class="panel-heading">
                        <div class="panel-title">Coordinator</div>
                        <?
                      $getCoor = $this->db->query("SELECT * FROM coordinator WHERE coor_id = ".$survey->coor_id."")->row();
                      ?>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped" id="stripedTable">
                                <tbody>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Name</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$getCoor->name?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Email</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$getCoor->email?>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="v-align-middle">
                                            <p>Phone</p>
                                        </td>
                                        <td class="v-align-middle">
                                            <p>
                                                <?=$getCoor->phone?>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- END CONTAINER FLUID -->
</div>

<div class="modal fade stick-up" id="myModalUser" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header clearfix text-left">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
          </button>
          <h5 id="title"><span class="semi-bold">Edit Schedule and Cost</span></h5>
        </div>
        <div class="modal-body">
          <form role="form" id="addMandor">
            <div class="form-group-attached">
              <div class="row">
                  <input type="hidden" id="id" name="id" value="<?=$survey->repair_order_id;?>">
                  <input type="hidden" id="id_survey" name="id_survey" value="<?=$survey->survey_order_id;?>">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Schedule</label>
                    <input type="text" class="form-control" id="schedule" name="schedule">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group form-group-default">
                    <label>Survey Cost</label>
                    <input type="text" class="form-control" id="repair_cost" name="repair_cost">
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
    
    <script>
        var BASE_URL    = '<? echo base_url(); ?>';
        
        function saveCost(){
            $('#myModalUser').modal();
        }
        
        function doSave(){
        $('#myModalUser').modal('hide');
        $.ajax({
            url: BASE_URL + 'transaction/update/',
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
                        message: 'Success',
                        position: 'top',
                        timeout: 0,
                        type: 'success'
                    }).show();
                } else if(response == "failed"){
                    $('body').pgNotification({
                        style: 'bar',
                        message: 'Failed',
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