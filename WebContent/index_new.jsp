<%@page import="tw.youth.project.gift2016.sql.normal.Bulletin"%>
<%@page import="java.util.*"%>
<%@page import="tw.youth.project.gift2016.consts.ConstValue"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/FrontEnd/frame2/SubPages/header2.jspf"%>

<div class="right" id="mainFrame">

	<div class="right_cont">
		<ul class="breadcrumb">
			當前位置：
			<a href="<%=application.getContextPath()%>/index_new.jsp">首頁</a>
		</ul>

		<div class="title_right">
			<strong>首頁</strong>
		</div>
			<table class="table table-bordered table-hover table-striped">
				<tbody>
					<tr align="center" > <td colspan="5"><h1><strong>系統公告</strong></h1></td></tr>
					<tr align="center">
						<td><strong>No</strong></td>
						<td><strong>標題</strong></td>
						<td><strong>內容</strong></td>
						<td><strong>日期</strong></td>
						<td><strong>細節</strong></td>
					</tr>
					<%
						String option = (String)request.getAttribute("result_option");
						System.out.println("option = "+option);
						if(option == null || option.equals("")){%>
							<form action="Service.do" method="post" id="query_bulletin">
							<input type="hidden" name="query_bulletin" value="bulletin" />
							</form>
							<script type="text/javascript">
							document.getElementById("query_bulletin").submit();
							</script>
						<%
						return;
						}						
						ArrayList<Bulletin> bulletins = (ArrayList<Bulletin>)request.getAttribute("result_value");
						
						int i = 0;
							if(bulletins!=null && bulletins.size()>0){
							for(Bulletin obj : bulletins){
							i++;
							System.out.println(obj.getSubject()+ " ; " + obj.getContent());
					%>
					<tr align="center">
						<td><%=i%></td>
						<td><%=obj.getSubject()%></td>
						<td><%=obj.getContent().substring(0, 19)+"..."%></td>
						<td><%=obj.getCreated()%></td>
						<td><a id="DataGrid1_ctl03_LinkButton1"
							href="javascript:__doPostBack('DataGrid1$ctl03$LinkButton1','')">詳細</a></td>
					</tr>
					<%
						}
							}
					%>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	!function() {
		laydate.skin('molv');
		laydate({
			elem : '#Calendar'
		});
		laydate.skin('molv');
		laydate({
			elem : '#Calendar2'
		});
	}();
</script>

<%@include file="/FrontEnd/frame2/SubPages/footer2.jspf"%>