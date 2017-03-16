<%@page import="tw.youth.project.gift2016.sql.aodr.AODRDT"%>
<%@page import="tw.youth.project.gift2016.sql.apresent.APRESENT"%>
<%@page import="java.util.*"%>
<%@page import="tw.youth.project.gift2016.consts.ConstValue"%>
<%@page import="tw.youth.project.gift2016.func.*"%>
<%@page import="tw.youth.project.gift2016.sql.*"%>
<%@page import="tw.youth.project.gift2016.sql.aodr.AODR"%>
<%@page import="tw.youth.project.gift2016.sql.user.AUSER"%>
<%@page import="tw.youth.project.gift2016.sql.afab.AFAB"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/FrontEnd/frame2/SubPages/header2.jspf"%>

<%!String docStatus = "Preparing";%>

<div class="right" id="mainFrame">
	<div class="right_cont">
		<ul class="breadcrumb">
			當前位置：
			<a href="#">首頁</a>
			<span class="divider">/</span>
			<a href="#">申請單/查詢</a>
			<span class="divider">/</span> 新增申請單
		</ul>

		<%
							ArrayList<APRESENT> resultApresent = (ArrayList<APRESENT>) request.getAttribute("resultApresent");
							ArrayList<AFAB> resultAfab = (ArrayList<AFAB>) request.getAttribute("resultAfab");
							ArrayList<AODRDT> aodrdts = (ArrayList<AODRDT>)request.getAttribute("aodrdts");
							if (resultApresent == null) {
						%>
						<form action="<%=application.getContextPath()%>/Service.do"
							method="post" id="queryOrder">
							<input type="hidden" name="queryOrder" value="queryOrder" />
						</form>
						<script type="text/javascript">
							document.getElementById("queryOrder").submit();
						</script>
						<%
							return;
							}
						%>
		<div class="title_right">
			<span class="pull-right margin-bottom-5"> <a
				class="btn btn-info btn-small" id="modal-9735581"
				href="#modal-container-9735581" role="button" data-toggle="modal"><i
					class="icon-plus icon-white"></i>新增禮品項目</a></span><strong>新增申請單</strong>
		</div>
								
		<div id="modal-container-9735581" class="modal hide fade"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			style="width: 600px; margin-left: -300px; top: 20%">
			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">新增禮品項目</h3>
			</div>
					<form action="<%=application.getContextPath()%>/Service.do"
							method="post" id="addOrderdt">
			<div class="modal-body">			
				<table class="table table-bordered">
					<tbody>

						<tr>
							<td width="30%" align="middle">拜訪公司名稱:</td>
							<td width="70%" align="left"><input name="comname"
								type="text" id="comname" class="span1-1" required /></td>
						</tr>


						<tr>
							<td align="middle">拜訪對象姓名:</td>
							<td align="left"><input name="pername" type="text"
								id="pername" class="span1-1" /></td>
						</tr>
						<tr>
							<td align="right">職稱類別:</td>
							<td align="left"><select name="authority">
									<option value="4">1. 副總級以上</option>
									<option value="3">2. 高階主管(處長級)</option>
									<option value="2">3. 中階主管(經理級)</option>
									<option value="1">4. 基層主管(課級以下)</option>
									<option value="5">5. HR Only</option>
							</select></td>
						</tr>
						<tr>
							<td align="middle">申請品名:</td>
							<!-- <td align="left"><input name="fgno" type="text"
								id="fgno" class="span1-1" /> <span
								class="pull-right margin-bottom-5"> <a
									class="btn btn-info btn-small" id="modal-9735582"
									href="#modal-container-9735582" role="button"
									data-toggle="modal"><i class="icon-plus icon-white"></i>禮品清單</a></span>


								<div id="modal-container-9735582" class="modal hide fade"
									role="dialog" aria-labelledby="myModalLabel2"
									aria-hidden="true"
									style="width: 300px; margin-left: -300px; top: 20%">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal1" onclick="closefunc()"
											aria-hidden="true">×</button>
										<h3 id="myModalLabel2">禮品清單</h3>
									</div>
									<div class="modal-body">
										<table class="table table-bordered">
											<tbody>
												<tr>
													<td align="right">禮品清單:</td>-->
													<td align="left"> 
													<!--<select name="fgno" id="fgno-se">-->
													<select name="fgno" id="fgno">
															<!--
															<option value="A001">舒壓球</option>
															<option value="B002">L型透明夾</option>
															<option value="C001">三折手冊</option>
															<option value="D001">多功能筆記本</option>
															<option value="S001">高爾夫球具組</option>
