<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	function studentDelete(studentId){
		if(confirm("确定要删除这条记录吗？")){
			$.post("student!deleteStudent",{id:studentId},function(result){
				var result=eval('('+result+')');
				if(result.success){
					alert("删除成功！");
					window.location.href="${pageContext.request.contextPath }/student!list";
				}else{
					alert("删除失败！");
				}
			});
		}
	}
</script>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>考生信息管理</p>
	</div>
	<div class="search-content">
		<form action="${pageContext.request.contextPath }/student!list" method="post">
			<table align="center">
				<tr>
					<td><label>准考证号：</label></td>
					<td><input type="text" class="form-control" id="s_id" name="s_student.id" value="${s_student.id }"></td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><label>姓名：</label></td>
					<td><input type="text" class="form-control" id="s_name" name="s_student.name" value="${s_student.name }"></td>
					<td>&nbsp;</td>
					<td><button type="submit" class="btn btn-primary">查询</button></td>
				</tr>
			</table>
		</form>
		<button style="float:right;margin-bottom:8px;" type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='student!preSave'">添加考生信息</button>
	</div>
	<div class="data_content">
		<table class="table table-hover table-bordered">
			<tr>
				<th>序号</th>
				<th>准考证号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>身份证</th>
				<th>密码</th>
				<th>专业</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${studentList }" var="student" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${student.id }</td>
					<td>${student.name }</td>
					<td>${student.sex }</td>
					<td>${student.cardNo }</td>
					<td>${student.password }</td>
					<td>${student.prefession }</td>
					<td><button type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='student!preSave?id=${student.id}'">修改</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm" onclick="studentDelete('${student.id}')">删除</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<nav aria-label="Page navigation">
 			<ul class="pagination" >
 				${pageCode }
 			</ul>
 		</nav>
	</div>
</div>
</body>
</html>