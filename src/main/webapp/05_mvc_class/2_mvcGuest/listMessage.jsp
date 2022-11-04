<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.guest.model.*" %>    
<%@ page import="java.util.List" %>
 
<%
	// 아까 다녀온 CommandList 함수안에 지정을 셋으로 했으니  getAttribute로 param을 받아온다
		//근데 넘어온값은 오브젝트 이지만 리스트는 배열 그래서 배열로 형변환 해서 mList에 넣어줬다
	List <Message> mList = (List <Message>)request.getAttribute("param");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 2 </title>
</head>
<body>
	<!-- 1104이젠 무저건 jsp바로가 아닌 컨트롤러를 타야한다 -->

	<!-- 여기서는 방명록 남기기를 누르면 그 방명록 남기기 칸으로 넘어가야하는데 게스트컨트롤이 모두 관리하니 똑같이 
	cmd 이름 정하고 컨트롤 클래스로 넘어가보자-->
	
	<a href="GuestControl?cmd=input-form">방명록 남기기 </a><br/><br/>
	
	<% if( mList == null ) { %>
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
		<% for( Message msg : mList ) { %>
		<tr>	
			<td> <%= msg.getId() %> </td> 
			<td> <%= msg.getGuestName() %></td> 
			<!-- 삭제하기 동작시! 뭘삭제할지모르니 &로 파라미터 추가하기 -->
			<!-- 똑같이 cmd만들어줘서 컨트롤 하지만 id까지 추가해서 보낸다 뭘 삭제해야할지 모르니까(글번호)
			그럼일단 또 GuestControl 란으로 가볼까? -->
			<td> <a href="GuestControl?cmd=delete-form&id=<%= msg.getId() %>"> [ 삭제하기 ]</a> </td>			
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%= msg.getMessage() %>
			</textarea>
			</td>
		</tr>
		<% } %>
	</table>
	

	<% } // end if-else %>
</body>
</html>