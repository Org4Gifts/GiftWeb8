<%@page import="java.net.URLDecoder"%>
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
			 >
			<a href="<%=application.getContextPath()%>/detail.jsp">詳細內容</a>
		</ul>
		<%
		ArrayList<Bulletin> bulletins = (ArrayList<Bulletin>)request.getAttribute("resultValue");
		Bulletin bulletin = null;
		//String value = request.getQueryString().split("bull_id=")[1];
		String value = request.getParameter("bull_id");
		System.out.println("剛接到 : "+value);
		value = new String((value.getBytes("iso-8859-1")),"UTF-8");
		//int bull_id = Integer.valueOf(value);
		String[] Parameters = URLDecoder.decode(request.getQueryString(), "iso-8859-1")
                       .split("=");
		System.out.println(Parameters[1]);
		
		int bull_id = 0;
		int chk = 0;
		if(bulletins!= null && bulletins.size() != 0){
	for(Bulletin bull : bulletins){
		if(bull.getBulletin_id() == bull_id){
			bulletin = bull;
			break;
		}
	}
		if(bulletin != null)
			chk = 1;
	}
		System.out.println("欲列印 : "+value);
		%>
		<div class="title_right">
			<strong>公告內容</strong>
		</div>
			<table class="table table-bordered table-hover table-striped">
				<tbody>
	  			 <%if(chk == 1){%>
					<tr align="center" > <td colspan="5"><h1><strong>系統公告</strong></h1></td></tr>
					<tr align="center">
						<td><strong>標題</strong></td>
						<td><strong>日期</strong></td>
					</tr>
					<tr>
				    <%=bulletin.getContent()%>
					</tr>
					</tr>
				 <%}else{%>			 
			        <tr align="center"><strong>發生錯誤，請返回上一頁。</strong></tr>
			     <%}%>
					<tr align="center">
					<div class="modal-footer">
					<button class="btn btn-info" data-dismiss="modal"
						aria-hidden="true" style="width: 80px" onclick="back()" >返回</button>
						<!-- <input action="action" onclick="window.history.go(-1); return false;" type="button" value="Back" />
						 -->
				    </div>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	function back(){
		window.history.go(-1);
		return false;
	}
</script>

<%@include file="/FrontEnd/frame2/SubPages/footer2.jspf"%>