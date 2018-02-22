<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="qx.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String strpageid=request.getParameter("id");
	int pageid=0;
	if(strpageid!=null && !strpageid.equals(""))
	{
		pageid=Integer.valueOf(strpageid);
	}
%>
<script type="text/javascript">
$(document).ready(function(){
});
</script>
<html>
	<head>
		<title>厨鉴</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" href="bt/css/bootstrap.min.css" type="text/css"></link>

<script type="text/javascript" src="bt/js/jquery-1.11.3.min.js">
</script>
		
		<script type="text/javascript" src="bt/js/bootstrap.min.js">
</script>
		<script type="text/javascript">
		function showdialog() {  
			alert("功能暂未开放");
			}; 

</script>
		

	</head>


	<body style="height:100%;overflow:hidden;">

		<div class="container-fluid" style="height:20px; background: #000000;">
		</div>

		<!--内容 -->
		<div class="row">

			<div class="col-md-2" style="padding:0px">
				<div class="col-md-10"><%@ include file="filetype.jsp"%> </div>
				<div class="col-md-2"></div>
			</div>

			<div class="col-md-10" id="content2">
			<% if(pageid==1){%><%@ include file= "content_userinfo.jsp" %> 
			<%} %>
			<%if(pageid==4){%><%@ include file= "content_shopinfo.jsp" %> 
			<%}%>
			<%if(pageid==2){%><%@ include file= "content_ordersinfo.jsp" %> 
			<%}%>
			<%if(pageid==3){%><%@ include file= "content_camera.jsp" %> 
			<%}%>
			</div>
			<div class="col-md-1" style="padding:0px">
			</div>
		</div>
		<!--内容 end -->
	</body>
</html>
