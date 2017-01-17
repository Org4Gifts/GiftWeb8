<%@page import="tw.youth.project.gift2016.tools.GetSqlValue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tw.youth.project.gift2016.consts.GeneralValue"%>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/FrontEnd/frame2/SubPages/header2.jspf"%>

<div class="right" id="mainFrame">
	<div class="right_cont">
		<ul class="breadcrumb">
			當前位置：
			<a href="#">首頁</a>
			<span class="divider">/</span>
			<a href="#">申請單/查詢</a>
			<span class="divider">/</span> 依狀態查詢
		</ul>
				<div class="title_right">
			<span class="pull-right margin-bottom-5"> <a
				class="btn btn-info btn-small" id="modal-9735581"
				href="#modal-container-9735581" role="button" data-toggle="modal"><i
					class="icon-plus icon-white"></i>新增禮品項目</a></span><strong>使用工號查詢</strong>
					
					<div>
						<%
							String option = request.getParameter("query_option");
							option = option != null ? option : "auser";
						%>
						<form action="<%=application.getContextPath()%>/Service.do" method="post" name="query" id="query">
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
							String result_option = (String) request.getAttribute("result_option");
							if (result_option != null) {
								ArrayList<Object> result_value = (ArrayList<Object>) request.getAttribute("result_value");
								if (result_value != null && result_value.size() > 0) {
						%>
						<table border="1">

							<%
								for (Object obj : result_value) {
											int i = 1;
							%>
							<tr>
								<td><%=i++%></td>
								<%
									Object[] objss = new GetSqlValue(result_option, obj).getValues();

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
							} else {
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
	</div>
</div>

<%@include file="/FrontEnd/frame2/SubPages/footer2.jspf"%>
<script type="text/javascript">
	var result_key = '${result_key}';
	if (result_key != "") {
		alert(result_key);
	}

//    var locations = window.location.href;
//    locations = locations.substring(0,locations.indexOf("?"));
	function getKey() {
		var form = document.getElementById("select");
		var key = form.options[form.selectedIndex].value;
		var type = document.getElementById("query_type");
		type.value = "change";
        
//        if(locations.includes("Service.do")){
//        alert(locations);
//    	locations = locations.substring(0,locations.indexOf("S"))+"FrontEnd/Querys/query_key.jsp";
//        alert(locations);
//    }
//        alert(location.href);
//        location.href= locations+"?query_option="+key; //直接透過給參數的轉址來達成換值
                if(window.location.toString.indexOf("Service.do")!=-1){
                    window.location("http://localhost:8080/GiftWeb8/FrontEnd/Querys/query_key.jsp?query_option="+key);
                }else{
                location.href= "?query_option="+key; //直接透過給參數的轉址來達成換值
                    }
            
	}
</script>