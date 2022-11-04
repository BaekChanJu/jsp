<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//아까 파라미터 넘긴거 이름 id임
	String messageId = request.getParameter("id");	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 삭제 </title>
</head>
<body>
<!-- 1.히든설정이유는 고객은 글번호 자체를 알필요가 없으니까 히든으로 설정한거임
근데 삭제하려면 기본으로 
아이디와 비번이 필요하니 둘다넘기는데 아이디글번호만 히든으로 안넘기는것임
히든에 value에 값을 지정해보면 윈도우 소스보기에서 뭐가 넘어가는지 알 수있음!!
 -->
 
 <!-- 2. form태그안에 액션에 GuestControl?cmd=delete-conf지정했음 그럼또  GuestControl로 가볼까?-->

	메세지를 삭제하려면 암호를 입력하세요. <br/><br/>
	<form action="GuestControl?cmd=delete-conf" method="post">
	<!-- <input type="hidden" name="messageId" value="32"/> 소스보기엥 다나옴 히든 -->
		<input type="hidden" name="messageId" value="<%=messageId%>"/>
		암호 : <input type="password" name="password" />
		<input type="submit" value="메세지 삭제"/>
	</form>
</body>
</html>