<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap3/css/bootstrap.min.css ">
<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap3/css/bootstrap-theme.css">
<script src="${pageContext.request.contextPath }/bootstrap3/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap3/js/bootstrap.min.js"></script>
<title>用户登录</title>
<script type="text/javascript">
	
	function checkForm(){
		var userName=document.getElementById("userName").value;
		var password=document.getElementById("password").value;
		if(userName==null||userName==""){
			alert("用户名不能为空！");
			return false;
		}
		if(password==null||password==""){
			alert("密码不能为空！");
			return false;
		}
		return true;
	}

	function resetValue(){
		document.getElementById("userName").value="";
		document.getElementById("password").value="";
	}
</script>
</head>
<body>
<div align="center" style="padding-top:20px;">
	<form action="manager!login" method="post" onsubmit="return checkForm()">
		<table width="1004" height="584"  background="image/login.jpg" style="border-collapse:separate; border-spacing:5px 15px;">
			<tr height="200">
				<td colspan="4"></td>
			</tr>
			<tr height="10">
				<td width="68%"></td>
				<td width="10%"><label>用户名：</label></td>
				<td><input type="text" id="userName" name="manager.userName" value="${manager.userName}"></td>
				<td width="30%"></td>
			</tr>
			<tr height="10">
				<td width="68%"></td>
				<td width="10%"><label>登录密码：</label></td>
				<td><input type="password" id="password" name="manager.password" value="${manager.password }"></td>
				<td width="30%"></td>
			</tr>
			<tr height="10">
				<td width="68%"></td>
				<td width="10%"><button type="submit" class="btn btn-primary">登录</button></td>
				<td><button type="button" class="btn btn-primary" onclick="resetValue()">重置</button></td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>

<script>
	if('${error}'!=""){
		alert("${error}");
	}
</script>