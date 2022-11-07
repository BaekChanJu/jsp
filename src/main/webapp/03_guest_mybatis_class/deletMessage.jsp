<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>   
  <% 
  int commentNo = Integer.parseInt( request.getParameter("cId"));
  CommentService.getInstance().deleteComment(commentNo);
  
  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%response.sendRedirect("listComment.jsp"); %>
</head>
<body>

</body>
</html>