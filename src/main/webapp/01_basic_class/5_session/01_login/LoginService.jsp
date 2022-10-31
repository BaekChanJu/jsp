
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <!-- 두번째로 작성해야하는칸 -->
<!DOCTYPE html>
<html>
<head>
<title> 로그인확인 </title>
</head>
<body>
<%
	//쿠키는 문자열만 저장이 가능하다는 단점과 보안에 취약함
	//그럼 서버 메모리에 저장하자 서버는 어차피 안뜨니까 서버에 저장하는게 세션임 내장객체


	// 실제로는 DB에서 가져와야하는 값
	String saveUser = "bcj0825";
	String savePass = "@!b01051642240";
	
	// 이전화면 폼에서 넘겨받는 값
	String user = request.getParameter("User");
	String pass = request.getParameter("Pass");
			
	// user, password가 같을 때 로그인 성공, 그렇지 않으면 로그인 실패
	if( ( user.equals(saveUser) ) && ( pass.equals(savePass) ) ){
		// #2. 세션에 "id"라는 이름에 변수 user 값을 저장
				session.setAttribute("id", user);
		//근데 세션저장된거 못봄 서버에 메모리를 써서 우리가 볼수가없음 쿠키는 브라우저에 저장한거니까 보이고
		
		// #1. 로그인 성공하면 바로 MainPage.jsp를 요청
		response.sendRedirect("MainPage.jsp");
	} else {
		response.sendRedirect("LoginForm.jsp");
		// #1. 로그인에 실패하면 바로 LoginForm.jsp을 요청

	}			
%>
	
</body>
</html>
