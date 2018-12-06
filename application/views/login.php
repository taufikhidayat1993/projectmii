
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    
<!-- Mirrored from keenthemes.com/preview/metronic/theme/admin_1/page_user_login_5.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 01 Jun 2017 00:07:35 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
        <meta charset="utf-8" />
        <title>Metronic Admin Theme #1 | User Login 5</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #1 for " name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        
        <link href="<?php echo base_url('assets/')?>global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <link href="<?php echo base_url('assets/')?>global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url('assets/')?>global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
       <link href="<?php echo base_url('assets/')?>global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<?php echo base_url('assets/')?>global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
       <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="<?php echo base_url('assets/')?>pages/css/login-5.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->
<script type="text/javascript">	
function Login(){ // Create `click` event function for login
  var username = $('#username'); // Get the username field
  var password = $('#password'); // Get the password field
  // Get the login result div
  // Set the pre-loader can be an animation
  if(username.val() == ''){ // Check the username values is empty or not
   username.focus(); // focus to the filed
   alert("kosong");
   return false;
  }
  if(password.val() == ''){ // Check the password values is empty or not
   password.focus();
 
   return false;
  }
  if(username.val() != '' && password.val() != ''){ // Check the username and password values is not empty and make the ajax request
   var UrlToPass = 'username='+username.val()+'&password='+password.val();
   $.ajax({ // Send the credential values to another checker.php using Ajax in POST menthod
   type : 'POST',
   data : UrlToPass,
   url  : '<?php echo base_url(); ?>auth/user_login',
   success: function(responseText){ // Get the result and asign to each cases
    if(responseText == 0){
     $('#notification').pgNotification({
                        style: 'bar',
                        message: 'Invalid username or password',
                        position: 'top',
                        timeout: 0,
                        type: 'danger'
                    }).show();
    }
    else if(responseText == 1){
     window.location = '<?php echo base_url(); ?>dashboard';
    }
    else{
     alert(responseText);
    }
   }
   });
  }
  return false;
 }

</script>
    <body class=" login">
        <!-- BEGIN : LOGIN PAGE 5-1 -->
        <div class="user-login-5">
            <div class="row bs-reset">
                <div class="col-md-6 bs-reset mt-login-5-bsfix">
                    <div class="login-bg" style="background-image:url(http://localhost/aplikasimii/assets/pages/img/login/bg1.jpg)">
                        <img class="login-logo" src="<?php echo base_url('assets/')?>pages/img/login/logo.png" /> </div>
                </div>
                <div class="col-md-6 login-container bs-reset mt-login-5-bsfix">
                    <div class="login-content">
                        <h1>Metronic Admin Login</h1>
                        <p> Lorem ipsum dolor sit amet, coectetuer adipiscing elit sed diam nonummy et nibh euismod aliquam erat volutpat. Lorem ipsum dolor sit amet, coectetuer adipiscing. </p>
                      <form id="logForm">
		            	<fieldset>
		                	<div class="form-group">
		                    	<input class="form-control" placeholder="Email" type="text" id="username" name="username">
		                	</div>
		                	<div class="form-group">
		                    	<input class="form-control" id="password" placeholder="Password" type="password" name="password">
		                	</div>
		                	
		            	</fieldset>
		        	</form>
					<button type="button" onclick="Login()" class="btn btn-lg btn-primary btn-block">Login</button>
				
                        <!-- BEGIN FORGOT PASSWORD FORM -->
						
                     
					 
					   <!-- END FORGOT PASSWORD FORM -->
                    </div>
                    <div class="login-footer">
                        <div class="row bs-reset">
                            <div class="col-xs-5 bs-reset">
                                <ul class="login-social">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-dribbble"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-7 bs-reset">
                                <div class="login-copyright text-right">
                                    <p>Copyright &copy; Keenthemes 2015</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END : LOGIN PAGE 5-1 -->
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<script src="../assets/global/plugins/ie8.fix.min.js"></script> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="<?php echo base_url('assets/')?>global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/')?>global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/')?>global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/')?>global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/')?>global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/')?>global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="<?php echo base_url('assets/')?>global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/')?>global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/')?>global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/')?>global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="<?php echo base_url('assets/')?>global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
    
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
    
    <!-- Google Code for Universal Analytics -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../../../../../www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-37564768-1', 'auto');
  ga('send', 'pageview');
</script>
<!-- End -->

<!-- Google Tag Manager -->
<noscript><iframe src="http://www.googletagmanager.com/ns.html?id=GTM-W276BJ"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'../../../../../www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-W276BJ');</script>
<!-- End -->
</body>



<!-- Mirrored from keenthemes.com/preview/metronic/theme/admin_1/page_user_login_5.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 01 Jun 2017 00:07:39 GMT -->
</html>