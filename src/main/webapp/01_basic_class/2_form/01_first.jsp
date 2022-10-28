<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 로그인창 </title>
</head>
<body>

<h3>로그인 확인하기 </h3> 
<!-- 서버까지 전송하려면 form태그가 있어야함 -->
<form action="01_second.jsp" method="post">
사용자: <input name='User' type='text'><br/>
비밀번호: <input name='Pass' type='password'><br/>
<!-- 반드시 서브밋이여야 서버까지 전송임 -->
<input type='submit' value='login'> 
</form>

</body>
</html>