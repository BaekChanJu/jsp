<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String projectName = "/jsp"; %>    


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 메인</title>
</head>
<body>
	메인화면이라 . . . 그냥 상상하고 . . . 
	<!-- 1.실행하면 방명록 이라는 글씨에 a태그가 설정되어있다
		2./GuestControl를 적어 GuestControl울 사용하는것이고 ? 뒤에는 파라미터로 cmd - 내가정한이름 을 준다
		3.그전에 projectName 위에서 변수선언한걸 꼭적어준다 
		이렇게 main.jsp현재란의 작성은 끝났고  GuestControl란으로 넘어가보자
		(listMessage 란으로 넘어가야함)
	 -->
	<a href="<%= projectName %>/GuestControl?cmd=list-page"> 방명록 </a><br/><br/>
	<img src="imgs/image.gif"><br/>
</body>
</html>