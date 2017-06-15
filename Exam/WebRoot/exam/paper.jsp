<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	var examTime=20*60;
	var userTime=0,remainTime=examTime;
	
	function showCount(){
	
		if(remainTime==0){
			document.getElementById("myForm").submit();
		}
		
		userTime+=1;
		remainTime-=1;
		
		var hourU=Math.floor(userTime/3600);
		var minuteU=Math.floor((userTime-hourU*3600)/60);
		var secondU=Math.floor(userTime-hourU*3600-minuteU*60);
		document.getElementById("useTime").innerHTML=format(hourU)+":"+format(minuteU)+":"+format(secondU);
		
		var hourR=Math.floor(remainTime/3600);
		var minuteR=Math.floor((remainTime-hourR*3600)/60);
		var secondR=Math.floor(remainTime-hourR*3600-minuteR*60);
		document.getElementById("remainTime").innerHTML=format(hourR)+":"+format(minuteR)+":"+format(secondR);
	}
	
	function format(timeNumber){
		if(timeNumber<10){
			return "0"+timeNumber;
		}else{
			return timeNumber;
		}
	}
	
	window.setInterval("showCount()",1000);
</script>
</head>
<body>
<div class="data_list"> 
	<div class="data_info">
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考试时间：<strong>20分钟</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		计时：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="useTime" style="font-weight: bold;"></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		剩余时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="remainTime" style="font-weight: bold;"></font></p>
		<hr/>
		<p class="examTitle">${paper.paperName}&nbsp;&nbsp;考试卷</p>
		<p class="examScoreInfo">(&nbsp;满分120&nbsp;&nbsp;单选题60分&nbsp;&nbsp;多选题60分&nbsp;)</p>
	</div>
	<div class="data_exam_content">
		<form action="exam!add" method="post" id="myForm">
			<input type="hidden" name="exam.student.id" value="${currentUser.id }">
			<input type="hidden" name="exam.paper.id" value="${paper.id }">
			<strong><big>一，单选题</big></strong>(每题20分，打错不得分)<br><br>
			<c:forEach var="s" items="${squestionList }" varStatus="status"> 
				<strong>[&nbsp;${status.count }&nbsp;]&nbsp;${s.subject }</strong><br>
				<label class="radio">
					<input type="radio" name="id-r-${s.id }" value="A">
					${s.optionA }
				</label>
				<label class="radio">
					<input type="radio" name="id-r-${s.id }" value="B">
					${s.optionB }
				</label>
				<label class="radio">
					<input type="radio" name="id-r-${s.id }" value="C">
					${s.optionC }
				</label>
				<label class="radio">
					<input type="radio" name="id-r-${s.id }" value="D">
					${s.optionD }
				</label>
				<br>
			</c:forEach>
			
			<br>
			
			<strong><big>一，多选题</big></strong>(每题30分，打错不得分)<br><br>
			<c:forEach var="m" items="${mquestionList }" varStatus="status"> 
				<strong>[&nbsp;${status.count }&nbsp;]&nbsp;${m.subject }</strong><br>
				<label class="checkbox">
					<input type="checkbox" name="id-c-${m.id }" value="A">
					${m.optionA }
				</label>
				<label class="checkbox">
					<input type="checkbox" name="id-c-${m.id }" value="B">
					${m.optionB }
				</label>
				<label class="checkbox">
					<input type="checkbox" name="id-c-${m.id }" value="C">
					${m.optionC }
				</label>
				<label class="checkbox">
					<input type="checkbox" name="id-c-${m.id }" value="D">
					${m.optionD }
				</label>
				<br>
			</c:forEach>
			<button class="btn btn-primary" type="submit">交卷</button>
		</form>
	</div>
</div>
</body>
</html>