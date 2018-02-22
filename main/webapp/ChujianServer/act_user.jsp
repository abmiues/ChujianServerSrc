<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
String hashcode=request.getParameter("hashcode");
String usable=request.getParameter("usable");
System.out.println(hashcode+" "+usable);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" href="bt/css/indexstyle.css" type="text/css"></link>
  <link rel="stylesheet" href="bt/css/stylecss.css" type="text/css"></link>
  	<link type="text/css" href="js/uploadify.css" rel="stylesheet">
		<script src="js/jquery-1.11.2.min.js"></script>
		<script src="js/jquery.uploadify.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  	$.ajax(
  	{
  		 cache: true,
                type: "POST",
                url:"user_changestate",
                data:{hashcode:"<%=hashcode%>",usable:"<%=usable%>"},
                async: false,
                error: function(request) {
                    alert("服务器连接失败");
                },
                success: function(data) {
               		if(data=="111")
             	 	 {
             	 	 alert("激活成功");
               		  }
               		else if(data=="101")
               		alert("账户已激活，无需重复激活")
          			else if(data=="000")
                	 alert("链接已过期");
            		else
               		  alert("激活失败");
                }
  		}
  	);
});
</script>
  </head>
  
 
<body class="layout bg2">
  <!-- 导航条 -->
		<div class="nav1 ma_top2 ma-left">
		<img src="images/logo1.png" style="width:60px;" class="flo"></img>
		<div class="regn1 title ma_top2 flo">账号激活</div>
		<div class="flo2 ma_top2 ma-right">
		
		</div>
		</div>
	<div><img src="images/xian.PNG" style="width:1130px"></img></div>
		<!-- 导航条  end -->
  <div class="regi flo ">
    


</div>

  </body>
</html>

