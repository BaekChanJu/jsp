<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
		//이전화면에서 사용자입력값들을 얻오오기 클라이언트가 보낸    
    		//- 하나씩 얻어올떄가 request.getParameter();
    	//- 여러개 얻어올때는 request.getParameterValues();
     String n =	request.getParameter("name");
     String g =	request.getParameter("gender");
     String o =	request.getParameter("occupation");
     String h[] = request.getParameterValues("hobby");
     
    /*  if(h != null){ //암것도 클릭안하면 널 나오기에 넣이 아닌경우 if 로사용
      String hobby= ""; //이 단락에서 출력하려면 이렇게 출력할수있는 변수를 선언해줘야하고
     for(int i =0 ; i<h.length; i++){
		hobby += h[i] ;
			}  
     } */
     
   /*   
      for(int i =0 ; hobby !=null && i<h.length; i++){
		hobby += h[i] ;
			}  
     }  if 안쓰려면 숏서킷도 가능 */
  
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

입력한 이름 :  <%= n %> <br>
입력한 성별 :  <%= g %> <br>
입력한 직업  :  <%= o %> <br>
입력한 취미 :  <% for(int i =0 ; i<h.length; i++){ %>
			<%= h[i] %>
	
 <% }  %> <br>
</body>
</html>