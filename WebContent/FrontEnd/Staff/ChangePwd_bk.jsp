<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/FrontEnd/SubPages/header.jspf" %>
<%@include file="/FrontEnd/SubPages/header-input-css.jspf" %>
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

<%@include file="/FrontEnd/SubPages/footer-input-js.jspf" %>