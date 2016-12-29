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
                                <form action="Service.do" method="post" name="search">
                                    <select name="search_option">
                                        <option value="auser">使用者</option>
                                        <option value="aemp">員工</option>
                                        <option value="avdr">廠/客</option>
                                        <option value="aqty">多廠進彙</option>
                                        <option value="apresent">禮物</option>
                                        <option value="aodr">訂單</option>
                                        <option value="aio">調撥單</option>
                                        <option value="ainventory">多廠別盤存檔</option>
                                        <option value="afab">廠別</option>
                                        <option value="adep">部門</option>
                                    </select>
                                    <input type="text" name="search_key" value=""/>
                                    <button class="button btn btn-primary btn-large">查詢</button>
                                </form>
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