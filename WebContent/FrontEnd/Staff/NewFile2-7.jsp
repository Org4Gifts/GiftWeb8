<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Java Web</title>

<!-- 
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans|Open+Sans|Raleway"
	rel="stylesheet"> -->

<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/flexslider.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/style.css">

<style>
/*------------------------------------------------------------------
Partial Styles adjusted and copied from bootstrap-login.css
------------------------------------------------------------------- */
input[type="text"] {
    background-color: #fff;
    border: 1px solid #ccc;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -webkit-transition: border linear .2s, box-shadow linear .2s;
    -moz-transition: border linear .2s, box-shadow linear .2s;
    -o-transition: border linear .2s, box-shadow linear .2s;
    transition: border linear .2s, box-shadow linear .2s;
}
input[type="text"] {
    display: inline-block;
    height: 30px;
    padding: 4px 6px;
    //margin-bottom: 10px;
    margin-bottom: 2px;
    font-size: 14px;
    line-height: 20px;
    color: #555;
    vertical-align: middle;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
}
input[type="text"] {
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 500;
    color: #7e7e7e;
    border-width: 1px;
    border-style: solid;
    padding: 0 5px;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    -moz-transition: border linear .3s;
    -webkit-transition: border linear .3s;
    -o-transition: border linear .3s;
    transition: border linear .3s;
}
input[type="text"]:focus {
	background: rgba(255, 255, 255, 0.5);
}
.input-large {
    width: 280px
}
.form-actions {
    padding: 19px 20px 20px;
    margin-top: 20px;
    margin-bottom: 20px;
    background-color: #f5f5f5;
    border-top: 1px solid #e5e5e5;
    *zoom: 1
}
.form-actions:before,
.form-actions:after {
    display: table;
    line-height: 0;
    content: ""
}

.form-actions:after {
    clear: both
}

.control-group.error input {
    border-color: #b94a48;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075)
}

.control-group.error input:focus {
    border-color: #953b39;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392
}

.control-group.error .input-prepend .add-on,
.control-group.error .input-append .add-on {
    color: #b94a48;
    background-color: #f2dede;
    border-color: #b94a48
}


.control-group.success .control-label,
.control-group.success .help-block,
.control-group.success .help-inline {
    color: #468847
}

.control-group.success .checkbox,
.control-group.success .radio,
.control-group.success input,
.control-group.success select,
.control-group.success textarea {
    color: #468847
}

.control-group.success input,
.control-group.success select,
.control-group.success textarea {
    border-color: #468847;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075)
}

.control-group.success input:focus,
.control-group.success select:focus,
.control-group.success textarea:focus {
    border-color: #356635;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b
}

.control-group.success .input-prepend .add-on,
.control-group.success .input-append .add-on {
    color: #468847;
    background-color: #dff0d8;
    border-color: #468847
}

.control-group.info .control-label,
.control-group.info .help-block,
.control-group.info .help-inline {
    color: #3a87ad
}

.control-group.info .checkbox,
.control-group.info .radio,
.control-group.info input,
.control-group.info select,
.control-group.info textarea {
    color: #3a87ad
}

.control-group.info input,
.control-group.info select,
.control-group.info textarea {
    border-color: #3a87ad;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075)
}

.control-group.info input:focus,
.control-group.info select:focus,
.control-group.info textarea:focus {
    border-color: #2d6987;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3
}

.control-group.info .input-prepend .add-on,
.control-group.info .input-append .add-on {
    color: #3a87ad;
    background-color: #d9edf7;
    border-color: #3a87ad
}

input:focus:invalid,
textarea:focus:invalid,
select:focus:invalid {
    color: #b94a48;
    border-color: #ee5f5b
}

input:focus:invalid:focus,
textarea:focus:invalid:focus,
select:focus:invalid:focus {
    border-color: #e9322d;
    -webkit-box-shadow: 0 0 6px #f8b9b7;
    -moz-box-shadow: 0 0 6px #f8b9b7;
    box-shadow: 0 0 6px #f8b9b7
}


/*------------------------------------------------------------------
Validation Styles copied from application.css
------------------------------------------------------------------- */
.control-group.error .control-label,
.control-group.error .help-block,
.control-group.error .help-inline {
    color: #b94a48
}
.control-group span.error {
  color: #B94A48;
  font-size: 11px;
  font-weight: 600;
  position: relative;
  top: 5px;
  padding: 4px 8px;
  margin-bottom: 1em;
  color: #FFF;
  background: #B94A48;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.35);
}
.control-group span.error::after {
  content: '';
  display: inline-block;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-bottom: 6px solid #B94A48;
  position: absolute;
  top: -6px;
  left: 7px;
}
.control-group.error {
  padding-bottom: .5em;
}
.control-group.error div.clean {
	display: none;
}
.control-group.success span.error {
  display: none !important;
}
.control-group.success span.error::after {
  border: none;
}
.control-group.success div.clean {
  position: relative;
  top: 5px;
  display: inline-block;
  width: 15px;
  height: 15px;
  background: url(../img/validation/validation-success.png) no-repeat 0 0;
}
.control-group.success input + div.clean,
.control-group.success select + div.clean,
.control-group.success textarea + div.clean {
  left: 8px;
}

