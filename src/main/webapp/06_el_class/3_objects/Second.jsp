<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 데이타 받는 페이지 </title>
</head>
<body>
<!--String param = request.getParameter("data"); 를 아래로  -->

파라메터 값(전 페이지에서 넘어오는 값) : ${param.data} <br/> 

<!-- 여기선 그냥 세션. 하면 jsp에도 존재해서 겹침
그래서 jsp할땐 session / 표현언어에선  sessionScope-->
세션의 값 :  ${sessionScope.login }<br/> 

<!-- 쿠키는 꼭 벨류값까지 가져와야함 -->
쿠키의 값 :${cookie.isFlag.value } <br/>


<hr>


</body>
</html>