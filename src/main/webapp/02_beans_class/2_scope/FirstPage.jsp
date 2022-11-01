<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 


	//--------------------------- 값 지정
	pageContext.setAttribute("name", "KIM"); //여기서만 사용가능
	request.setAttribute("name", "SEUNGMIN"); //리퀘스트에 저장하면!
	// 페이지만 바뀌지 url은 그대로임 값도 그대로 (포워드 사용시)
	//리스폰즈로 하면 값이 널로뜸
	
	session.setAttribute("name", "DOKDO"); //브라우저가 닫히기 전까지는 계속저장됨
	application.setAttribute("name", "KOREA");
	//application.log("FirstPage.jsp : " + pageContext.getAttribute("name") + "님 접속");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 첫번째 페이지 </title>
</head>
<body>

하나의 페이지 속성 : <%= pageContext.getAttribute("name") %> <br>
하나의 요청 속성 :	 <%= request.getAttribute("name") %> <br>
하나의 세션 속성 :	 <%= session.getAttribute("name") %> <br>
하나의 어플리케이션 속성 : <%= application.getAttribute("name") %> <br>

<!-- #############  -->

<!-- <a href = 'SecondPage.jsp'>다음</a> -->
<%-- <% response.sendRedirect("SecondPage.jsp"); %> --%>

<!-- 페이지 forward 이동된다면  -->
<!-- 포워드는 리퀘스트에 저장해도 페이지만 바뀌지 위 url은 그대로 있고 값도 그대로 있다
 -->
 
 
 
 <!-- 
 request.getParameter() : 이건 클라이언트에서 넘어온 데이터 받을때
 
 request.getAttribute(); 는 반드시 셋어트리비티에 저장했을경우만 사용가능 여기는 서버에서받아서
 서버에서 처리할때의 경우이다
  -->
<jsp:forward page = "SecondPage.jsp"/>

</body>
</html>