<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset="utf-8">
<title>登入頁面</title>
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">

<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/bootstrap-login.css">

<link rel="stylesheet"
	href="<%=application.getContextPath()%>/FrontEnd/css/application.css">

<style>
.button {
	margin: 8px;
}

.modal {
	left: 62%;
	width: 350px;
}
</style>
</head>

<%
	String key = request.getParameter("mailKey") != null ? request.getParameter("mailKey") : "";
%>

<body class="login">
	<div class="account-container login stacked">
		<div class="content clearfix">
			<form action="Service.do" method="post" name="changePwd">
				<!-- <form action="ExampleLogin" method="post"> -->

				<h1>公關禮品申請管理系統</h1>
				<div class="login-fields">
					<p>重設密碼：</p>
					<div class="field">
						<label for=password>新設密碼:</label> <input type="password"
							id="password" name="pass" value="" placeholder="密碼"
							class="login username-field" />
					</div>
					<!-- /field -->

					<div class="field">
						<label for="repassword">確認密碼:</label> <input type="password"
							id="repass" name="repass" value="" placeholder="確認密碼"
							class="login password-field" />
					</div>
					<!-- /password -->

				</div>
				<!-- /login-fields -->

				<div class="login-actions">
					<input type="button" onclick="chkPwd()"
						class="button btn btn-primary btn-large" value="修改" />
				</div>
				<input type="hidden" name="mailKey" value="<%=key%>">
				<!-- .actions -->

			</form>
		</div>
		<!-- /content -->

	</div>
	<!-- /account-container -->

	<!-- /login-extra -->

	<!-- jQuery -->
	<script
		src="<%=application.getContextPath()%>/FrontEnd/js/jquery.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/FrontEnd/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function chkPwd() {
			if (changePwd.pass.value == changePwd.repass.value) {
				document.changePwd.submit();
			} else {
				alert("密碼輸入不一致");
				changePwd.pass.value = "";
				changePwd.repass.value = "";
			}
		}
	</script>
</body>
</html>
