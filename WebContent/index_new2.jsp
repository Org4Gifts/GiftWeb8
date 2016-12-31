<%@page import="java.util.*"%>
<%@page import="tw.youth.project.gift2016.consts.ConstValue"%>
<%@page import="tw.youth.project.gift2016.func.*"%>
<%@page import="tw.youth.project.gift2016.sql.*"%>
<%@page import="tw.youth.project.gift2016.sql.aodr.AODR"%>
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
			<span class="divider">/</span> Department
		</ul>

		<div class="title_right">
			<strong>依申請部門</strong>
		</div>
		<div style="width: 900px; margin: auto">
			<table class="table table-bordered">
				<tr>
					<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">開始時間：</td>
					<td width="23%"><input type="text"
						class="laydate-icon span1-1" id="Calendar" value="2015-08-25" /></td>
					<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">結束時間：</td>
					<td width="23%"><input type="text"
						class="laydate-icon  span1-1" id="Calendar2" value="2015-08-25" /></td>
				</tr>
			</table>

			<table class="margin-bottom-20 table  no-border">
				<tr>
					<td class="text-center"><input type="button" value="條件查詢"
						class="btn btn-info " style="width: 80px;" /></td>
				</tr>
			</table>
			<table class="table table-bordered table-hover table-striped">
				<tbody>
					<tr align="center">
						<td><strong>No</strong></td>
						<td><strong>訂單號碼</strong></td>
						<td><strong>工號</strong></td>
						<td><strong>總數</strong></td>
						<td><strong>目的</strong></td>
						<td><strong> </strong></td>
					</tr>
					<%
						System.out.println("查詢訂單");
						String username = request.getParameter("username") == null
								? (String) session.getAttribute("username")
								: request.getParameter("username");
						String pass = request.getParameter("pass") == null
								? (String) session.getAttribute("pass")
								: request.getParameter("pass");
						if (username == null || pass == null) {
							request.getRequestDispatcher("/login.jsp").forward(request, response);
						}
						DBManager manager;
						manager = new DBManager(SQLCmd.DB_URL, SQLCmd.DB_NAME, SQLCmd.DB_USER, SQLCmd.DB_PASS);
						Login login = new Login(manager, username, pass);
						AUSER auser = login.getUser();
						Orders orders = new Orders(manager, auser);
						AODR aodr = new AODR();
						int i = 0;
						for (Object obj : orders.queryOrders(manager, auser, aodr.getTableName())) {
							i++;
							aodr = (AODR) obj;
							System.out.println(aodr.getEmpno() + " ; " + aodr.getOrder1());
					%>
					<tr align="center">
						<td><%=i%></td>
						<td><%=aodr.getOrder1()%></td>
						<td><%=aodr.getEmpno()%></td>
						<td><%=aodr.getTamt()%></td>
						<td><%=aodr.getPurpose()%></td>
						<td><a id="DataGrid1_ctl03_LinkButton1"
							href="javascript:__doPostBack('DataGrid1$ctl03$LinkButton1','')">詳細</a></td>
					</tr>
					<%
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