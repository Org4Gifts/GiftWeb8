<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="tw.youth.project.gift2016.sql.SQLCmd"%>
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
							Map<String, ArrayList<Object>> maps = new HashMap<>();
							for (String table : SQLCmd.TABLES) {
								maps.put(table, (ArrayList<Object>) request.getAttribute(table));
							}
						%>
						<div class="TreeMenu">
							<h1>公關禮品申請管理系統-所有任務</h1>
							<h3 style="cursor: pointer; cursor: hand"
								onClick="expandit(this)">使用者個人工號</h3>
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
														<li><h3 style="cursor: pointer; cursor: hand"
																onClick="expandit(this)"><%=table%></h3> <span
															style="display: none" style=&{head};>
																<div class="section3">
																	<ul>
																		<li><h3 style="cursor: pointer; cursor: hand"
																				onClick="expandit(this)">年度</h3> <span
																			style="display: none" style=&{head};>
																				<div class="section4">
																					<ul>
																						<div class="section5">
																							<ul>
																								<li><h3
																										style="cursor: pointer; cursor: hand"
																										onClick="expandit(this)">月份</h3> <span
																									style="display: none" style=&{head};>
																										<div class="section6">
																											<ul>
																												<div class="section7">
																													<ul>
																														<li><h3
																																style="cursor: pointer; cursor: hand"
																																onClick="expandit(this)">日期</h3> <span
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
						<br> <br> <br>原始碼部分
						<h3 style="cursor: pointer; cursor: hand" onClick="expandit(this)">年度</h3>
						<span style="display: none" style=&{head};>
							<div class="section2">
								<ul>
									<li><a href="#">這裡該展開的是接下來的月份</a></li>
								</ul>
							</div>
						</span>
						<h3 style="cursor: pointer; cursor: hand" onClick="expandit(this)">月份</h3>
						<span style="display: none" style=&{head};>
							<div class="section3">
								<ul>
									<li><a href="#">這裡該展開的是接下來的日期</a></li>
								</ul>
							</div>
						</span>
						<h3 style="cursor: pointer; cursor: hand" onClick="expandit(this)">日期</h3>
						<span style="display: none" style=&{head};>
							<div class="section3">
								<ul>
									<li><a href="#">這裡該展開的是訂單/調撥單編號</a></li>
								</ul>
							</div>
						</span>
						<!--.section-->
					</div>
					<!--.TreeMenu-->
				</div>

			</div>
		</div>
		<div class="col-xs-12 hidden-sm col-md-1"></div>
	</div>
</div>
</div>
<%@include file="/FrontEnd/SubPages/footer.jspf"%>
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