<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<head>
<meta charset="utf-8">
<title>Bootstrap响应式后台管理系统模板</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">

<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/flexslider.css">
	
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/bootstrap.min.css">
	
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/style.css">
 
<!-- 
<link rel="stylesheet" href="../css/bootstrap-login.css">

<link rel="stylesheet" href="../css/application.css"> -->

<style>
.controls {
    *display: inline-block;
    *padding-left: 20px;
    margin-left: 180px;
    *margin-left: 0
}

.control-group.error .control-label,
.control-group.error .help-block,
.control-group.error .help-inline {
    color: #b94a48
}

.control-group.error .checkbox,
.control-group.error .radio,
.control-group.error input,
.control-group.error select,
.control-group.error textarea {
    color: #b94a48
}

.control-group.error input,
.control-group.error select,
.control-group.error textarea {
    border-color: #b94a48;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075)
}

.control-group.error input:focus,
.control-group.error select:focus,
.control-group.error textarea:focus {
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

	<div id="content">
		<div class="container">
			<div class="row">
				<div class="span12">
					<form action="/" id="contact-form" class="form-horizontal"
						novalidate>
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="name">Your Name</label>
								<div class="controls">
									<input type="text" class="input-large" name="name" id="name">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="email">Email Address</label>
								<div class="controls">
									<input type="text" class="input-large" name="email" id="email">
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
				<!-- /.span12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->

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