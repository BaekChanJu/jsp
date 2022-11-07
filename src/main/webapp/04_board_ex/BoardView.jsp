<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="board_ex.service.*, board_ex.model.*" %>
<%
	// 게시글번호 넘겨받아 전단에서 파라미터만들어서 넘겼음
	String seq = request.getParameter("seq");

	// 서비스의 함수를 호출하여 해당 BoardVO를 넘겨받는다. 
 	ViewArticleService service = ViewArticleService.getInstance();
	
	//받은 글번호를  BoardVO vo에 넘겨준다 / 겟세터존
		//왜냐 VO를 사용해야하거든 아래 값 나오게하려면
		//getArticleById 함수안에 카운터알아내는함수랑 /  게시글번호에 의한 레코드(데이타) 검색하는 함수 셀렉트 아이디 2개가있음
	BoardVO vo = service.getArticleById(seq);

	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 게시글 보기 </title>
</head>
<body>

	<h4> 게시판 글 보기 </h4><br/>
	<table border="1" bordercolor="red">
	<tr>
		<td> 제  목 : </td>
		<td><%= vo.getTitle() %></td>
	</tr>
	<tr>
		<td> 작성자 : </td>
		<td><%= vo.getWriter() %></td>
	</tr>
	<tr>
		<td> 작성일자 : </td>
		<td><%= vo.getRegdate() %></td>
	</tr>
	<tr>
		<td> 내  용 : </td>
		<td><%=vo.getContent() %></td>
	</tr>
	<tr>
		<td> 조회수 : </td>
		<td><%=vo.getCnt() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="BoardList.jsp"> 목록보기 </a>
			<a href="BoardModifyForm.jsp?seq=<%= vo.getSeq() %>"> 수정하기 </a>
			<a href="BoardDeleteForm.jsp?seq=<%= vo.getSeq() %>"> 삭제하기 </a>		
		</td>
	</tr>
	</table>


</body>
</html>