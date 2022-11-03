<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board_ex.service.*,  board_ex.model.*" %>
<%
	// 1. 삭제할 레코드의 게시글번호 넘겨받기 - 전단에서 또 파라미터 만들어서 넘겨줬음
	String seq = request.getParameter("seq");
%>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 게시글 삭제하기 </title>
</head>
<body>

	<%=seq %>번 삭제할 글암호를 입력하세요 <br/>
	
<form method="get" action="BoardDelete.jsp">
<!-- 2. 게시글번호를 다음 페이지로 넘기기 위해 hidden 태그로 지정 -->	
	<!-- 뭘 삭제할지 알아야하니 고객은 몰라도 됨 그래서 히든으로 벨류값으로 게시글번호 seq 를 또 넘겨줌 
	그래서 히든인 게시글번호 비밀번호 2개를 잘 넘겨줘야한다!-->
	<input type = 'hidden' name = 'seq' value= '<%=seq %>'>
	<input type="password" name="password" >
	<input type="submit" value="삭제하기">
</form>

</body>
</html>