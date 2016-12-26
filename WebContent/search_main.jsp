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
						<h1>公關禮品申請管理系統-所有任務</h1>
						<h3 style="cursor:pointer; cursor:hand" onClick="expandit(this)">古文今讀</h3>
<span style="display:none" style=&{head};>
						<div class="TreeMenu">
							<div class="section">
								<ul>
									<li><a href="#">上古神話</a></li>
									<li><a href="#">詩經</a></li>
									<li><a href="#">楚辭</a></li>
									<li><a href="#">諸子散文</a></li>
									<li><a href="#">漢賦選輯</a></li>
									<li><a href="#">樂府</a></li>
									<li><a href="#">駢文</a></li>
									<li><a href="#">唐詩</a></li>
									<li><a href="#">宋詞</a></li>
									<li><a href="#">元曲</a></li>
									<li><a href="#">章回小說</a></li>
								</ul>
							</div>
							</span>
							<!--.section-->
							<div class="section">
								<h1>現代文藝</h1>
								<ul>
									<li><a href="#">小說</a></li>
									<li><a href="#">散文</a></li>
									<li><a href="#">性靈小品</a></li>
									<li><a href="#">新詩</a></li>
									<li><a href="#">翻譯小說</a></li>
								</ul>
							</div>
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