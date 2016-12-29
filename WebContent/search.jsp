<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@include file="/FrontEnd/SubPages/header.jspf"%>
        <!--container-->
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 hidden-sm col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <div>
                            <div>
                                <h1>公關禮品申請管理系統-查詢功能</h1>
								<a href="<%=application.getContextPath()%>/search_all.jsp">使用者查詢功能</a>
								<a href="<%=application.getContextPath()%>/search_key.jsp">關鍵字查詢功能</a>
                            </div>

                        </div>
                    </div>
                    <div class="col-xs-12 hidden-sm col-md-1"></div>
                </div>
            </div>
        </div>
        <%@include file="/FrontEnd/SubPages/footer.jspf"%>
            <script type="text/javascript">
                var mail_success = '${mail_success}';
                if (mail_success != "") {
                    alert(mail_success);
                }

                var logout = '${logout}';
                if (logout != "") {
                    alert(logout);
                }

                var changePwd = '${changePwd}';
                if (changePwd != "") {
                    alert(changePwd);
                }
            </script>