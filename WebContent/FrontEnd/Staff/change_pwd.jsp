<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--container-->
<div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 hidden-sm col-md-1"></div>
			<div class="col-xs-12 col-md-10">
				<div>
					<div>
						<h1>修改密碼</h1>
					</div>
					<%
	String key = request.getParameter("mailKey") != null ? request.getParameter("mailKey") : "";
	Cookie[] cookies = request.getCookies();
	String userCode = null;
	for (Cookie cook : cookies) {
		if (cook.getName().equals("userCode")) {
			userCode = cook.getValue();
			break;
		}
	}
%>
					<form action="<%=application.getContextPath()%>/Service.do"
						method="post" name="changePwd" id="changePwd"
						class="form-horizontal" onSubmit="return chkPwd()">
						<fieldset>
						<%
						if (userCode != null && !userCode.equals("")) {
					%>
							<div class="control-group">
							
								<label class="control-label" for="pass">輸入舊密碼</label>
								<div class="controls">
									<input type="password" class="input-large" name="pass"
										id="pass" required>
								</div>
							</div>
							<%
						}
					%>
							<div class="control-group">
								<label class="control-label" for="newpass">輸入新密碼</label>
								<div class="controls">
									<input type="password" class="input-large" name="newpass"
										id="newpass" required>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="repass">再次輸入新密碼</label>
								<div class="controls">
									<input type="password" class="input-large" name="repass"
										id="repass" required>
								</div>
							</div>
							<div class="form-actions">
								<input type="hidden" name="action" value="ChangePwd">
								<button type="submit" class="btn btn-primary btn-large">Modify
								</button>
								<button type="reset" class="btn btn-tertiary btn-large" onclick='location.reload();'>Cancel</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function chkPwd() {
		if (changePwd.newpass.value == changePwd.repass.value) {
			return true;
		} else {
			alert("新密碼輸入不一致，請重新輸入!");
			changePwd.newpass.value = "";
			changePwd.repass.value = "";
			document.changePwd.newpass.focus();
			document.changePwd.newpass.select();
		}
		return false;
	}
</script>

<script>
	var error = '${error}';
	if (error.trim() != "") {
		alert(error);
	}
</script>