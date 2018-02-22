<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>

		<meta http-equiv="Content-type" content="text/html;charset=utf-8" />
		<title>My JSP 'sc1.jsp' starting page</title>
		<link type="text/css" rel="stylesheet" href="bt/css/bootstrap.min.css" />
		<link rel="stylesheet" href="bt/css/indexstyle.css" type="text/css"></link>
        <link rel="stylesheet" href="bt/css/stylecss.css" type="text/css"></link>
		<link type="text/css" href="js/uploadify.css" rel="stylesheet">
		<script src="js/jquery-1.11.2.min.js"></script>
		<script src="js/jquery.validate.min.js"></script>
		<script src="bt/bootstrap.min.js"></script>
	</head>


	<body class="layout bg2">
	 <!-- 导航条 -->
		<div class="nav1 ma_top2 ma-left">
		<img src="images/logo1.png" style="width:60px;" class="flo"></img>
		<div class="regn1 title ma_top2 flo">Gee Disk账号信息</div>
		<div class="flo2 ma_top2 ma-right">
			个人中心
		</div>
		</div>
	<div><img src="images/xian.PNG" style="width:1130px"></img></div>
		<!-- 导航条  end -->
		<!--内容 -->
		<div class="row">
			<div style="width: 20px; height: 500px; float: left;">
			</div>
			<div class="col-md-3">
				<img src="images/info1.PNG"></img>
			</div>

			<div class="col-md-8">
				<div class="container">
			<div class="row">

				<div class="col-md-8">
					<div class="panel panel-default">

						<div class="panel-body">
							<form class="form-horizontal">
								<div class="form-group form-group-lg">
									<label class="col-sm-2 control-label" for="formGroupInputLarge">
										账号：
									</label>
									<div class="col-sm-9">
										<p class="form-control">
											<a class="spid">${user.userid}</a>
										</p>
									</div>
								</div>
								<div class="form-group form-group-lg">
									<label class="col-sm-2 control-label" for="formGroupInputLarge">
										昵称：
									</label>
									<div class="col-sm-9">
										<p class="form-control">
											<a class="spid">${user.username}</a>
										</p>
									</div>
								</div>
								<div class="form-group form-group-lg">
									<label class="col-sm-2 control-label" for="formGroupInputLarge">
										手机号：
									</label>
									<div class="col-sm-9">
										<p class="form-control">
											<a class="spid">${user.userphone}</a>
										</p>
									</div>
								</div>
								<div class="form-group form-group-lg">
									<label class="col-sm-2 control-label" for="formGroupInputLarge">
										email：
									</label>
									<div class="col-sm-9">
										<p class="form-control">
											${user.useremail}
										</p>
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
			</div>
		</div>
		<!--内容 end -->
		
		
	</body>
</html>
