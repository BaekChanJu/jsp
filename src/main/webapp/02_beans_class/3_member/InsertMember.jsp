<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>

<!-- 하나씩 천천히 도전합시다 -->
<% request.setCharacterEncoding("utf-8"); %>

<!-- 겟파라미터로 원래 값들을 하나씩 다 가져와서 저장하고 출력했지만
 빈을 사용하면 태그안에다 기술해서 좀 간편하게 사용할수가 있다
 
 1.일단 클래스에 src소스에 만들어놓은 셋게터, 인터페이스등을   "member.beans.Member" 전체파일 명으로 대려와주고
 id 에 내맘대로 이름을 정해와서 편하게 사용할 수 있다
 
 2. <jsp:setProperty name ="m" property = "*"/>
 위와 동일한 이름을 지정하고 가져오는 것인데 프로퍼티로 * 전체의 내용을 편하게 한번에 가져올 수 있다
 -->
<jsp:useBean id = 'm' class = "member.beans.Member">
	  <jsp:setProperty name ="m" property = "*"/>

</jsp:useBean>
<%
	MemberDao dao = MemberDao.getInstance();
	dao.insertMember(m);
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입 확인  </title>
</head>
<body>
   아이디 : <%=m.getId() %><br>
   패스워드 : <%=m.getPassword() %><br>
   이름 : <%=m.getName() %><br>
   전화 : <%=m.getTel() %><br>
   주소 : <%=m.getAddr() %><br>
</body>
</html>