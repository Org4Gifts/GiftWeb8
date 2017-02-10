<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
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
<%@page import="tw.youth.project.gift2016.sql.SQLCmd"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
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
		<%
		System.out.println("query_all.jsp : "+System.currentTimeMillis());
		boolean sortKey = false;
		String sortString = request.getParameter("sortKey") ;
		System.out.println("chk1 : "+sortKey+" ; "+sortString+" ; ");
		if(sortString!=null){
			if(sortString.equals("yes")){
				sortKey = true;
				sortString = "no";	
			}else{
				sortString = "yes";
				}
		}else	
			sortString = "no";
		
		System.out.println("chk2 : "+sortKey+" ; "+sortString+" ; ");
		%>
		<div class="title_right">
			<span class="pull-right margin-bottom-5"> <a
				class="btn btn-info btn-small" id="modal-9735581"
				onclick="sort()" role="button" data-toggle="modal"><i
					class="icon-plus icon-white"></i>更改排序</a></span>
					<strong>使用工號查詢</strong>
			<div>
				<div>
					<%
				Map<String,TreeMap<String, TreeMap<String, TreeMap<String, ArrayList<Object>>>>> maps = new TreeMap<>();
						boolean exist = false;
							for (String table : SQLCmd.TABLES) {
								Object obj = request.getAttribute(table);
								exist=obj!=null;
								if(exist){
								maps.put(table, (TreeMap<String, TreeMap<String, TreeMap<String, ArrayList<Object>>>>) obj);
								}
							}
							exist = maps.size()>0;
							if(!exist){
								sortString = sortString.equals("yes") ? "no":"yes" ;
								%>
					<form action="<%=application.getContextPath()%>/Service.do"
						method="post" id="queryAll">
						<input type="hidden" name="queryAll" value="queryAll" />
						<input type="hidden" name="sortKey" value="<%=sortString%>" />
					</form>
					<script type="text/javascript">
						document.getElementById("queryAll").submit();
					</script>
					<%
										return;
										}
						%>
					<div class="TreeMenu">
						<h1>所有任務</h1>
						<h2 style="cursor: pointer; cursor: hand" onClick="expandit(this)">使用者個人工號</h2>
						<span style="display: none" style=&{head};>
						<%if(exist){%>
							<div class="section1">
								<ul>
									<li><h3 style="cursor: pointer; cursor: hand"
											onClick="expandit(this)">類別</h3> <span style="display: none"
										style=&{head};> <%
 	for (String table : SQLCmd.TABLES) {
 %>
											<div class="section2">
												<ul>
													<li><h4 style="cursor: pointer; cursor: hand"
															onClick="expandit(this)"><%=table%></h4> <span
														style="display: none" style=&{head};>
															<div class="section3">
																<ul>
																	<% 
																	TreeMap<String, TreeMap<String, TreeMap<String, ArrayList<Object>>>> mapsYear = maps.get(table);
																	//System.out.println(mapsYear);
																		
																	if(mapsYear!=null){
																	Iterator<String> itYear = sortKey ? mapsYear.descendingKeySet().iterator() : mapsYear.keySet().iterator();
																	while(itYear.hasNext()){
																		String year = itYear.next();
																	%>
																	<li><h5 style="cursor: pointer; cursor: hand"
																			onClick="expandit(this)"><%=year%></h5> <span
																		style="display: none" style=&{head};>
																			<div class="section4">
																				<ul>
																					<div class="section5">
																						<ul><%
																						TreeMap<String, TreeMap<String, ArrayList<Object>>> mapsMonth = mapsYear.get(year);
																						Iterator<String> itMonth = sortKey ? mapsMonth.descendingKeySet().iterator() : mapsMonth.keySet().iterator();
																						while(itMonth.hasNext()){
																							String month = itMonth.next();
																						%>
																							<li><h6
																									style="cursor: pointer; cursor: hand"
																									onClick="expandit(this)"><%=month%></h6> <span
																								style="display: none" style=&{head};>
																									<div class="section6">
																										<ul>
																											<div class="section7">
																												<ul>
																												<%
																												TreeMap<String, ArrayList<Object>> mapsDay = mapsMonth.get(month);
																												Iterator<String> itDay = sortKey ? mapsDay.descendingKeySet().iterator() : mapsDay.keySet().iterator() ;
																												while(itDay.hasNext()){
																													String day = itDay.next();
																												%>
																													<li><h7
																															style="cursor: pointer; cursor: hand"
																															onClick="expandit(this)"><%=day%></h7> <span
																														style="display: none" style=&{head};>
																															<div class="section8">
																																<ul>
																																<%																																
																																for(Object obj:mapsDay.get(day)){
																																%>
																																	<li><h8
																															style="cursor: pointer; cursor: hand"
																															onClick="expandit(this)"><%=obj%></h8> <span
																														style="display: none" style=&{head};>
																															<div class="section8">
																																<ul>
																																	<li><a href="#">這裡該展開的是訂單/調撥單編號</a></li>
																																</ul>
																															</div>
																													</span></li>
																													<%}%>
																																</ul>
																															</div>
																													</span></li>
																													<%}%>
																												</ul>
																											</div>
																										</ul>
																									</div>
																							</span></li>
																							<%}%>
																						</ul>
																					</div>
																				</ul>
																			</div>
																	</span></li>
																	<%}
																	}%>
																</ul>
															</div>
													</span></li>
												</ul>
											</div> 
											<%
											
 	}}else{

		%>
		<h3>查無資料</h3>
		<%
										}
						System.out.println("query_all.jsp : "+System.currentTimeMillis());
										%>
									</span></li>
								</ul>
							</div>
						</span>
						<!--.section-->
					</div>
					<!--.TreeMenu-->
				</div>

			</div>
		</div>
	</div>
</div>

<%@include file="/FrontEnd/frame2/SubPages/footer2.jspf"%>
<script type="text/javascript">
	var ns6 = document.getElementById && !document.all ? 1 : 0

	var head = "display:''"
	var folder = ''

	function expandit(curobj) {
		folder = ns6 ? curobj.nextSibling.nextSibling.style
				: document.all[curobj.sourceIndex + 1].style
		if (folder.display == "none")
			folder.display = ""
		else
			folder.display = "none"
	}
	
	function sort(){
		//var sortKey = '${sortKey}';
		var sortString = '<%=sortString%>';
		var locations = window.location.toString();
		alert(sortString);
		
        if(locations.indexOf("?") != -1){
            locations = locations.substring(0,locations.indexOf("?"));
        }
        
        if(locations.indexOf(".do") != -1){
            locations = locations.substring(0,locations.indexOf("S"))+"FrontEnd/Querys/query_all.jsp";
        }         
		
			location.href= locations+"?sortKey="+sortString; //直接透過給參數的轉址來達成換值
	}
</script>