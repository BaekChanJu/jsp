<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>
 
<%
	//3. <여기는 나중에 다만들고 - 목록을 만드는 것과는 아직 상관이없음> 페이지를 누르면 입력값이 넘어오는거임 어쩔수없이 첫페이지는 널임
	//번호눌렸을때 ?뒤에 파라미터 이름을 page 라고 만들었었다(맨아래 for문 참조) 그값을 들고오는것 그받아온 값 pNum 변수를 .getMessageList(pNum);에 인자로 넣어줘 함수수정해보자
				
	String pNum =request.getParameter("page");	

		

	// 1. <여기가 먼저 목록을 만드는것>전체 메세지 데이타 검색  - 네이버 카페에 이거에 대한 내용이 사진으로 나와있으니 참고
		//결론은 전체 메시지가 저장된 데이터들을 검색해서 가져온게 배열리스트형식 이기에 리스트에 담아야한다는 것임
		
		//service 변수에 일단 싱글톤 패턴 겟인스턴스를 저장후 
	ListMessageService service = ListMessageService.getInstance();
	
	
	//지금은 일단 비어있는 service.getMessageList(); > getMessageList() 의 인자가 현재는없다
	 //불러와서 리스트변수에 담는다 즉 나오게 하는 목록배열을 만들어 주는것임
	 
	//getMessageList 안에서 selectList를 호출하는데 selectList 함수가 저장된 디비에서 목록꺼내오게 만드는 함수임 거기sql잘 채워야함
			//나중에 만든 인자가있는 selectList 함수 완성후 여기에 pNum 을 넣어주면 아래 페이지가 넘어가면서 3개 기준을 잘나온다
			//3번의 부속
	List <Message> mList = service.getMessageList(pNum);
	
	
	//2. 실제 데이터베이스의 레코드만큼 <여기는 나중에 다만들고 - 목록을 만드는 것과는 아직 상관이없음> - 이게 있어야
		//아래 for문으로 페이지 번호들을 만들 수 있음
			//getTotalPage 함수안에 getTotalCount라고 다오칸에 계산구문sql있어서 만들어 사용해야함
	int totalPageCount = service.getTotalPage();
 	
%>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>
</head>
<body>

<!-- isEmpty selectList() 함수안에있음 그거 가져온거임 
	1번의 내용가지고 if문 안을 작성 먼저 가능-->
	
	<% if( mList.isEmpty() ) { %>
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
		<!-- Message 클래스의 저장된 그 변수들 : 리스트들  -->
		<!-- 왼쪽에 자료형 객체 m 생성완료 셋게터 -->
		<% for(Message m  : mList){ %>
		<tr>	
		<!-- getMessageId 시퀀스로 만든 자동 숫자가뜨고
		m.getGuestName 방명록을 쓴 사람의 이름이뜬다
		그리고 삭제버튼을 하나만들었고 삭제를 누르면 deleteMessage.jsp 로넘어감 파라미터까지 가져가야
		뭘 삭제할지 알 수있다 기억하기
		 -->
			<td> <%= m.getMessageId() %></td> 
			<td> <%= m.getGuestName() %> </td> 
			<%--물음표 기준으로 파라미터 만들어서 파라미터  
			아이디로 가져감 왜냐 몇번이 삭제되는지 누가 삭제되는지 알아야하니까 --%>
			<td><a href = 'deleteMessage.jsp?messageId=<%= m.getMessageId() %>'>[삭제]</a></td>			
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;">
			
			<%= m.getMessage() %>
			</textarea>
			</td>
		</tr>
	<% } // end for %>
	

	</table>
	
	<% } // end if-else %>
	<!-- 글쓰기를 누르면 다시 전페이지로 돌아가게 -->
	<a href = 'insertMessage.jsp'>글쓰기</a>
	
	<hr/>
	
	<!-- 추후2,3번 완성후 사용되는 for문 -->
	<%for(int i = 1 ; i<=totalPageCount; i++){ %>
		<a href = 'listMessage.jsp?page=<%= i%>'>[<%= i  %>]</a>
	<%} //end for %>
</body>
</html>