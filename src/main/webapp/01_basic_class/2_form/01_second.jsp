<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <!-- 지금은 사용자가 클라이언트가 입력을해서 일로보냈음
   그럼 리퀘스트로 온거임  -->

<%  String id = request.getParameter("User"); //내임명 들어와야함
	String pw = request.getParameter("Pass");
	
%> 
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	<!-- 출력하려면 = 사용 -->
	입력한 아이디 :  <%= id %> <br/>
	입력한 패스워드 :  <%= pw %>  
</body>
</html>