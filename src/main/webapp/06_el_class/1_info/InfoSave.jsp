<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("UTF-8"); %>

<!-- infoBean 이라는 클래스를 info 라는 이름으로 써야지!
만약 자바였으면
 infoBean info = new infoBean()-->
<jsp:useBean id="info" class="info.infoBean"> 
	<jsp:setProperty name="info" property="name" />
  <jsp:setProperty name="info" property="id" />
</jsp:useBean>

<!DOCTYPE html>
<HTML>
<HEAD><TITLE> 자료 출력 </TITLE></HEAD>
<BODY>

	<!-- 아래는 jsp의 기초문법의 표현식 -->
	<%= info.getName() %>
	
	<!-- action 태그의 출력문법 Bean  위와 아래는 같음 
		name에 객체이름 프로포티에 겟네임함수인 네임 -->
	<jsp:getProperty property="name" name="info"/>
	
	<!-- 화면출혁할 때 변수를 활용 : 표현언어(EL) 아래값으로 넣어봄 -->
	


<hr/>
	<H2>  당신의 신상명세서 확인 </H2>
	이   름  : ${info.name}  <br/> <!-- 이걸 EL이라고 부름 표현언어 -->
	주민번호 : ${info.id }<br/>
	성  별   : ${info.gender}<br/>  <!-- 변수선언안해도 겟 젠더 부른다는 의미 -->
	맞습니까????
</BODY>
</HTML>