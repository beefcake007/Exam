<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>考生成绩列表</p>
	</div>
	<div class="search-content">
		<form action="${pageContext.request.contextPath }/exam!list" method="post">
			<table align="center">
				<tr>
					<td><label>准考证号：</label></td>
					<td><input type="text" id="s_id" name="s_exam.student.id" value="${s_exam.student.id }" class="form-control"></td>
					<td>&nbsp;</td>
					<td><label>姓名：</label></td>
					<td><input type="text" id="s_name" name="s_exam.student.name" value="${s_exam.student.name }" class="form-control"></td>
					<td>&nbsp;</td>
					<td><button type="submit" class="btn btn-primary">查询</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="data_content">
		<table class="table table-hover table-bordered">
			<tr>
				<th>序号</th>
				<th>准考证号</th>
				<th>考生姓名</th>
				<th>试卷名称</th>
				<th>考试日期</th>
				<th>单选题得分</th>
				<th>多选题得分</th>
				<th>总分</th>
			</tr>
			<c:forEach var="exam" items="${examList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${exam.student.id }</td>
					<td>${exam.student.name }</td>
					<td>${exam.paper.paperName }</td>
					<td><fmt:formatDate value="${exam.examDate }" pattern="yyyy-MM-dd"/></td>
					<td>${exam.singleScore }</td>
					<td>${exam.moreScore }</td>
					<td><font color="red">${exam.score }</font></td>
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