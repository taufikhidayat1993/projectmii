
                        <!-- END Notification Item-->
                        <!-- START Notification Item-->
					<?php
					foreach($user as $u){					
					?>
                        <div class="notification-item unread clearfix">
                          <div class="heading">
                            <a href="#" class="text-complete pull-left">
                              <i class="fa fa-user m-r-10"></i>
                              <span class="bold"><?php echo $u->name; ?></span>
                              <span class="fs-12 m-l-10"><?php echo $u->sub_service_name; ?></span>
                            </a>
                            <span class="pull-right time"><?php echo $u->date_order?></span>
                          </div>
                          <!-- START Notification Item Right Side-->
                          <div class="option">
                            <a href="#" class="mark"></a>
                          </div>
                          <!-- END Notification Item Right Side-->
                        </div>
						<?php
					}
					?>
                       