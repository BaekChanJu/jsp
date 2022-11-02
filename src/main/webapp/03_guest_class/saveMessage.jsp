<%@page import="org.apache.tomcat.dbcp.pool2.UsageTracking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.service.WriteMessageService"%>    

<!--  준비물 - 서비스단중 한가지 사용해야하니  import="guest.service.WriteMessageService 일단임포트해놨음-->
<!-- MessageDao 클래스안에 sql로 작성하고 잘 연동됬나 오라클 확인도 필요 -->


 <% //0. 넘겨받는 데이타의 한글처리
 request.setCharacterEncoding("utf-8");%>     

 
 <!--1. 아까 화면에 입력된값을(이름,비번,메모)를  Message 클래스로 전달 
 (메세지클레스에 저장할수있게 변수랑 겟세터 들이 존재한다)
 
  먼저 Bean로 만들어서 Message클래스에 넣어놓고
  그다음 setProperty를 이용해 전체로 불러오기 * > 전체가 아니였다면 하나씩 불러와야함
 확인은 아래 겟네임 불러와 보면 확인이 가능 --> 
 
<jsp:useBean id = 'm' class ="guest.model.Message">
<jsp:setProperty name = 'm' property ='*'/>
</jsp:useBean> 

<%//2. Service 클래스의 함수 호출
//싱글톤 패턴으로 만들어져있어서 객체못만듬 함수불러와야함 > 객체를 생성해서 써야하는데 여기는 스태틱으로 이미 
//싱글톤패턴을 사용하게 만들었기 때문에 함수불러와 일단사용하게 한다

	//service 라는 변수안에 WriteMessageService.getInstance() 싱글톤 패턴을 저장해 놓은 getInstance() 를 불러오고
	//write 함수안에는 이미 객체를 생성해 놓았다 그래서 service변수에 객체가 저장되어있는 write에 전체의값 m을 넣어 호출을 한다
	//write에 insert를 들고옴  insert함수가 sql에 디비 저장하는함수임 직접 안에 잘 채워넣어야함
	WriteMessageService service = WriteMessageService.getInstance();
	service.write(m);
%>
 

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 남김 </title>
</head>
<body>
	<font size="3" color="#bb44cc">
	<!-- 겟세터에서 만들어놓은 m.getGuestName을 넣어줌으로 누구가 방명록에 글을 남겼나 확인이 가능하다 -->
	<%= m.getGuestName() %>	님이 방명록에 메세지를 남겼습니다. 
	</font><br/><br/><br/>
	<!-- listMessage.jsp 목록보기를 누른다면 저 페이지로 넘어간다 목록보기란에는 방명록 쓴사람들의 이름과 그내용들이뜬다 -->
	 <a href = 'listMessage.jsp'>[ 목록보기 ] </a>
</body>
</html>