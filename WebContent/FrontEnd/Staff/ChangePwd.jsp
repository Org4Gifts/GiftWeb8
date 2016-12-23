<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/FrontEnd/SubPages/header2.jspf"%>

<!--container-->
<div id="content">
	<div class="container">
		<div class="row">
			<div class="span12">
				<form action="#" id="contact-form" class="form-horizontal">
					<fieldset>
						<div class="control-group">
							<label class="control-label" for="name">Your Name</label>
							<div class="controls">
								<input type="text" class="input-large" name="name" id="name"
									required />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="email">Email Address</label>
							<div class="controls">
								<input type="text" class="input-large" name="email" id="email">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="subject">Subject</label>
							<div class="controls">
								<input type="text" class="input-large" name="subject"
									id="subject">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="message">Your Message</label>
							<div class="controls">
								<textarea class="span4" name="message" id="message" rows="4"></textarea>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="validateSelect">Select
								list</label>
							<div class="controls">
								<select id="validateSelect" name="validateSelect">
									<option value="">Select...</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Checkboxes</label>
							<div class="controls">
								<label class="checkbox"> <input type="checkbox"
									name="validateCheckbox" value="option1"> Option one is
									this and that-be sure to include why it's great
								</label> <label class="checkbox"> <input type="checkbox"
									name="validateCheckbox" value="option2"> Option two can
									also be checked and included in form results
								</label> <label class="checkbox"> <input type="checkbox"
									name="validateCheckbox" value="option3"> Option three
									can-yes, you guessed it-also be checked and included in form
									results
								</label>
								<p class="help-block">
									<strong>Note:</strong> Labels surround all the options for much
									larger click areas and a more usable form.
								</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Radio buttons</label>
							<div class="controls">
								<label class="radio"> <input type="radio"
									name="validateRadio" id="validateRadio1" value="option1">
									Option one is this and that-be sure to include why it's great
								</label> <label class="radio"> <input type="radio"
									name="validateRadio" id="validateRadio2" value="option2">
									Option two can is something else and selecting it will deselect
									option one
								</label>
							</div>
						</div>

						<div class="form-actions">
							<button type="submit" class="btn btn-primary btn-large">
								Validate</button>
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

<!-- jQuery -->
<script
	src="<%=application.getContextPath()%>/FrontEnd/js/jquery.min.js"></script>
<script
	src="<%=application.getContextPath()%>/FrontEnd/js/bootstrap.min.js"></script>
<script
	src="<%=application.getContextPath()%>/FrontEnd/js/plugins/validate/jquery.validate.js"></script>

<script src="<%=application.getContextPath()%>/FrontEnd/js/Theme.js"></script>

<script
	src="<%=application.getContextPath()%>/FrontEnd/js/demos/demo.validation.js"></script>

<script>
	$(function() {
		Theme.init();
	});
</script>

</body>
</html>