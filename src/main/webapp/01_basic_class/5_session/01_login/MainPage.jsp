<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 마지막으로 입력해야하는칸 -->

<%

	//# 1."id"로 저장된 세션값을 얻어온다.
	  Object obj  = session.getAttribute("id"); //겟어트리비티는 오브젝트 타입이라 오브젝트로 받아줘야함
	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
	if(obj == null){
		response.sendRedirect("LoginForm.jsp");
		return; // 어차피 다른화면으로 넘어갈건데 아래 프로그램이
		//실행될이유가 없으니 그냥 리턴으로 탈출해버리기
	}
	//# 3. null이 아니라면 String 형변환하여 변수에 지정
	String userId = (String)obj; //그럼 널이 아닐때 즉 입력했을때 형변환 해서 넣어주기
	
%>
    
<!DOCTYPE html>
<html>
<head>
<title> 우리 페이지 </title>
</head>
<body>

	<h2> 이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다 </h2><br/><br/><br/>
	<%=userId %>님, 로그인 중입니다.

</body>
</html>