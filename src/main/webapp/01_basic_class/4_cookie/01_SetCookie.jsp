<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		


<%	
	// 1. Cookie 객체 생성

	Cookie cookie = new Cookie("ID","ckswn");
	// 2. 속성 부여 - 속성을 부여하지않으면 브라우저 닫힐때까지만 유지됨
	cookie.setMaxAge(1*60*5);
	
	// 3. 클라이언트에 쿠키 전송
		//서버에서 클라이언트로 보내야 하네? jsp 시작이 서버고 그걸 브라우저에 저장해야하니까
			response.addCookie(cookie);

	
	
%>

<html>
<head><title>쿠키</title></head>
<body>

<b>Simple Cookie Example</b><hr>

<br><a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body></html>