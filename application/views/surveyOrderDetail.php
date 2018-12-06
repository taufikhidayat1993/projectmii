<br> 
<div class="content" id="page">
  <!-- START CONTAINER FLUID -->
  <div class="container-fluid container-fixed-lg">
    <ul class="breadcrumb">
      <li>
        <a href="#">Transaction</a>
      </li>
      <li>
          <a href="#">Survey Order</a>
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
                              <p><?=$survey->survey_order_id?></p>
                            </td>
                          </tr>
                          <tr>
                            <td class="v-align-middle">
                              <p>Service Type</p>
                            </td>
                            <td class="v-align-middle">
                              <p><?=$survey->sub_service_name?></p>
                            </td>
                          </tr>
                          <tr>
                            <td class="v-align-middle">
                              <p>Address</p>
                            </td>
                            <td class="v-align-middle">
                              <p><?=$survey->address?></p>
                            </td>
                          </tr>
                          <tr>
                            <td class="v-align-middle">
                              <p>Order Date</p>
                            </td>
                            <td class="v-align-middle">
                              <p><?=$survey->date_order?></p>
                            </td>
                          </tr>
                            <tr>
                            <td class="v-align-middle">
                              <p>Detail of Damage</p>
                            </td>
                            <td class="v-align-middle">
                              <p><?=$survey->damage_desc?></p>
                            </td>
                          </tr>
                        </tbody>
                      </table>
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
                              <p><?=$survey->name?></p>
                            </td>
                          </tr>
                          <tr>
                            <td class="v-align-middle">
                              <p>Email</p>
                            </td>
                            <td class="v-align-middle">
                              <p><?=$survey->email?></p>
                            </td>
                          </tr>
                          <tr>
                            <td class="v-align-middle">
                              <p>Phone</p>
                            </td>
                            </td>
                            <td class="v-align-middle">
                              <p><?=$survey->phone?></p>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <!-- END PANEL -->
                <div class="panel panel-transparent">
                  <div class="panel-heading">
                    <div class="panel-title">Photo</div>
                  </div>
                  <div class="panel-body">
                    <div class="table-responsive">
                        <?
                        if(!is_null($image)){
                            foreach($image as $img){ ?>
                                <img src="<?=$img->order_image_path;?>" width="30%"> &nbsp;
                        <?    }
                        }
                        ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
  </div>
  <!-- END CONTAINER FLUID -->
</div>