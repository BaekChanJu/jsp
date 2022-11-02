<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
//삭제버튼 눌려졌을 때 파라미터 넘겼으니 파라미터 넘긴값 받아와야함
	//아까 리스트메세지 란에서 messageId 를 파라미터로 만들어서 어떤것이 삭제되야하는지 알아야하니
	//그값을 겟파라미터로 가져와 mId라는 변수에 일단저장을했다
	String mId = request.getParameter("messageId");

%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 삭제 </title>
</head>
<body>
<!-- mId로 몇번메세지인지 확인 가능하다 -->
	<%=mId %>번 메세지를 삭제하려면 암호를 입력하세요. <br/><br/>
	
	<form action="deleteConfirm.jsp" method="get">
	<!-- 어쨋든 아이디와 패스워드 2개는 넘어가야하는데 몇번째가 삭제됬는지는 고객이 알필요가 없음 -->
	<!-- 메세지 삭제 눌렀을 떄  텍스트로 타입을 하면 삭제된게 구지 고객한태 뭐라고나오자나
	 그걸 안보이게 하기위해서 히든 벨류에 mId까지 지정 -->
		<input type = 'hidden' name = 'messageId' value= '<%=mId %>'>
		암호 : <input type="password" name="password" />
		<input type="submit" value="메세지 삭제"/>
	</form>
</body>
</html>