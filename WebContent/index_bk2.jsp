<%@page import="tw.youth.project.gift2016.sql.user.AUSER"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Java Web</title>
<!-- <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Open+Sans|Raleway" rel="stylesheet"> -->
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/flexslider.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/style.css">
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
							<%
								String username = (String)session.getAttribute("username");
								if (username == null) {
							%>
							<li><a href="<%=application.getContextPath()%>/login.jsp">登入</a></li>
							<%
								} else {
							%>
							<li><a
								href="<%=application.getContextPath()%>/FrontEnd/Staff/ChangePwd.jsp">修改密碼(<%=username%>)
							</a></li>
							<li><a href="<%=application.getContextPath()%>/login.jsp">登出</a></li>
							<%
								}
							%>
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
    						<h1>歡迎來到  公關禮品申請管理系統</h1>
    					</div>
						
    				</div>
    			</div>
				<div class="col-xs-12 hidden-sm col-md-1"></div>
    		</div>
    	</div>
    </div>
    
    <script type="text/javascript">
		var error = '${error}';
		if (error.trim() != "") {
			if (error.substring(0, 15) == "ChangePwd-True-") {			
				alert(error.substring(15));
			}
		}
	</script>

	<!--footer-->
	<div id="bottom-footer" class="hidden-xs navbar navbar-default navbar-fixed-bottom">
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
    <script src="<%=application.getContextPath()%>/FrontEnd/js/jquery.min.js"></script>
    <script src="<%=application.getContextPath()%>/FrontEnd/js/bootstrap.min.js"></script>
    <script src="<%=application.getContextPath()%>/FrontEnd/js/jquery.flexslider.js"></script>
    <script src="<%=application.getContextPath()%>/FrontEnd/js/jquery.inview.js"></script>
    <script src="<%=application.getContextPath()%>/FrontEnd/js/script.js"></script>
    
</body>
</html>