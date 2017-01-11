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
			<span class="divider">/</span> 新增申請單
		</ul>

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
			<div class="modal-body">
				<table class="table table-bordered">
					<tbody>

						<tr>
							<td width="30%" align="middle">拜訪公司名稱:</td>
							<td width="70%" align="left"><input name="endTextBox"
								type="text" id="compTextBox" class="span1-1" required /></td>
						</tr>
						<tr>
							<td align="middle">拜訪對象姓名:</td>
							<td align="left"><input name="manTextBox" type="text"
								id="manTextBox" class="span1-1" /></td>
						</tr>
						<tr>
							<td align="right">職稱類別:</td>
							<td align="left"><select name="title_opt">
									<option value="4">1. 副總級以上</option>
									<option value="3">2. 高階主管(處長級)</option>
									<option value="2">3. 中階主管(經理級)</option>
									<option value="1">4. 基層主管(課級以下)</option>
									<option value="5">5. HR Only</option>
							</select></td>
						</tr>
						<tr>
							<td align="middle">申請品名:</td>
							<td align="left"><input name="TextBox1" type="text"
								value="0" id="giftTextBox" class="span1-1" /> %
								
								<span
								class="pull-right margin-bottom-5"> <a
									class="btn btn-info btn-small" id="modal-9735582"
									href="#modal-container-9735582" role="button"
									data-toggle="modal"><i class="icon-plus icon-white"></i>禮品清單</a></span>


								<div id="modal-container-9735582" class="modal hide fade"
									role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true"
									style="width: 300px; margin-left: -300px; top: 20%">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h3 id="myModalLabel2">禮品清單</h3>
									</div>
									<div class="modal-body">
										<table class="table table-bordered">
											<tbody>
												<tr>
													<td align="right">禮品清單:</td>
													<td align="left"><select name="title_opt">
															<option value="A001">舒壓球</option>
															<option value="B002">L型透明夾</option>
															<option value="C001">三折手冊</option>
															<option value="D001">多功能筆記本</option>
															<option value="S001">高爾夫球具組</option>
													</select></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button class="btn btn-info" data-dismiss="modal"
											aria-hidden="true" style="width: 80px">確定</button>
										<button class="btn btn-info" data-dismiss="modal"
											aria-hidden="true" style="width: 80px">取消</button>
									</div>
								</div></td>
						</tr>
						<tr>
							<td align="middle">數量:</td>
							<td align="left"><input name="TextBox3" type="text"
								value="0" id="QtyTextBox" class="span1-1" /> %</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-info" data-dismiss="modal" aria-hidden="true"
					style="width: 80px">確定</button>
				<button class="btn btn-info" data-dismiss="modal" aria-hidden="true"
					style="width: 80px">取消</button>
			</div>
		</div>


		<div style="width: 900px; margin: auto">
			<table class="table table-bordered">
				<tr>
					<td width="12%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">廠區：</td>
					<td width="38%"><input type="text" name="input" id="input"
						class="span1-1" /></td>
					<td width="12%" align="right" bgcolor="#f1f1f1">申請日期：</td>
					<td><input type="text" class="laydate-icon span1-1"
						id="Calendar" value="2017-01-01" /></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">部門：</td>
					<td><input type="text" name="input3" id="input3"
						class="span1-1" /></td>
					<td align="right" bgcolor="#f1f1f1">員工編號：</td>
					<td><input type="text" name="input4" id="input4"
						class="span1-1" /></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">訂單金額：</td>
					<td><input type="text" name="input2" id="input2"
						class="span1-1" /></td>
					<td align="right" bgcolor="#f1f1f1">货款：</td>
					<td><input type="text" name="input5" id="input5"
						class="span1-1" /></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">需求目的：</td>
					<td colspan="3"><textarea name="input9" id="input9"
							class="span10"></textarea></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">客户要求：</td>
					<td colspan="3"><textarea name="input11" id="input11"
							class="span10"></textarea></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">客户建议：</td>
					<td colspan="3"><textarea name="input12" id="input12"
							class="span10"></textarea></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">被投诉部门：</td>
					<td><input type="text" name="input6" id="input6"
						class="span1-1" /></td>
					<td align="right" bgcolor="#f1f1f1">被投诉人：</td>
					<td><input type="text" name="input8" id="input8"
						class="span1-1" /></td>
				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">受理人：</td>
					<td><input type="text" name="input7" id="input7"
						class="span1-1" /></td>
					<td align="right" bgcolor="#f1f1f1">受理日期：</td>
					<td><input type="text" class="laydate-icon span1-1"
						id="Calendar2" value="2015-08-25" /></td>
				</tr>
			</table>
			<table class="margin-bottom-20 table  no-border">
				<tr>
					<td class="text-center"><input type="button" value="確定"
						class="btn btn-info " style="width: 80px;" /></td>
				</tr>
			</table>
		</div>
	</div>
</div>


<%@include file="/FrontEnd/frame2/SubPages/footer2.jspf"%>