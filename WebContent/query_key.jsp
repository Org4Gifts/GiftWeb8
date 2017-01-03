<%@page import="java.util.ArrayList"%>
<%@page import="tw.youth.project.gift2016.sql.adep.ADEP"%>
<%@page import="tw.youth.project.gift2016.sql.afab.AFAB"%>
<%@page import="tw.youth.project.gift2016.sql.ainventory.AINVENTORY"%>
<%@page import="tw.youth.project.gift2016.sql.aio.AIO"%>
<%@page import="tw.youth.project.gift2016.sql.aodr.AODR"%>
<%@page import="tw.youth.project.gift2016.sql.apresent.APRESENT"%>
<%@page import="tw.youth.project.gift2016.sql.aqty.AQTY"%>
<%@page import="tw.youth.project.gift2016.sql.avdr.AVDR"%>
<%@page import="tw.youth.project.gift2016.sql.user.AEMP"%>
<%@page import="tw.youth.project.gift2016.sql.user.AUSER"%>
<%@page import="tw.youth.project.gift2016.consts.GeneralValue"%>
<%@page import="tw.youth.project.gift2016.tools.GetSqlValue"%>
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
						<%
							String option = request.getParameter("query_option");
							option = option != null ? option : "auser";
						%>
						<h1>公關禮品申請管理系統-查詢功能</h1>
						<form action="Service.do" method="post" name="query" id="query">
							<select id=select name="query_option" onchange="getKey()">
								<option value="auser" <%if (option.equals("auser")) {%>
									selected="selected" <%}%>>使用者</option>
								<option value="aemp" <%if (option.equals("aemp")) {%>
									selected="selected" <%}%>>員工</option>
								<option value="avdr" <%if (option.equals("avdr")) {%>
									selected="selected" <%}%>>廠/客</option>
								<option value="aqty" <%if (option.equals("aqty")) {%>
									selected="selected" <%}%>>多廠進彙</option>
								<option value="apresent" <%if (option.equals("apresent")) {%>
									selected="selected" <%}%>>禮物</option>
								<option value="aodr" <%if (option.equals("aodr")) {%>
									selected="selected" <%}%>>訂單</option>
								<option value="aio" <%if (option.equals("aio")) {%>
									selected="selected" <%}%>>調撥單</option>
								<option value="ainventory"
									<%if (option.equals("ainventory")) {%> selected="selected"
									<%}%>>多廠別盤存檔</option>
								<option value="afab" <%if (option.equals("afab")) {%>
									selected="selected" <%}%>>廠別</option>
								<option value="adep" <%if (option.equals("adep")) {%>
									selected="selected" <%}%>>部門</option>
							</select> <select id=select name="query_key">
								<%
									String keys[] = {};
									switch (option) {
										case "auser" :
											keys = new AUSER().getKeys();
											break;
										case "aemp" :
											keys = new AEMP().getKeys();
											break;
										case "avdr" :
											keys = new AVDR().getKeys();
											break;
										case "aqty" :
											keys = new AQTY().getKeys();
											break;
										case "apresent" :
											keys = new APRESENT().getKeys();
											break;
										case "aodr" :
											keys = new AODR().getKeys();
											break;
										case "aio" :
											keys = new AIO().getKeys();
											break;
										case "ainventory" :
											keys = new AINVENTORY().getKeys();
											break;
										case "afab" :
											keys = new AFAB().getKeys();
											break;
										case "adep" :
											keys = new ADEP().getKeys();
											break;
									}
									for (String key : keys) {
										String value = GeneralValue.getQueryKey(key);
										if (value != null) {
								%>
								<option value="<%=key%>"><%=value%></option>
								<%
									}
									}
								%>
							</select> <input type="text" name="query_value" value="" /> <input
								type="hidden" name="query_type" id="query_type" value="" />
							<button class="button btn btn-primary btn-large">查詢</button>
						</form>
					</div>

					<div>
						<%
							String result_key = (String)request.getAttribute("result_key");
							if (result_key != null) {
								ArrayList<Object> result_value = (ArrayList<Object>) request.getAttribute("result_value");
								if(result_value!=null && result_value.size()>0){
						%>
						<table>

							<%
								for (Object obj : result_value) {
							%>
							<tr>
								<%
								Object[] objss = new GetSqlValue(result_key, obj).getValues();
								System.out.println(objss);
											for (Object object : objss) {
								%>
								<td><%=object%></td>
								<%
									}
								%>

							</tr>
							<%
								}
							%>

						</table>
						<%
							}else{
								System.out.println("查詢不到任何資料");
								%>
						<br>查詢不到任何資料<br>
						<%
							}
							}
						%>
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

	function getKey() {
		var form = document.getElementById("select");
		var key = form.options[form.selectedIndex].value;
		alert(key);
		var type = document.getElementById("query_type");
		type.value = "change";
		document.getElementById("query").submit();
	}
</script>