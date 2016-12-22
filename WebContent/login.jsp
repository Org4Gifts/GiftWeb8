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
<%
	String str = (String) request.getAttribute("error");
%>
</head>

<body class="login">
	<div class="account-container login stacked">
		<div class="content clearfix">
			<form action="<%=request.getContextPath()%>/Login.do" method="POST"
				name="login">
				<!-- <form action="ExampleLogin" method="post"> -->

				<h1>公關禮品申請管理系統</h1>
				<div class="login-fields">
					<p>請輸入：</p>
					<div class="field">
						<label for="username">帳號:</label> <input type="text" id="username"
							name="username" value="" placeholder="員工工號"
							class="login username-field" />
					</div>
					<!-- /field -->

					<div class="field">
						<label for="password">密碼:</label> <input type="password"
							id="password" name="pass" value="" placeholder="密碼"
							class="login password-field" />
					</div>
					<!-- /password -->

				</div>
				<!-- /login-fields -->

				<div class="login-actions">
					<span class="login-checkbox"> <input id="Field" name="Field"
						type="checkbox" class="field login-checkbox" value="First Choice"
						tabindex="4" /> <label class="choice" for="Field">保持登入</label>
					</span>
					<button class="button btn btn-primary btn-large" type="reset">重設</button>
					<input type="hidden" name="action" value="Login">
					<button class="button btn btn-primary btn-large">登入</button>
				</div>
				<!-- .actions -->

			</form>
		</div>
		<!-- /content -->

	</div>
	<!-- /account-container -->

	<!-- Text Under Box -->
	<div class="login-extra">
		忘記 <a href="#" data-toggle="modal" data-target="#myModal">密碼</a>
	</div>

	<!-- Modal -->
	<form action="Login.do" method="POST" name="ForgotPwd">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">重設您的密碼</h4>
					</div>
					<div class="modal-body">
						<div class="control-group">
							<label class="control-label" for="email">Your Email
								Address</label>
							<div class="controls">
								<input type="text" class="input-large" name="email" id="email">
							</div>

							<div class="controls">
								<input type="hidden" name="action" value="forgot">
								<button type="submit" class="btn btn-primary">傳送確認電子郵件</button>
							</div>

							<!-- 
							<div align="center">
								<input type="hidden" name="var_state" value="0"> <input
									type="hidden" name="action" value="add">
								<button class="btn btn-primary" type="submit">確認送出</button>
								&nbsp;&nbsp;&nbsp;
								<button class="btn btn-default" type="reset">清除重填</button>
							</div>
							 -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- /login-extra -->

	<!-- jQuery -->
	<script
		src="<%=application.getContextPath()%>/FrontEnd/js/jquery.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/FrontEnd/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var error = '${error}';
		if (error.trim() != "") {			
			if (error.substring(0, 3) != "已發送" && error != "登入失敗") {
				alert(error);
				$("#myModal").modal();
			} else
				alert(error);
		}
	</script>

	<!-- <%=str%> -->
</body>
</html>
