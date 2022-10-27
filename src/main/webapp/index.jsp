<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 변수선언부변수선언시에만 ! 앞에 붙힘 그냥 구문은 ! 안붙힘  -->
  <%!  String msg; %>  
  
    <%  
    msg = "안녕하삼";
    %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
메세지 : <%=msg %>
</body>
</html>