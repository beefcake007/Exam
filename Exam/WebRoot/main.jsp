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
<link rel="stylesheet" href="${pageContext.request.contextPath }/style/exam.css">
<script src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js"></script>
<title>在线考试系统</title>

</head>
<%
	String mainPage=(String)request.getAttribute("mainPage");
	if(mainPage==null||mainPage.equals("")){
		mainPage="common/default.jsp";
	}
 %>
<body>
<div class="container">
	<table width="1000px" align="center">
		<tr>
			<td>
				<jsp:include page="common/head.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="common/menu.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="<%=mainPage %>"></jsp:include>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="common/foot.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</div>
</body>
</html>