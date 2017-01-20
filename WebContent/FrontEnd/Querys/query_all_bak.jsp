<%@page import="tw.youth.project.gift2016.sql.SQLCmd"%>
<%@page import="java.util.HashMap"%>
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
				<div class="title_right">
			<span class="pull-right margin-bottom-5"> <a
				class="btn btn-info btn-small" id="modal-9735581"
				href="#modal-container-9735581" role="button" data-toggle="modal"><i
					class="icon-plus icon-white"></i>功能按鈕</a></span><strong>使用工號查詢</strong>
					<div>
					<div>
						<%
						if(request.getAttribute("aodr")!=null){
							Map<String, ArrayList<Object>> maps = new HashMap<>();
							for (String table : SQLCmd.TABLES) {
								maps.put(table, (ArrayList<Object>) request.getAttribute(table));
							}
							}else{
								%>
								<form action="<%=application.getContextPath()%>/Service.do"
										method="post" id="queryAll">
										<input type="hidden" name="queryAll" value="queryAll" />
									</form>
									<script type="text/javascript">
										document.getElementById("queryAll").submit();
									</script>
									<%
										return;
										}
							
						%>
						<div class="TreeMenu">
							<h1>公關禮品申請管理系統-所有任務</h1>
							<h2 style="cursor: pointer; cursor: hand"
								onClick="expandit(this)">使用者個人工號</h2>
							<span style="display: none" style=&{head};>
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
																		<li><h5 style="cursor: pointer; cursor: hand"
																				onClick="expandit(this)">年度</h5> <span
																			style="display: none" style=&{head};>
																				<div class="section4">
																					<ul>
																						<div class="section5">
																							<ul>
																								<li><h6
																										style="cursor: pointer; cursor: hand"
																										onClick="expandit(this)">月份</h6> <span
																									style="display: none" style=&{head};>
																										<div class="section6">
																											<ul>
																												<div class="section7">
																													<ul>
																														<li><h7
																																style="cursor: pointer; cursor: hand"
																																onClick="expandit(this)">日期</h7> <span
																															style="display: none" style=&{head};>
																																<div class="section8">
																																	<ul>
																																		<li><a href="#">這裡該展開的是訂單/調撥單編號</a></li>
																																	</ul>
																																</div>
																														</span></li>
																													</ul>
																												</div>
																											</ul>
																										</div>
																								</span></li>
																							</ul>
																						</div>
																					</ul>
																				</div>
																		</span></li>
																	</ul>
																</div>
														</span></li>
													</ul>
												</div> <%
 	}
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
</script>