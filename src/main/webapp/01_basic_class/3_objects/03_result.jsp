<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- 이전 02에서 사용자 입력값을 얻어와서 화면에 출려갛기 
클라이언트가 서버로 날려주는걸 받아와야겠지?-->

	<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String pet[] = request.getParameterValues("pet");
	
	String cPet="";
	
	for(int i =0; i<pet.length; i++){
		cPet = pet[i];
	}
	
%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : <%= name%>
펫 : <%= cPet%>

</body>
</html>