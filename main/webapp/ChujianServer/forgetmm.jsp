<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<link type="text/css" rel="stylesheet" href="bt/css/bootstrap.min.css" />
  <link rel="stylesheet" href="bt/css/indexstyle.css" type="text/css"></link>
  <link rel="stylesheet" href="bt/css/stylecss.css" type="text/css"></link>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body class="layout bg2">
  <!-- 导航条 -->
		<div class="nav1 ma_top2 ma-left">
		<img src="images/logo1.png" style="width:60px;" class="flo"></img>
		<div class="regn1 title ma_top2 flo">修改密码</div>
		<div class="flo2 ma_top2 ma-right">
			记得密码，现在就登录
		</div>
		</div>
	<div><img src="images/xian.PNG" style="width:1130px"></img></div>
		<!-- 导航条  end -->
  <div class="center-block">
   <form id="form1" name="form1" method="post" action=" Reszpass " class="ma-left3">
	  <p class="register">
	    <label for="textfield" class="wjw1">账                      号：</label>
	    <input type="text" name="textID" id="textID" class="regn1"/>
	  </p>
	  
	   <p class="register">
	    <label for="textfield2" class="wjw1">重新设置密码：</label>
	    <input type="text" name="textUserrePass" id="textUserrePass" class="regn1"/>
	  </p>
	   <p class="register">
	    <input type="submit" name="button" id="buttonReg" value="确定" class="butt" />
	  </p>
	  </form>

	 </div>
	
	

  </body>
</html>
