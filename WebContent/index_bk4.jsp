<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/FrontEnd/SubPages/header.jspf" %>
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
<%@include file="/FrontEnd/SubPages/footer-s.jspf" %>    