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
						id="changePwd" class="form-horizontal">
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="oldPasswd">輸入舊密碼</label>
								<div class="controls">
									<input type="text" class="input-large" name="oldPasswd"
										id="oldPasswd" required>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="newPasswd1">輸入新密碼</label>
								<div class="controls">
									<input type="text" class="input-large" name="newPasswd1"
										id="newPasswd1" required>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="newPasswd2">再次輸入新密碼</label>
								<div class="controls">
									<input type="text" class="input-large" name="newPasswd2"
										id="newPasswd2" required>
								</div>
							</div>
							<div class="form-actions">
								<button type="button" onclick="chkPwd()"
									class="btn btn-primary btn-large">Modify</button>
								<button type="reset" class="btn btn-tertiary btn-large">Cancel</button>
								<input type="button" onclick="chkPwd()"
									class="button btn btn-primary btn-large" value="修改" />
							</div>
						</fieldset>
					</form>
				</div>
			</div>

			<div class="col-xs-12 hidden-sm col-md-1"></div>

		</div>
	</div>
</div>

<%@include file="/FrontEnd/SubPages/footer-input-js.jspf"%>