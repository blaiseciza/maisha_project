<!DOCTYPE html>

<!-- Mirrored from demo.themepixels.com/webpage/katniss/index.html by HTTrack Website Copier/3.x [XR&CO'2008], Wed, 27 Nov 2013 21:46:44 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Maisha Count Application</title>
<link rel="stylesheet" href="assets/css/style.default.css" type="text/css" />
<script type="text/javascript" src="assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-migrate-1.1.1.min.js"></script>
</head>

<body class="loginbody">
<div class="loginwrapper">
	<div class="loginwrap zindex100 animate2 bounceInDown">
	<h1 class="logintitle"><span class="iconfa-lock"></span> Ouverture de session<span class="subtitle">Salut! Pour commencer ouvrez la session</span></h1>
        <div class="loginwrapperinner">
            <form id="loginform" action="loginttt.php" method="post" enctype="multipart/form-data">
                <p class="animate4 bounceIn"><input type="text" id="username" name="username"  placeholder="Utilisateur" required /></p>
                <p class="animate5 bounceIn"><input type="password" id="password" name="motpasse" placeholder="Motdepasse"  /></p>
                
                <p class="animate6 bounceIn"><input class="btn btn-default btn-block" type="submit" value="Connexion"/></p>
               <!-- <p class="animate7 fadeIn"><a href="#"><span class="icon-question-sign icon-white"></span> Forgot Password?</a></p> -->
            </form>
        </div><!--loginwrapperinner-->
    </div>
    <div class="loginshadow animate3 fadeInUp"></div>
</div><!--loginwrapper-->

<script type="text/javascript">
jQuery.noConflict();

jQuery(document).ready(function(){
	
	var anievent = (jQuery.browser.webkit)? 'webkitAnimationEnd' : 'animationend';
	jQuery('.loginwrap').bind(anievent,function(){
		jQuery(this).removeClass('animate2 bounceInDown');
	});
	
	jQuery('#username,#password').focus(function(){
		if(jQuery(this).hasClass('error')) jQuery(this).removeClass('error');
	});
	
	jQuery('#loginform button').click(function(){
		if(!jQuery.browser.msie) {
			if(jQuery('#username').val() == '' || jQuery('#password').val() == '') {
				if(jQuery('#username').val() == '') jQuery('#username').addClass('error'); else jQuery('#username').removeClass('error');
				if(jQuery('#password').val() == '') jQuery('#password').addClass('error'); else jQuery('#password').removeClass('error');
				jQuery('.loginwrap').addClass('animate0 wobble').bind(anievent,function(){
					jQuery(this).removeClass('animate0 wobble');
				});
			} else {
				jQuery('.loginwrapper').addClass('animate0 fadeOutUp').bind(anievent,function(){
					jQuery('#loginform').submit();
				});
			}
			return false;
		}
	});
});
</script>
</body>

<!-- Mirrored from demo.themepixels.com/webpage/katniss/index.html by HTTrack Website Copier/3.x [XR&CO'2008], Wed, 27 Nov 2013 21:46:44 GMT -->
</html>
