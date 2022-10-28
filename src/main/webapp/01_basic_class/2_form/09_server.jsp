<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<%
 	//1.이전form의 사용자 입력값을 가져오자
 		int empno = Integer.parseInt(request.getParameter("empno"));
		String ename = request.getParameter("ename");
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		String job =  request.getParameter("job");
		int sal = Integer.parseInt(request.getParameter("sal"));
 	
 	//2. 템프패키지에 EmpVO클래스에  멤버변수에 지정하기(해놨음지금) 
 			EmpVO vo = new EmpVO();  //객체생성
 			vo.setEmpno(empno); //셋게터 만들었으니 세터로 값 지정
 			vo.setEname(ename);
 			vo.setDeptno(deptno);
 			vo.setJob(job);
 			vo.setSal(sal);
 	//3.db에 입력
 	//만명접속했다고 만개 객체만들수 없으니 싱글톤 패턴으로 만들어줘야함
 	 //EmpDAO dao = new EmpDAO(); //보이지가 않아 ㅜ 왜냐 프라이빗으로 선언해서
 	//스래서 이렇게 뉴라고 객체생성 못함
 	//dao.insert(vo);
 	 //EmpDAO 클래스에 있는  getInstance 함수 불러오기 dao담기
 	EmpDAO dao = EmpDAO.getInstance(); //클래스명으로 접근하려면 스태틱으로 저장되있으면되지
 	//왜냐 스태틱은 객체생성없이 사용이 가능하니까
 	dao.insert(vo);


%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
</head>
<body>
	 성공적으로 입력되었지 DB에서 확인합니다.
	 <hr>
	 <!--1 얻어온 입력값 출력 -->
	사번 :  <%= empno %>
	이름 :  <%= ename %>
	부서번호 :  <%= deptno %>
	업무 : <%= job %>
	 녹봉 : <%= sal %>
</body>
</html>