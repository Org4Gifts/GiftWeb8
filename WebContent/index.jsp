<%@page import="java.net.URLEncoder"%>
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
			<a href="<%=application.getContextPath()%>/index.jsp">首頁</a>
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
						String option = (String)request.getAttribute("resultOption");
						System.out.println("option = "+option);
						if(option == null || option.equals("")){%>
							<form action="Service.do" method="post" id="queryBulletin">
							<input type="hidden" name="queryBulletin" value="bulletin" />
							</form>
							<script type="text/javascript">
							document.getElementById("queryBulletin").submit();
							</script>
						<%
						return;
						}						
						ArrayList<Bulletin> bulletins = (ArrayList<Bulletin>)request.getAttribute("resultValue");
						
						int i = 0;
							if(bulletins!=null && bulletins.size()>0){
							for(Bulletin obj : bulletins){
							i++;
							String content = obj.getContent();
							System.out.println(obj.getSubject()+ " ; " + content);
							String urlWord = URLEncoder.encode(content,"iso-8859-1");
							if(content.length()<=19){
					%>
					<tr align="center">
						<td><%=i%></td>
						<td><%=obj.getSubject()%></td>
						<td><%=content.substring(0, content.length())%></td>
						<td><%=obj.getCreated()%></td>
									<td><a href="<%=application.getContextPath()%>/detail.jsp?bull_id=<%=URLEncoder.encode(content,"iso-8859-1")%>">詳細內容</a></td>
									<td><a href="#" onclick="transferWord(<%=content%>)">詳細內容</a></td>
					</tr>
					<%
							}else{
								%>
								<tr align="center">
									<td><%=i%></td>
									<td><%=obj.getSubject()%></td>
									<td><%=content.substring(0, 19)+"..."%></td>
									<td><%=obj.getCreated()%></td>
									<td><a href="<%=application.getContextPath()%>/detail.jsp?bull_id=<%=URLEncoder.encode(content,"iso-8859-1")%>">詳細內容</a></td>
								</tr>
								<%
							}
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
	var locations = window.location.href;
	locations = locations.substring(0, locations.indexOf("/de"));
	function transferWord(content){
		location.href = locations + "/detail.jsp?bull_id=" + content; //直接透過給參數的轉址來達成換值
	}
</script>

<%@include file="/FrontEnd/frame2/SubPages/footer2.jspf"%>