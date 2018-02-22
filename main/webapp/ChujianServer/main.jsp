<%@ page language="java" import="java.util.*"
	pageEncoding="utf-8"%>
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
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/ajaxfileupload.js">
</script>
	
<script type="text/javascript">
//var timer;
function clicke(){	
	//var count=0;
	var value = $("#uploadfile").val(); 
	if(value!=""){
$.ajaxFileUpload({
			url : 'upload',
			
			secureuri : false,
			fileElementId : 'uploadfile',
			dataType:'text',
			//data : {username : $("#username").val()},
			success : function(data, status) {
				if(data=='111')
					alert('上传成功');
			},
			error : function(data, status, e) {
				alert('上传出错');
			}
		});}
	else alert('请选择文件');

		return false;}
	
	//timer=setInterval("getsession()",1000);
	
	///alert(state)
	//if(state=="finish")
	//clearInterval(timer);
	
</script>

	</head>

	<body>
		<!-- 菜单条 -->
		<div class="btn-group" role="group" aria-label="...">

			
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
					上传文件
				</button>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">选择文件</h4>
      </div>
      
       <form action="#" id="uploadform"
				 method="post" enctype="multipart/form-data">
	<div class="modal-body">
				<input id="uploadfile" type="file" name="file" style="size:100;background:#ffffff;border:1px solid #000000"  />
				
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="uploadbtn"  onClick="clicke()">上传</button>
      </div>
     </form>
    </div>
  </div>
</div>



			<button type="button" class="btn btn-default" >
				离线下载
			</button>

			<div class="btn-group" role="group">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					我的设备
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li>
						<a href="#">任务列表</a>
					</li>
					<li>
						<a href="#">添加设备</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 菜单条  end -->
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				全部内容
			</div>

			<!-- Table -->
			<table class="table table_hover" >
				<thead>
					<tr>
						<th>
							文件名
						</th>
						<th>
							大小
						</th>
						<th>
							修改日期
						</th>
						
					</tr>
				</thead>
				<tbody id="filelist">


				</tbody>
			</table>
		</div>

	</body>
</html>
