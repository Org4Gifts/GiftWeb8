<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>晶科物流管理系统</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/sdmenu.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>

</head>

<body>
	<div class="header">
		<div class="logo">
			<img src="img/logo.png" />
		</div>

		<div class="header-right">
			<i class="icon-question-sign icon-white"></i> <a href="#">帮助</a> <i
				class="icon-off icon-white"></i> <a id="modal-973558"
				href="#modal-container-973558" role="button" data-toggle="modal">注销</a>
			<i class="icon-user icon-white"></i> <a href="#">开票员的工作平台</a> <i
				class="icon-envelope icon-white"></i> <a href="#">发送短信</a>
			<div id="modal-container-973558" class="modal hide fade"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
				style="width: 300px; margin-left: -150px; top: 30%">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">注销系统</h3>
				</div>
				<div class="modal-body">
					<p>您确定要注销退出系统吗？</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
					<a class="btn btn-primary" style="line-height: 20px;"
						href="登录.html">确定退出</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 顶部 -->

	<div id="middle">
		<div class="left">

			<script type="text/javascript">
				var myMenu;
				window.onload = function() {
					myMenu = new SDMenu("my_menu");
					myMenu.init();
				};
			</script>

			<div id="my_menu" class="sdmenu">
				<div>
					<span>业务处理</span> <a href="查询页面.html">电脑开票</a> <a
						href="分理处发货排行榜.html">票据补录</a> <a href="开票界面.html">票单复核</a> <a
						href="客户投诉.html">货物配载</a> <a href="线路管理.html">发车清单</a> <a href="#">到货确认</a>
				</div>
				<div class="collapsed">
					<span>统计</span> <a href="#">统计</a>
				</div>
			</div>

		</div>
		<div class="Switch"></div>
		<script type="text/javascript">
			$(document).ready(function(e) {
				$(".Switch").click(function() {
					$(".left").toggle();

				});
			});
		</script>

		<div class="right" id="mainFrame">

			<div class="right_cont">
				<ul class="breadcrumb">
					当前位置：
					<a href="#">首页</a>
					<span class="divider">/</span>
					<a href="#">业务处理</a>
					<span class="divider">/</span> 电脑开票
				</ul>

				<div class="title_right">
					<span class="pull-right margin-bottom-5"><a
						class="btn btn-info btn-small" id="modal-9735581"
						href="#modal-container-9735581" role="button" data-toggle="modal"><i
							class="icon-plus icon-white"></i> 添加线路城市</a></span><strong>线路管理</strong>
				</div>

				<div id="modal-container-9735581" class="modal hide fade"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
					style="width: 600px; margin-left: -300px; top: 20%">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 id="myModalLabel">线路管理</h3>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>

								<tr>
									<td align="right">城市:</td>
									<td align="left"><input name="endTextBox" type="text"
										id="endTextBox" class="span1-1" /> [*]</td>
									<td align="right">缩写:</td>
									<td align="left" colspan="3"><input name="tbx_short2"
										type="text" id="tbx_short2" class="span1-1" /> [*]</td>
								</tr>
								<tr>
									<td align="right">联系人</td>
									<td align="left"><input name="manTextBox" type="text"
										id="manTextBox" class="span1-1" /></td>
									<td align="right">电话:</td>
									<td align="left" colspan="3"><input name="phoneTextBox"
										type="text" id="phoneTextBox" class="span1-1" /></td>
								</tr>
								<tr>
									<td align="right">郑货总部分成比例:</td>
									<td align="left"><input name="TextBox1" type="text"
										value="0" id="TextBox1" class="span1-1" /> %</td>
									<td align="right">郑货分公司分成比例:</td>
									<td colspan="3" align="left"><input name="TextBox2"
										type="text" value="0" id="TextBox2" class="span1-1" /> %</td>
								</tr>
								<tr>
									<td align="right">返货总部分成比例:</td>
									<td align="left"><input name="TextBox3" type="text"
										value="0" id="TextBox3" class="span1-1" /> %</td>
									<td align="right">返货分公司分成比例:</td>
									<td colspan="3" align="left"><input name="TextBox4"
										type="text" value="0" id="TextBox4" class="span1-1" /> %</td>
								</tr>
								<tr>
									<td colspan="6" align="center">网内中转货分成比例</td>
								</tr>
								<tr>
									<td align="right">（中转）发货方分成比例:</td>
									<td align="left"><input name="TextBox5" type="text"
										value="0" id="TextBox5" class="span1-1" /> %</td>
									<td align="right">（中转）收货方分成比例:</td>
									<td colspan="3" align="left"><input name="TextBox6"
										type="text" value="0" id="TextBox6" class="span1-1" /> %</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button class="btn btn-info" data-dismiss="modal"
							aria-hidden="true" style="width: 80px">保存</button>
						<button class="btn btn-info" data-dismiss="modal"
							aria-hidden="true" style="width: 80px">取消</button>
					</div>
				</div>

				<table class="table table-bordered">
					<tr>
						<td width="12%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">票号：</td>
						<td width="38%"><input type="text" name="input" id="input"
							class="span1-1" /></td>
						<td width="12%" align="right" bgcolor="#f1f1f1">发货日期：</td>
						<td><input type="text" class="laydate-icon span1-1"
							id="Calendar" value="2015-08-25" /></td>
					</tr>
					<tr>
						<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">客户姓名：</td>
						<td><input type="text" name="input3" id="input3"
							class="span1-1" /></td>
						<td align="right" bgcolor="#f1f1f1">客户电话：</td>
						<td><input type="text" name="input4" id="input4"
							class="span1-1" /></td>
					</tr>
					<tr>
						<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">运费：</td>
						<td><input type="text" name="input2" id="input2"
							class="span1-1" /></td>
						<td align="right" bgcolor="#f1f1f1">货款：</td>
						<td><input type="text" name="input5" id="input5"
							class="span1-1" /></td>
					</tr>
					<tr>
						<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">投诉内容：</td>
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
						<td class="text-center"><input type="button" value="确定"
							class="btn btn-info " style="width: 80px;" /></td>
					</tr>
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