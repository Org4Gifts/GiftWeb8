<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/FrontEnd/frame2/SubPages/header2.jspf"%>

            <div class="right"  id="mainFrame">

                <div class="right_cont">
                    <ul class="breadcrumb">當前位置：
                        <a href="#">首頁</a> <span class="divider">/</span>
                        <a href="#">申請單/查詢</a> <span class="divider">/</span>
                        Department
                    </ul>

                    <div class="title_right"><strong>依申請部門</strong></div>  
                    <div style="width:900px; margin:auto">
                        <table class="table table-bordered">
                            <tr>
                                <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">款到开始时间：</td>
                                <td width="23%"><input type="text"  class="laydate-icon span1-1" id="Calendar" value="2015-08-25"  /></td>
                                <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">款到结束时间：</td>
                                <td width="23%"><input type="text"  class="laydate-icon  span1-1" id="Calendar2" value="2015-08-25"  /></td>
                                <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">选择排行内容：</td>
                                <td><input type="text"   class=" span1-1" /></td>
                            </tr>
                        </table>

                        <table  class="margin-bottom-20 table  no-border" >
                            <tr>
                                <td class="text-center"><input type="button" value="查詢" class="btn btn-info " style="width:80px;" /></td>
                            </tr>
                        </table>
                        <table class="table table-bordered table-hover table-striped">
                            <tbody>
                                <tr align="center">
                                    <td><strong>No</strong></td>
                                    <td><strong>工號</strong></td>
                                    <td><strong>部門</strong></td>
                                    <td><strong>代收款合计</strong></td>
                                    <td><strong> </strong></td>
                                </tr>
                                <tr align="center">
                                    <td>1</td>
                                    <td>华商汇二部分理处</td>
                                    <td>18701</td>
                                    <td>110517</td>
                                    <td><a id="DataGrid1_ctl03_LinkButton1" href="javascript:__doPostBack('DataGrid1$ctl03$LinkButton1','')">詳細</a></td>
                                </tr>
                                <tr align="center">
                                    <td>2</td>
                                    <td>华南城分理处</td>
                                    <td>1637</td>
                                    <td>151776</td>
                                    <td><a id="DataGrid1_ctl04_LinkButton1" href="javascript:__doPostBack('DataGrid1$ctl04$LinkButton1','')">詳細</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>     
            </div>
        </div>

<%@include file="/FrontEnd/frame2/SubPages/footer2.jspf"%>