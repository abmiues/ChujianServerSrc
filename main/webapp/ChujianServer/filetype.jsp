<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String userids=(String)session.getAttribute("sellerid");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'filetype.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" href="bt/css/stylecss.css" type="text/css"></link>
		<!-- id="main" role="presentation" class="active"><a href="#">首页</a></li>
			  <li id="comment" role="presentation"><a onclick="changbtn(1)">客户评价</a></li>
			  <li id="orders" role="presentation"><a href="#">订单中心</a></li>
			  <li id="video" role="presentation"><a href="#">视频管理</a></li>
			  <li id="info" role="presentation"><a href="#">店铺信息</a></li>
			  <li id="count" role="presentation"><a href="#">数据统计</a></li>
			  <li id="money" role="presentation"><a href="#">财务管理</a></li>
			  <li id="system" -->
 <script type="text/javascript">
 var nametable=["#main","#comment","#orders","#video","#info","#count","#money","#system"];
 var lastselect=0;
  function changbtn(id) {  
	  		if(lastselect!=id)
	  		{
	  		$(nametable[lastselect]).attr("class", "");
	  		lastselect=id;
	  		}
		  $(nametable[id]).attr("class", "active");
		  window.location.href="index.jsp?id="+id+""; 
		}; 
		
  </script>
  <script type="text/javascript">
$(document).ready(function(){
	$(nametable[<%=pageid%>]).attr("class", "active");
});
</script>
<script type="text/javascript">
<%-- var alldata;
$(document).ready(function(){

	 $.ajax(
             	  	{
             	  		 cache: true,
              			 type: "GET",
              			 contentType: "application/x-www-form-urlencoded; charset=utf-8",
               			 url:"getfiletype",
               			 data:{userid:<%=userid%>},
               			 /* data:{userid:$("input[name='userid']").val() }, */
               			 async: false,
              			 error: function(request) {
                    	 alert("2服务器连接失败");
              				 },
              			 success:function(datas)
              			 {
              			 $("#typelist").empty();  
              			 /*  $("#typelist").html("<a href='#' class='list-group-item'><img src='images/"+datas[0]+"' style='width: 20px; margin-right: 10px;'></img>"+datas[0]+"</a>"); */
              			 var htmlstr="";
              			 for(var i=0;i<datas.length;i++)
              			 {
              			 htmlstr+="<a href='javascript:selectbytype(\""+datas[i]+"\")' class='list-group-item'><img src='images/"+datas[i]+"' style='width: 20px; margin-right: 10px;'></img>"+datas[i]+"</a>";
              			 } 
						 $("#typelist").html(htmlstr);
              			 
              			 
              			 
							
							
							/* $.each(datas.items,function(i,n){
							alert(n.sku);//测试 这是我得到的一个数组 是可以得到的 
							
							 });	*/	 
              			 
              			 
              			 }
             	  		});
         $.ajax(
             	  	{
             	  		 cache: true,
              			 type: "POST",
              			 contentType: "application/x-www-form-urlencoded; charset=utf-8",
               			 url:"getfilelist",
               			data:{userid:<%=userids%>},
               			 /* data:{userid:$("input[name='userid']").val() }, */
               			 async: false,
              			 error: function(request) {
                    	 alert("2服务器连接失败");
              				 },
              			 success:function(datas)
              			 {
              			
              			 	alldata=datas;
               				$("#filelist").empty(); 
               				var htmlstr="";
               				for(var i=0;i<datas.length;i++)
               				{
               				htmlstr+="<tr><td><a href='download?filename="+datas[i].filename+"&&uploadtime="+datas[i].uploadtime+"'>"+datas[i].filename+"</a></td><td>"+datas[i].filesize+"</td><td>"+datas[i].uploadtime+"</td></tr>";
               				}		 
              			 $("#filelist").html(htmlstr);
              			 
              			 }
             	  		});
	});
	
	
		function selectbytype(type)
	{
	
		var htmlstr="";
		if(type!="all")
		{
			for(var i=0;i<alldata.length;i++)
			{
				if(alldata[i].filetype==type)
				{
					htmlstr+="<tr><td><a href='download?filename="+alldata[i].filename+"&&uploadtime="+alldata[i].uploadtime+"'>"+alldata[i].filename+"</a></td><td>"+alldata[i].filesize+"</td><td>"+alldata[i].uploadtime+"</td></tr>";
				}
			}
			$("#filelist").empty(); 
			$("#filelist").html(htmlstr);
			
		}
		else
		{
			for(var i=0;i<alldata.length;i++)
			{
				htmlstr+="<tr><td><a href='download?filename="+alldata[i].filename+"&&uploadtime="+alldata[i].uploadtime+"'>"+alldata[i].filename+"</a></td><td>"+alldata[i].filesize+"</td><td>"+alldata[i].uploadtime+"</td></tr>";
			}
			$("#filelist").empty(); 
			$("#filelist").html(htmlstr);
		}
	}  --%>
</script>
	
	
	</head>

	<body>
		<div class="list-group" id="typelist" style="background:#000000;height:100%;overflow:hidden;">
		<div class="container-fluid" style="text-align:center">
			<img alt="商家icon" src="images/<%=userids%>/icon.png" style="width:80px;" > 
		</div>
		<br/>
			<ul class="nav nav-pills nav-stacked">
			  <li id="main" role="presentation" onclick="changbtn(0)"><a style="color:#ffffff">首页</a></li>
			  <li id="comment" role="presentation" onclick="changbtn(1)"><a style="color:#ffffff" ><img src="img/person-white.png" style="padding-right:10px">个人中心</a></li>
			  <li id="orders" role="presentation" onclick="changbtn(2)"><a style="color:#ffffff"><img src="img/order2.png" style="padding-right:10px">订单中心</a></li>
			  <li id="video" role="presentation" onclick="changbtn(3)"><a style="color:#ffffff"><img src="img/video2.png" style="padding-right:10px">视频管理</a></li>
			  <li id="info" role="presentation" onclick="changbtn(4)"><a style="color:#ffffff"><img src="img/saler.png" style="padding-right:10px">店铺信息</a></li>
			  <li id="count" role="presentation" onclick="changbtn(5)"><a style="color:#ffffff"><img src="img/trend.png" style="padding-right:10px">数据统计</a></li>
			  <li id="money" role="presentation" onclick="changbtn(6)"><a style="color:#ffffff"><img src="img/profit.png" style="padding-right:10px">财务管理</a></li>
			  <li id="system" role="presentation" onclick="changbtn(7)"><a style="color:#ffffff"><img src="img/set-white.png" style="padding-right:10px">系统设置</a></li>
			</ul>
		</div>
	</body>
</html>


