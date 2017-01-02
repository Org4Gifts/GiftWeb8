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
                                    <select name="query_option">
                                        <option value="auser" onclick="getKey()">使用者</option>
                                        <option value="aemp" onclick="getKey()">員工</option>
                                        <option value="avdr" onclick="getKey()">廠/客</option>
                                        <option value="aqty" onclick="getKey()">多廠進彙</option>
                                        <option value="apresent" onclick="getKey()">禮物</option>
                                        <option value="aodr" onclick="getKey()">訂單</option>
                                        <option value="aio" onclick="getKey()">調撥單</option>
                                        <option value="ainventory" onclick="getKey()">多廠別盤存檔</option>
                                        <option value="afab" onclick="getKey()">廠別</option>
                                        <option value="adep" onclick="getKey()">部門</option>
                                    </select>
                                    <input type="text" name="query_key" value=""/>
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
                var result_key = '${result_key}';
                if (result_key != "") {
                    alert(result_key);
                }
                
                var form = document.getElementsById("search");
                function getKey(){
                	alert(form.quer_option.value);
                }
            </script>