-->
															<%
																for (APRESENT apresent : resultApresent) {
															%>
															<option value="<%=apresent.getFgno()%>"><%=apresent.getFgname()%></option>
															<%
																}
															%>
													</select>
													<!-- </td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button class="btn btn-info" data-dismiss="modal1" onclick="choicefunc()"
											aria-hidden="true" style="width: 80px">確定</button>
										<button class="btn btn-info" data-dismiss="modal1" onclick="closefunc()"
											aria-hidden="true" style="width: 80px">取消</button>
									</div>
								</div>
								</td> -->
						</tr>
						<tr>
							<td align="middle">數量:</td>
							<td align="left"><input name="qty" type="number" value="0"
								id="qty" class="span1-1" /> 單位</td>
						</tr>
						<tr>
							<td align="middle">備註:</td>
							<td align="left"><input name="note1" type="text"
								id="note1" class="span1-1" /></td>
						</tr>
						<%
						System.out.println("jsp "+resultApresent+" ; "+resultAfab);
						%>
						<input type="hidden" name="addOrderdt" value="addOrderdt" />
						<input type="hidden" name="resultApresent" value="<%=resultApresent%>" />
						<input type="hidden" name="resultAfab" value="<%=resultAfab%>" />
						<%if(aodrdts!=null){ %>
						<input type="hidden" name="aodrdts" value="<%=aodrdts%>" />
						<%} %>
			
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-info" data-dismiss="modal" aria-hidden="true"
					style="width: 80px" onclick="addfunc()">確定</button>
				<button class="btn btn-info" data-dismiss="modal" aria-hidden="true"
					style="width: 80px">取消</button>
			</div>	
			</form>
		</div>

		<div style="width: 900px; margin: auto">
			目前簽核者(Reviewing by)：
			<div style="display: inline; color: blue;"><%=docStatus%></div>
			<div style="display: none;">發放日期：</div>
			<div style="display: none;">S/N：</div>
			<table class="table table-bordered">
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">員工工號：</td>
					<td width="20%"><input type="text" name="input1" id="input1"
						class="span1-1" /></td>
					<td width="8%" align="right" bgcolor="#f1f1f1">員工姓名：</td>
					<td width="20%"><input type="text" name="input2" id="input2"
						class="span1-1" /></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">部門代號：</td>
					<td><input type="text" name="input3" id="input3"
						class="span1-1" /></td>
					<td align="right" bgcolor="#f1f1f1">部門名稱：</td>
					<td><input type="text" name="input4" id="input4"
						class="span1-1" /></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">職稱：</td>
					<td><input type="text" name="input5" id="input5"
						class="span1-1" /></td>
					<td align="right" bgcolor="#f1f1f1">分機：</td>
					<td><input type="text" name="input6" id="input6"
						class="span1-1" /></td>
				</tr>
				<tr>
					<td align="right" bgcolor="#f1f1f1">需求部門：</td>
					<td><input type="text" name="input7" id="input7"
						class="span1-1" /></td>
					<td align="right" bgcolor="#f1f1f1">需求日期：</td>
					<td colspan="3"><input type="text"
						class="laydate-icon span1-1" id="Calendar" value="2015-08-25" /></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">需求廠別：</td>
					<td colspan="3">
						<%
							if (resultAfab != null && resultAfab.size() > 0) {
								for (AFAB afab : resultAfab) {
						%> <input type="radio" name="input8" value="<%=afab.getFno()%>" /><%=afab.getFname()%>&nbsp;&nbsp;&nbsp;
						<%
							}
							}
						%>
					</td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">需求目的：</td>
					<td colspan="3"><textarea name="input9" id="input9"
							class="span10"></textarea></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">備註：</td>
					<td colspan="3"><textarea name="input10" id="input10"
							class="span10"></textarea></td>
				</tr>
			</table>
			<table class="margin-bottom-20 table  no-border">
			<%
			System.out.println(aodrdts);
			if(aodrdts!=null){
				System.out.println("jsp aodrdts = "+aodrdts.size());
			%>
			<tr>
			<td>拜訪公司</td>
			<td>拜訪對象</td>
			<td>拜訪職稱</td>
			<td>禮品代號</td>
			<td>禮品數量</td>
			<td>禮品單價</td>
			<td>備註</td>
			</tr>
			<%for(AODRDT aodrdt:aodrdts){ %>
			<tr>
			<td><%=aodrdt.getComname() %></td>
			<td><%=aodrdt.getPername() %></td>
			<td><%=aodrdt.getAuthority() %></td>
			<td><%=aodrdt.getFgno() %></td>
			<td><%=aodrdt.getQty() %></td>
			<td><%=aodrdt.getPrc() %></td>
			<td><%=aodrdt.getNote1() %></td>
			<td><a href="<%=aodrdt.getAodrdt_id() %>">修改</a></td>
			</tr>
			<% 
			}
			}
			%>
				<tr>
					<td class="text-center"><input type="button" value="確定"
						class="btn btn-info " style="width: 80px;" /></td>
				</tr>
			</table>

		</div>
	</div>
</div>

<%@include file="/FrontEnd/frame2/SubPages/footer2.jspf"%>
<script type="text/javascript">
	var resultKey = '${resultKey}';
	if (resultKey != "") {
		alert(resultKey);
	}

	var locations = window.location.href;
	locations = locations.substring(0, locations.indexOf("?"));
	function getKey() {
		var form = document.getElementById("select");
		var key = form.options[form.selectedIndex].value;
		var type = document.getElementById("queryType");
		type.value = "change";
		location.href = locations + "?queryOption=" + key; //直接透過給參數的轉址來達成換值
	}
	function addfunc(){
		document.getElementById("addOrderdt").submit();
	}
    
	function closefunc(){
        $('#modal-container-9735582').modal('hide');
	}
    
	function choicefunc(){
		var select = document.getElementById("fgno-se");
        var select_val = select.options[select.selectedIndex].value;
        var select_txt = select.options[select.selectedIndex].text;
        var select_ori = document.getElementById("fgno");
        select_ori.value = select_val+select_txt;
        
        closefunc();
	}
	
</script>