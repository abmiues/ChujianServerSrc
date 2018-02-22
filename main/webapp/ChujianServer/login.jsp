<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>登录</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" href="bt/css/stylecss.css" type="text/css"></link>
		<script type="text/javascript" src="bt/js/jquery-1.11.3.min.js">
</script>
		<script type="text/javascript" src="bt/js/jquery.min.js">
</script>
		<link rel="stylesheet" href="bt/css/indexstyle.css" type="text/css"></link>
		<script type="text/javascript" src="bt/js/focusjquery.js">
</script>

		<script type="text/javascript" src="bt/js/bootstrap.js">
</script>
		<script type="text/javascript" src="bt/js/bootstrap.min.js">
</script>


		<link rel="stylesheet" href="bt/css/bootstrap.min.css" type="text/css"></link>

<script type="text/javascript">
$(document).ready(function(){


  $("#form1").submit(function(){
	  
	  var s= $("#textUser").val();
	  if(s=="")
		{alert("请输入账号");return false;}
	  else
		  {
		  var reg=/^[A-Za-z0-9]{1,16}$/;
		  if(!reg.test(s)){alert("账号不符合规范");return false;}
		  }
	  var s= $("#textPaw").val();
	  if(s=="")
		{alert("请输入密码");return false;}
	  else
		  {
		  var reg=/^([A-Za-z0-9_]|[^A-Za-z0-9_]){1,18}$/;
		  if(!reg.test(s)){alert("密码不符合规范");return false;}
		  }
	  
	  
  	htmlobj=$.ajax(
  	{
  		 cache: true,
                type: "POST",
                url:"seller/login",
                data:$("#form1").serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("服务器连接失败");
                },
                success: function(data) {
            	 if(data=="111")
             	  	{	
             	  		alert("登录成功");
             	  		 window.location.href="index.jsp"; 
             	  
               	 	 }
                 else if(data=="100")
                	 alert("账号不存在");
                else if(data=="011")
                	alert("账户未激活，请确认注册邮箱中的激活邮件。");
                 else
               		  alert("密码错误");
                }
  		}
  	);
  return false;});
});
</script>
  <script type="text/javascript">
  function veryuserid() {  
	  var s= $("#textUser").val();
	  if(s=="")
		alert("请输入账号");
	  else
		  {
		  var reg=/^[A-Za-z0-9]{1,16}$/;
		  if(!reg.test(s)){alert("账号不符合规范");}
		  }
		}; 
		
  </script>
    
  <script type="text/javascript">
  function verypwd() {  
	  var s= $("#textPaw").val();
	  if(s=="")
		alert("请输入密码");
	  else
		  {
		  var reg=/^([A-Za-z0-9_]|[^A-Za-z0-9_]){1,18}$/;
		  if(!reg.test(s)){alert("密码不符合规范");}
		  }
		}; 
		
  </script>

<script type="text/javascript">
		function showdialog() {  
			alert("功能暂未开放");
			}; 

</script>
	</head>

	<body class="login" background="images/bg4.png">
	<div id="testdiv"></div>
		<!-- 导航条 -->
		<div class="nav1 ma-left">
			<img src="images/logo1.png" style="width: 60px;" class="flo"></img>
			&nbsp;
			<div class="">
				<ul>
					<li>
						关于我们
					</li>
					<li>
						在线注册
					</li>
					<li>
						官方微博
					</li>
					<li>
						客户端下载
					</li>
				</ul>
			</div>
		</div>
		<!-- 导航条  end -->

		<!--滚动图-->
		<br/>
		<div class="wrapper">
			<div id="focus">
				<ul>
					<li style="background-image: url(images/01.jpg)"></li>
				</ul>
			</div>
			
			<div class=" main">
				<div class="bg"></div>
				<div class="indexReg ">
					<p class="title ma-left">
						登录
					</p>
					<form id="form1" name="form1"  method="POST" action="#">
						<div class="for ma-left">
							<p class="renshu">
								<label for="textfield">
									用户名：
								</label>
								<input type="text" name="sellerid" id="textUser" onChange="veryuserid()" />
							</p>
							<p class="renshu">
								<label for="textfield2">
									密&nbsp;&nbsp;&nbsp;&nbsp;码：
								</label>
								<input type ="password" name="pwd" id="textPaw" onChange="verypwd()"/>
							</p>
						</div>
						<div class="maina ma_top flo ma-left ma_bot">
							<input type="radio" name="radio" id="paw" value="paw"  />
							下次自动登录
							<a href="forgetmm.jsp" class="mal">忘记密码</a>
						</div>

						<div class="ma_top2 ma-left">
							<input type="submit" name="btLogin" id="btLogin" value="登录"
								class="butt" />
						</div>
					</form>

					
					<div class="reg ma_top2 te-al2 flo">
						没有账号？
					</div>
					<div class=" ma_top2 flo">
						<a href="register.jsp"> <input type="submit" name="btRegist"
								id="btRegist" value="立即注册账号" class="buttreg" /> </a>
					</div>

				</div>
			</div>
		</div>
		<!--滚动图 end-->
		<div class="flo">
			<img src="images/tu2.PNG"></img>
		</div>
		<div class="flo foot ma_top2">
			©2017 Abmiues
		</div>
	</body>
</html>
