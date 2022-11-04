package mvc2.simple;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class SimpleControl extends HttpServlet {
	
	//중요함! - 절대경로위치 확인 / jspDir 변수안에 주소를 담아놓음 
	private String jspDir ="/05_mvc_class/1_mvcSimple";
       

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//겟방식이들어오면 여기가호출
		process(request, response); //근데 겟이들어오나 포스트가 들어오나 동일하게하려구
		
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//포스트 방식이들어오면 여기가호출
		process(request, response); ////근데 겟이들어오나 포스트가 들어오나 동일하게하려구
	}
	
	
	
	
	//1104 방금만든함수
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String value ="안녕하세요";
		
		//파라미터 값 저장 셋어트리빗
		request.setAttribute("param", value);
		
		//forward <jsp:forward> 이태그를 다시 자바로 변환하는코딩
			//즉 jspDir + "/simpleView.jsp" 이페이지로 포워딩한다
		RequestDispatcher dispatcher =
				request.getRequestDispatcher(jspDir + "/simpleView.jsp");
		
		dispatcher.forward(request, response);
		
		//즉 벨류로 지정한 값을  jspDir + "/simpleView.jsp 여기서도 볼수있게 한다는것
		//그리고 이 서블릿 파일은 등록을해야 사용할 수 있다 web.xml
		
	}
	
	

}//end SimpleControl
