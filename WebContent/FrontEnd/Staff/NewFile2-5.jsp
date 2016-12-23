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
.control-group.error .control-label, .control-group.error .help-block,
	.control-group.error .help-inline {
	color: #b94a48
}

.control-group.error input {
	border-color: #b94a48;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

/*------------------------------------------------------------------
 
Validation Styles

------------------------------------------------------------------- */
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
									<button type="reset" class="btn btn-large">Cancel</button>
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