/*------------------------------------------------------------------
Buttons Styles copied from application.css
------------------------------------------------------------------- */
.btn-primary {
  color: #ffffff;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
  background-color: #92b765;
  background-image: -moz-linear-gradient(top, #a0c277, #7da64b);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#a0c277), to(#7da64b));
  background-image: -webkit-linear-gradient(top, #a0c277, #7da64b);
  background-image: -o-linear-gradient(top, #a0c277, #7da64b);
  background-image: linear-gradient(to bottom, #a0c277, #7da64b);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffa0c277', endColorstr='#ff7da64b', GradientType=0);
  border-color: #7da64b #7da64b #567233;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  *background-color: #7da64b;
  /* Darken IE7 buttons by default so they stand out more given they won't have borders */
  filter: progid:DXImageTransform.Microsoft.gradient(enabled = false);
}
.btn-primary:hover,
.btn-primary:active,
.btn-primary.active,
.btn-primary.disabled,
.btn-primary[disabled] {
  color: #ffffff;
  background-color: #7da64b;
  *background-color: #709543;
}
.btn-primary:active,
.btn-primary.active {
  background-color: #63833b \9;
}
.btn-tertiary {
  color: #ffffff;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
  background-color: #979797;
  background-image: -moz-linear-gradient(top, #a6a6a6, #828282);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#a6a6a6), to(#828282));
  background-image: -webkit-linear-gradient(top, #a6a6a6, #828282);
  background-image: -o-linear-gradient(top, #a6a6a6, #828282);
  background-image: linear-gradient(to bottom, #a6a6a6, #828282);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffa6a6a6', endColorstr='#ff828282', GradientType=0);
  border-color: #828282 #828282 #5c5c5c;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  *background-color: #828282;
  /* Darken IE7 buttons by default so they stand out more given they won't have borders */

  filter: progid:DXImageTransform.Microsoft.gradient(enabled = false);
}
.btn-tertiary:hover,
.btn-tertiary:active,
.btn-tertiary.active,
.btn-tertiary.disabled,
.btn-tertiary[disabled] {
  color: #ffffff;
  background-color: #828282;
  *background-color: #757575;
}
.btn-tertiary:active,
.btn-tertiary.active {
  background-color: #696969 \9;
}
</style>

</head>
<body id="top" data-spy="scroll">
	<header id="home">
		<!--main-nav-->
		<div id="main-nav">
			<nav class="navbar">
				<div class="container">
					<div class="navbar-header">
						<a href="index.html" class="navbar-brand">Java Web </a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#ftheme">
							<span class="sr-only">Toggle</span> <span class="icon-bar"></span>
							<span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse" id="ftheme">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">Home</a></li>
							<li><a href="<%=application.getContextPath()%>/login.jsp">登出</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>

	<!--container-->
	<div>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 hidden-sm col-md-1"></div>
				<div class="col-xs-12 col-md-10">
					<div>
						<div>
							<h1>歡迎來到禮物管理</h1>
						</div>

						<form action="" id="contact-form" class="form-horizontal">
							<fieldset>
								<div class="control-group">
									<label class="control-label" for="name">Your Name</label>
									<div class="controls">
										<input type="text" class="input-large" name="name" id="name"
											required>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="email">Email Address</label>
									<div class="controls">
										<input type="text" class="input-large" name="email" id="email"
											required>
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary btn-large">Validate
									</button>
									<button type="reset" class="btn btn-tertiary btn-large">Cancel</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>

				<div class="col-xs-12 hidden-sm col-md-1"></div>

			</div>
		</div>
	</div>

	<!--footer-->
	<div id="bottom-footer"
		class="hidden-xs navbar navbar-default navbar-fixed-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="footer-left">
						&copy; 楊梅幼獅練習網站
						<div class="credits">
							by <a href="https://bootstrapmade.com/">2016</a>
						</div>
					</div>
				</div>

				<div class="col-md-8">
					<div class="footer-right">
						<ul class="list-unstyled list-inline pull-right">
							<li><a href="#">聯絡我們</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="../js/libs/jquery-1.7.2.min.js"></script>
	<script src="../js/libs/jquery-ui-1.8.21.custom.min.js"></script>	
	<script src="../js/libs/jquery.ui.touch-punch.min.js"></script>
	<script src="../js/plugins/validate/jquery.validate.js"></script>	
	<script src="../js/libs/bootstrap/bootstrap.min.js"></script>
	<script src="../js/Theme.js"></script>
	<script src="../js/demos/demo.validation.js"></script>
	<script>
		$(function() {
			Theme.init();
		});
	</script>
</body>
</html>