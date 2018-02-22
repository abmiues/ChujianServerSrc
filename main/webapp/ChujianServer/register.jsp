<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
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
	function veryuserid() {  
		  var s= $("#userid").val();
		  if(s=="")
			{alert("请输入账号");return false;}
		  else
			  {
			  var reg=/^[0-9]{11}$/;
			  if(!reg.test(s)){alert("请输入正确的手机号");return false;}
			  }
			
	}; 
		
  </script>
    <script type="text/javascript">
  function verynickname() {  
	  var s= $("#name").val();
	  if(s=="")
		{alert("请输入名称");return false;}
	  else
		  {
		  var reg=/^[A-Za-z0-9\u4e00-\u9fa5]{1,16}$/;
		  if(!reg.test(s)){alert("商家名称不符合规范");return false;}
		  }
		}; 
		
  </script>
  <script type="text/javascript">
  function verypwd() {  
	  var s= $("#pwd").val();
	  if(s=="")
		{alert("请输入密码");return false;}
	  else
		  {
		  var reg=/^([A-Za-z0-9_]|[^A-Za-z0-9_]){6,18}$/;
		  if(!reg.test(s)){alert("密码不符合规范");return false;}
		  }
		}; 
		
  </script>
   <script type="text/javascript">
  function checkpwd() {  
	  var s= $("#pwd").val();
	  var cs= $("#chkpwd").val();
	  if(cs=="")
			{alert("请确认密码");return false;}
	  else if(s!=cs)
		  {alert("两次输入密码不一致");return false;}
		
  }
  </script>
  
     <script type="text/javascript">
  function checkemail() {  
	  var s= $("#email").val();
	  if(s=="")
			alert("请输入邮箱");
		  else
			  {
			  var reg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;;
			  if(!reg.test(s)){alert("邮箱格式不正确");}
			  }
  }
  </script>	
<script type="text/javascript">

$(document).ready(function(){
	
  $("#form1").submit(function(){
	  if(veryuserid()==false)
		  return false;
	  else if(verynickname()==false)
		  return false;
	  else if(verypwd()==false)
		  return false;
	  else if(checkpwd()==false)
		  return false;
   	$.ajax(
  	{
  		 cache: true,
                type: "POST",
                url:"seller/register",
                data:{
                		tel:$("#userid").val(),
                		pwd:$("#pwd").val(),
                		sellerid:$("#userid").val(),
                		permintid:$("#email").val(),
                		name:$("#name").val()
                		},// 你的formid
                async: false,
                error: function(request) {
                    alert("服务器连接失败");
                },
                success: function(data) {
               		if(data=="111")
             	 	 {
             	 	 alert("注册成功");
             	 	window.location.href="index.jsp"; 
             	  
               		  }
          			else if(data=="100")
                	 alert("账号已存在");
            		else
               		  alert("服务器错误");
                }
  		}
  	);
  return false;}); 
});
</script>
  
  
  
  </head>
  
 
<body class="layout bg2">
  <!-- 导航条 -->
		<div class="nav1 ma_top2 ma-left">
		<img src="images/logo1.png" style="width:60px;" class="flo"></img>
		<div class="regn1 title ma_top2 flo">商家注册</div>
		<div class="flo2 ma_top2 ma-right">
			我已注册，现在就登录
		</div>
		</div>
	<div><img src="images/xian.PNG" style="width:1130px"></img></div>
		<!-- 导航条  end -->
  <div class="regi flo ">
    <form id="form1" name="form1" class="ma-left3">
	  <p class="register">
	    <label for="textfield">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手&nbsp;机&nbsp;号&nbsp;：</label>
	    <input type="text" name="sellerid" id="userid" class="regn1" onChange="veryuserid()"/> 
	  </p>
	  <br>
	  <p ><font face=黑体 color=#949494 size=1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入11位手机号</font></p>
	   <p class="register">
	    <label for="textfield2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商家名称：</label>
	    <input type="text" name="name" id="name" class="regn1" onChange="verynickname()" />
	  </p>
	  <br>
	  <p ><font face=黑体 color=#949494 size=1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名称暂时仅限输入中文、大小写英文、数字，长度不超过16字符</font></p>
	 <p class="register">
	    <label for="textfield2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
	    <input type ="password" name="pwd" id="pwd" class="regn1" onChange="verypwd()"	/>
	   
	  </p>
	   <br>
	  <p ><font face=黑体 color=#949494 size=1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码长度为6-18个字符</font></p>
	  <p class="register">
	    <label for="textfield2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认密码：</label>
	    <input type ="password" name="chkpwd" id="chkpwd" class="regn1" onChange="checkpwd()"/>
	  </p>
	 <p class="register">
	    <label for="textfield2">营业许可证号：</label>
	    <input type="text" name="permintid" id="email" class="regn1" />
	    <!-- onChange="checkemail()" -->
	  </p>		
						
	 
	  <p class="maina ma_top2 ma-left ma_bot">
		<input type="radio" name="radio" id="paw" value="paw" />
			阅读并接受《厨鉴用户协议》
	</p>
	 
<p class="register"> 
<input type="submit" name="button" id="buttonReg" value="注册"  onClick="delcfm()" class="butt" /></p> 
</form> 

</div>
<div class="regimg flo">
<img src="images/re1.PNG"></img>
</div>

  </body>
</html>

