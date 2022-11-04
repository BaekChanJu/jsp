<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- MV패턴 -->
<a href='simpleView.jsp'>기존방식</a><hr/>

<!-- MVC패턴 -->
<a href='/jsp/SimpleControl'>MVC 방식</a><br/>
<!-- 앞 이름 안따짐 확장자 아까 만든거만 잘 맞으면됌 -->
<a href='/jsp/xxxx.kosmo'>MVC 방식2</a><br/>



<!-- 기존방식은 심플뷰 잘나옴
mvc 방식은 컨트롤러로 내가 설정한  /simpleView.jsp" 가 나오게함 -->
</body>
</html>