<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<body>
<h3 style="cursor:pointer; cursor:hand" onClick="expandit(this)">搜尋引擎</h3>
<span style="display:none" style=&{head};>

1. <a href="http://www.openfind.com.tw">雅虎奇摩</a><br>
2. <a href="http://www.openfind.com.tw">openfind搜尋引擎</a><br>
3. <a href="http://www.openfind.com.tw">Google搜尋引擎</a><br>

</span>
<h3 style="cursor:pointer; cursor:hand" onClick="expandit(this)">我的最愛</h3>
<span style="display:none" style=&{head};>
可輸入任何內容
</span>
</body>
<script language="JavaScript1.2">
<!--

var ns6=document.getElementById&&!document.all?1:0

var head="display:''"
var folder=''

function expandit(curobj){
folder=ns6?curobj.nextSibling.nextSibling.style:document.all[curobj.sourceIndex+1].style
if (folder.display=="none")
folder.display=""
else
folder.display="none"
}

//-->
</script>

    
</html>