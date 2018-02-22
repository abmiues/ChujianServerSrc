<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>My JSP 'main.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/ajaxfileupload.js">
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$.ajax({
			cache : true,
			type : "GET",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			url : "seller/getuserinfo",
			data : {},
			/* data:{userid:$("input[name='userid']").val() }, */
			async : false,
			error : function(request) {
				alert("2服务器连接失败");
			},
			success : function(datas) {
				$("#sellername").empty();
				$("#sellername").html(datas.name)
				//$("#typelist").empty();  
				/*  $("#typelist").html("<a href='#' class='list-group-item'><img src='images/"+datas[0]+"' style='width: 20px; margin-right: 10px;'></img>"+datas[0]+"</a>"); */
				//var htmlstr="";
				// for(var i=0;i<datas.length;i++)
				//{
				// htmlstr+="<a href='javascript:selectbytype(\""+datas[i]+"\")' class='list-group-item'><img src='images/"+datas[i]+"' style='width: 20px; margin-right: 10px;'></img>"+datas[i]+"</a>";
				//} 
				// $("#typelist").html(htmlstr);
			}
		});

	});
</script>

<script type="text/javascript">
	function modify() {
		$.ajax({
			cache : true,
			type : "GET",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			url : "seller/upuserinfo",
			data : {permintid:$("#permintid").val(),name:$("#name").val(),tel:$("#tel").val()},
			/* data:{userid:$("input[name='userid']").val() }, */
			async : false,
			error : function(request) {
				alert("2服务器连接失败");
			},
			success : function(datas) {
				if(datas=="111")
					window.location.href="#"; 
			}
		});
		return false;
	}

</script>

<script type="text/javascript">
	//var timer;
	function clicke() {
		//var count=0;
		var value = $("#uploadfile").val();
		if (value != "") {
			$.ajaxFileUpload({
				url : 'seller/upload',
				secureuri : false,
				fileElementId : 'uploadfile',
				dataType : 'text',
				//data : {username : $("#username").val()},
				success : function(data, status) {
					if (data == '111')
						window.location.reload();
				},
				error : function(data, status, e) {
					alert('上传出错');
				}
			});
		} else
			alert('请选择文件');

		return false;
	}
	


	//timer=setInterval("getsession()",1000);

	///alert(state)
	//if(state=="finish")
	//clearInterval(timer);
</script>



</head>

<body>
<br/>
<br/>
	<button type="button" class="btn btn-default" data-toggle="modal"
		data-target="#myModal">上传商家图片</button>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">选择文件</h4>
				</div>

				<form action="#" id="uploadform" method="post"
					enctype="multipart/form-data">
					<div class="modal-body">
						<input id="uploadfile" type="file" name="file"
							style="size: 100; background: #ffffff; border: 1px solid #000000" />

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="uploadbtn"
							onClick="clicke()">上传</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="col-md-6">
			<img alt="商家icon" src="images/<%=userid%>/icon.png" style="width:80px">
			<h4 id="sellername"></h4>
		</div>
	</div>
	<div class="container-fluid" >
		<table>
			<tr >
				<td><br/>商家名称：</td><td><br/><input id="name"></input></td>
				
			</tr>
			
			<tr>
				<td><br/>联系方式：</td>
				<td><br/><input id="tel"></input></td>
			</tr>
			<tr>
				<td><br/>地址：</td>
				<td><br/><input id="address"></input></td>
			</tr>
			<tr>
				<td><br/>营业许可证号：</td>
				<td><br/><input id="permintid"></input></td>
			</tr>
			
		</table>
		<br/>
		<button type="button" class="btn btn-primary btn-lg" onClick="modify()">提交</button>
	</div>


</body>
</html>
