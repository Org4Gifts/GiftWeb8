<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><%=getServletInfo()%></title>

<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/flexslider.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/style.css">

</head>
<body>
	<div class="gtco-loader"></div>
	<div id="page">
		<!-- <div class="page-inner"> -->
		<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">

				<div class="row">
					<div class="col-sm-4 col-xs-12">
						<div id="gtco-logo">
							<a href="<%=application.getContextPath()%>/frontWeb/index.jsp">Java
								Web <em>.</em>
							</a>
						</div>
					</div>
					<div class="col-xs-8 text-right menu-1">
						<ul>
							<li><a
								href="<%=application.getContextPath()%>/frontWeb/products.jsp">飲品清單</a></li>
							<%
								String user = (String) session.getAttribute("user");
							%>
							<%
								if (user == null) {
							%>

							<li><a href="contact.html">關於我們</a></li>
							<li><a
								href="<%=application.getContextPath()%>/frontWeb/register.jsp">會員註冊</a></li>
							<li><a
								href="<%=application.getContextPath()%>/frontWeb/login.jsp">會員登入</a></li>

							<%
								} else {
							%>
							<li class="has-dropdown"><a href="#">會員管理(<%=user%>)
							</a>
								<ul class="dropdown">
									<li class="has-dropdown"><a
										href="<%=application.getContextPath()%>/frontWeb/updatepassword.jsp">密碼更改</a>
									</li>
									<li class="has-dropdown"><a
										href="<%=application.getContextPath()%>/frontWeb/updatedata.jsp">基本資料修改</a>
									</li>
									<li><a
										href="<%=application.getContextPath()%>/frontWeb/history_order.jsp">歷史訂單</a>
									</li>
									<li><a
										href="<%=application.getContextPath()%>/cust.do?action=logout">登出</a>
									</li>
								</ul></li>
							<%
								}
							%>

						</ul>
					</div>
				</div>

			</div>
		</nav>

		<!--container-->
		<div>
			<div class="container">
				<div class="row">
					<div class="col-xs-12 hidden-sm col-md-1"></div>
					<div class="col-xs-12 col-md-10">
						<div>
							<div>
								<h1>歡迎來到 公關禮品申請管理系統</h1>
							</div>

						</div>
					</div>
					<div class="col-xs-12 hidden-sm col-md-1"></div>
				</div>
			</div>
		</div>
		
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