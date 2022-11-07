<%@ page language="java" contentType="text/html; charset=utf-8" %>
 <%@ page import="java.util.*" %>
 <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>  
  <!-- 1107 맨처음 오라클에 디비입력하면 목록확인하는칸! -->
  <!-- 서비스의 메소드 호출  -->
  <%
     //Map condition = new HashMap();
  
  //디비목록을 확인하기 위해 선언해야함 / 오라클은 매퍼에서 전부처리해주기때문에 메퍼에 오라클작성호 모두 xml로 연동시켜야함
     List<Comment> mList = CommentService.getInstance().selectComment();
 %>
  
<!DOCTYPE HTML>
<html> 
<head>
	<meta charset="UTF-8"> 
<title>목록보기</title>
</head>
<body>

<a href="insertCommentForm.jsp">방명록 남기기 </a><br/><br/>

<table border="1">
	<tr><td>글번호</td><td>작성자</td><td>등록일</td></tr>
	<% for( Comment comment : mList ) { %>
		<tr>
			<td><%= comment.getCommentNo() %></td>
			<td><a href="viewComment.jsp?cId=<%=comment.getCommentNo()%>"><%= comment.getUserId()%> 님이 쓴 글</a></td>
			<td><%= comment.getRegDate()%></td>
		</tr> 
	<% } %>
</table>
</body>
</html>