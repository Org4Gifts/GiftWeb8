<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/FrontEnd/SubPages/header.jspf"%>
<%@include file="/FrontEnd/SubPages/header-input-css.jspf"%>
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

					<form action="Login.do" method="post" name="changePwd"
						id="changePwd" class="form-horizontal" onSubmit="return chkPwd()">
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="pass">輸入新密碼</label>
								<div class="controls">
									<input type="password" class="input-large" name="pass"
										id="pass" required>
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
								<button type="submit" class="btn btn-primary btn-large">Validate
								</button>
								<button type="reset" class="btn btn-tertiary btn-large">Cancel</button>
								<input type="button" onclick="chkPwd1()"
									class="button btn btn-primary btn-large" value="修改" />
							</div>
						</fieldset>
					</form>
				</div>
			</div>

			<!--  <div class="col-xs-12 hidden-sm col-md-1"></div> -->

		</div>
	</div>
</div>

<script>
	function chkPwd() {
		if (changePwd.pass.value == changePwd.repass.value) {
			//document.changePwd.submit();
			return true;
		} else {
			alert("密碼輸入不一致");
			changePwd.pass.value = "";
			changePwd.repass.value = "";
			document.changePwd.pass.focus();
			document.changePwd.pass.select();
		}
		return false;
	}
	function chkPwd1() {
		if (changePwd.pass.value == "") {
			alert("「輸入新密碼」欄位不可為空白！");
			document.changePwd.pass.focus();
			document.changePwd.pass.select();
		} else if (changePwd.repass.value == "") {
			alert("「再次輸入新密碼」欄位不可為空白！");
			document.changePwd.repass.focus();
			document.changePwd.repass.select();
		}
		
		if (changePwd.pass.value == changePwd.repass.value) {
			document.changePwd.submit();
		} else {
			alert("密碼輸入不一致");
			changePwd.pass.value = "";
			changePwd.repass.value = "";
			document.changePwd.pass.focus();
			document.changePwd.pass.select();
		}
	}
</script>

<%@include file="/FrontEnd/SubPages/footer-input-js.jspf"%>