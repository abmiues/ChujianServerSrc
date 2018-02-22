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
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	var alldata;
	$(function() { 
		$('#uploadfile').change(function(event) { 
		var files = event.target.files, file; 
		if (files && files.length > 0) { 
		file = files[0]; 
		if(file.size > 1024 * 1024 * 2) { 
		alert('图片大小不能超过 2MB!'); 
		return false; 
		} 
		var URL = window.URL || window.webkitURL; 
		var imgURL = URL.createObjectURL(file); 
		$("#foodimg").attr('src', imgURL); 
		//$("#foodimg").html("<img src='images/1.png' style='height: 100px;'>")
		//$('body').append($('<img/>').attr('src', imgURL)); 
		} 
		}); 
		}); 
	$(document)
			.ready(
					function() {
						$
								.ajax({
									cache : true,
									type : "GET",
									contentType : "application/x-www-form-urlencoded; charset=utf-8",
									url : "seller/getmenu",
									data : {},
									/* data:{userid:$("input[name='userid']").val() }, */
									async : false,
									error : function(request) {
										alert("2服务器连接失败");
									},
									success : function(datas) {
										//$("#sellername").empty();
										//$("#sellername").html(datas.name)
										//$("#typelist").empty();  
										/*  $("#typelist").html("<a href='#' class='list-group-item'><img src='images/"+datas[0]+"' style='width: 20px; margin-right: 10px;'></img>"+datas[0]+"</a>"); */
										alldata = datas
										$("#foodlist").empty();
										var htmlstr = "";
										htmlstr += "<div class='container-fluid' style='background:#ffffff'><div class='col-md-2'></div><div class='col-md-2'>菜名</div><div class='col-md-2'>价格</div><div class='col-md-6'>视频地址</div></div>";
										for (var i = 0; i < datas.length; i++) {
											//dada[i]
											//"<a href='javascript:selectbytype(\""+datas[i]+"\")' class='list-group-item'><img src='images/"+datas[i]+"' style='width: 20px; margin-right: 10px;'></img>"+datas[i]+"</a>";
											if (i % 2 == 0)
												htmlstr += "<div class='container-fluid' style='background:#fafafa;height:50px;line-height:50px'><div class='col-md-2'><img src='images/"+<%=userid%>+"/"+datas[i].foodid+".png' style='height: 40px; margin-right: 10px;margin-top: 5px;'></img></div><div class='col-md-2'><a href='javascript:showdetail(\""
														+ i
														+ "\")'>"
														+ datas[i].name
														+ "</a></div><div class='col-md-2'>"
														+ datas[i].price
														+ "</div><div class='col-md-6'>"
														+ datas[i].url
														+ "</div></div>";
											else
												htmlstr += "<div class='container-fluid' style='background:#ffffff;height:50px;line-height:50px'><div class='col-md-2'><img src='images/"+<%=userid%>+"/"+datas[i].foodid+".png' style='height: 40px; margin-right: 10px;margin-top: 5px;'></img></div><div class='col-md-2'><a href='javascript:showdetail(\""
														+ i
														+ "\")'>"
														+ datas[i].name
														+ "</a></div><div class='col-md-2'>"
														+ datas[i].price
														+ "</div><div class='col-md-6'>"
														+ datas[i].url
														+ "</div></div>";
										}
										$("#foodlist").html(htmlstr);
									}
								});

					});
	function showdetail(j) {
		//var str=JSON.stringify(data);
		var parentdata=alldata[j];
		$("#fooddetailimg").attr("src","images/"+parentdata.sellerid+"/"+parentdata.foodid+".png");
		$("#div_detail").empty();
		var htmlstr = "<span>菜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span><input value=\""+parentdata.name+"\" disabled= true><br/><br/>"+
		"<span>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</span><input value=\""+parentdata.price+"\" disabled= true><br/><br/>"+
		"<div ><span>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</span><textarea style=\"width:400px;height:100px\" disabled= true >" +parentdata.des+"</textarea></div><br/><br/>"+
		"<span>视频地址：</span><input  value=\""+parentdata.url+"\" disabled= true style=\"width:400px;\">";
		$("#div_detail").html(htmlstr);
		$("#detailModel").modal({keyboard:true});
	}
</script>

<script type="text/javascript">
	
</script>

<script type="text/javascript">
	function modify() {
		$.ajax({
			cache : true,
			type : "GET",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			url : "seller/upuserinfo",
			data : {
				permintid : $("#permintid").val(),
				name : $("#name").val(),
				tel : $("#tel").val()
			},
			/* data:{userid:$("input[name='userid']").val() }, */
			async : false,
			error : function(request) {
				alert("2服务器连接失败");
			},
			success : function(datas) {
				if (datas == "111")
					window.location.href = "#";
			}
		});
		return false;
	}
</script>

<script type="text/javascript">
	//var timer;
	function addfood() {
		//var count=0;
		$.ajax(
			  	{
			  		 cache: true,
			                type: "POST",
			                url:"seller/addfood",
			                data:$("#foodinfo").serialize(),// 你的formid
			                async: false,
			                error: function(request) {
			                    alert("服务器连接失败");
			                },
			                success: function(data) {
			               		if(data=="111")
			             	 	 {
			               			return clicke();
			               		 }
			               		else
			               			{alert("添加失败")
			               			return false;}
			                }
			  		}
			  	);
	}
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
						window.location.href="index.jsp?id=4";
				},
				error : function(data, status, e) {
						alert("图片上传失败")
				}
			});
		} else
			{
			alert('请选择图片文件');
			return false;
		}
	}
//var timer;
	
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
		data-target="#myModal">添加菜单</button>
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
					<h4 class="modal-title" id="myModalLabel"
						style="text-align: center">添加美食</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class='col-md-4' >
							<img src='images/1.png' id="foodimg" style='height: 100px;'>
						</div>
						<div class='col-md-8'>
							<form action="#" id="uploadform" method="post"
								enctype="multipart/form-data">
								<input id="uploadfile" type="file" name="file"
									style="size: 100; background: #ffffff; border: 1px solid #000000" />
							</form>
						</div>
					</div>
					<br/>
					<br/>
					<div class="container-fluid">
						<form action="#" id="foodinfo" method="post"
							enctype="multipart/form-data">
							<span>菜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span><input name="name">
							<br/>
							<br/>
							<span>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</span><input name="price" onkeyup="value=value.replace(/[^\d.]/g,'') ">
							<br/>
							<br/>
							<div ><span>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</span><textarea name="des" style="width:400px;height:100px"> </textarea></div>
							<br/>
							<br/>
							<span>视频地址：</span><input type="text"  name="url" style="width:400px;">
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onClick="addfood()">保存</button>
				</div>

			</div>
		</div>
	</div>
	
		<div class="modal fade" id="detailModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"
						style="text-align: center">菜品详情</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class='col-md-4'>
							<img src='images/1.png' id="fooddetailimg" style='height: 100px;'>
						</div>
						<div class='col-md-8'>
							<span id="username" style='height: 100px;'></span>
						</div>
					</div>
					<br /> <br />
					<div class="container-fluid" id="div_detail"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<!-- <button type="button" class="btn btn-primary" onClick="addfood()">确定</button> -->
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid" id="foodlist"></div>


</body>
</html>
