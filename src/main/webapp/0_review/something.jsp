<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import = "member.dao.*"%> 
    

    
    <%
    //1번 입력값을 먼저 얻어와 변수에담는다 그전에 VO 셋게터 만들어 놓기
    String realname =request.getParameter("realname");
    String nickname  =request.getParameter("nickname");
    String myemail  =request.getParameter("myemail");
    int myage = Integer.parseInt(request.getParameter("myage"));
    
 	//2번 VO란을 객체생성해서 VO객체에 저장하기
    MemberVO vo = new MemberVO();
    vo.setRealname(realname); 
  	vo.setNickname(nickname);
  	vo.setMyemail(myemail);
  	vo.setMyage(myage);
  	
  	//3번 DB에 입력하기 그러기위해서 DAO에 드라이브로딩 연결 sql문 작성먼저 실시
  	 MemberDAO dao = MemberDAO.getInstance();
  	dao.insert(vo);
  	
    %>
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
본명 : <%= realname %>
별명 :  <%= nickname %>
이메일 :  <%= myemail %>
나이 :   <%= myage %>

</body>
</html>


