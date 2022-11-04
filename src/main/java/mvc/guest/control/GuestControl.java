package mvc.guest.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.guest.command.Command;
import mvc.guest.command.CommandDelete;
import mvc.guest.command.CommandException;
import mvc.guest.command.CommandInput;
import mvc.guest.command.CommandList;
import mvc.guest.command.CommandNull;

/**
 * Servlet implementation class GuestControl
 */
public class GuestControl extends HttpServlet {
	
	private HashMap commandMap;
	private String	jspDir = "/05_mvc_class/2_mvcGuest/";
	private String  error = "error.jsp";
	

    public GuestControl() {
        super();       
		initCommand();
	}

	private void initCommand(){
		commandMap = new HashMap();

		commandMap.put("main-page",	new CommandNull("main.jsp") );
		
		/* (1)
		 * 	-	1. main.jsp란에서 cmd이름에 내가정한이름은 list-page 페이지였다
		 *	-	2. 그래서 commandMap이라는 해쉬맵객체에 내가정한 파라미터이름에 객체생성호출로 넘어갈 listMessage.jsp 를 넣어주면된다
		 * 	-	3.new로 선언될 객체는 CommandList이다 CommandList클래스는 mvc.guest.command 패키지 안에 존재한다
		     그냥 화면을 담당하거나 보여줄때는 CommandNull 클래스를 보여주지만 listMessage는 저장된 디비를 보여주는 것이기때문에
		     저장된 디비를 가져오는 함수다오들이 CommandList여기 안에존재한다 그래서 선언후 들어가서 확인해보면 함수들이막 존재한다
		     그 함수들을 확인하러 CommandList에 한번 가보자! / 다녀왔으면 listMessage란으로 넘어가자
		 */
		
		commandMap.put("list-page",	new CommandList("listMessage.jsp") );
		
		//여긴 지금 listMessage에서 방명록남기기 눌렀을때 여기 컨트롤러 오는거다
		//CommandNull 사용한 이유는 알겠지? 방명록 남기기 칸은 뭐 디비가져올것도 없이 화면만 보여주는것이니까!
		// new CommandNull("insertMessage.jsp")를 넣어줬으니
		//방명록 작성 란으로 넘어가게한다 자 그럼 방명록을 남길 수 있는 insertMessage 로 넘어가보자!
		commandMap.put("input-form", new CommandNull("insertMessage.jsp"));
		
		
		//나는 지금 insertMessage에서 왔다 (방명록을 쓸수있는 칸에서)
			//방명록을 다작성했으면 메세지남기기를 눌렀겠지? 그럼 데이터 베이스에 그값들이 저장이 되어야겠지?
			//CommandInput 그래서 이 클래스로간다 가보면 DB저장하는 함수들이 모여있다 다녀와보자!
			//다녀와 보니 셋게터로 디비에 저장을 잘해줬다 저장은 잘되고 저장 잘됬다라는 페이지만 보여주는 saveMessage로 가버린다
			//그럼 화면만 보여주게되는 saveMessage 로 가보자!
		commandMap.put("input-do", new CommandInput("saveMessage.jsp"));
		
		
		//deleteMessage 페이지로 넘어가는데 CommandNull 이유는? 여기 뭐삭제할꺼임? 물어보는칸이라 디비 가따올 필요없음
		//그래서 CommandNull임 이제 알겠지??? 그럼  deleteMessage.jsp로 가보자!
		commandMap.put("delete-form", new CommandNull("deleteMessage.jsp"));
		
		//삭제되면 최종나오는칸 여기는 CommandDelete 클래스안에 함수들있음
		//나는 지금 deleteMessage.jsp에서 액션태그 타고왔음
		//CommandDelete 함수안에 삭제관련됫것들이 다있음 한번 다녀와볼까? / 다녀와봤다면 마지막 deleteConfirm.jsp로 가보자
		commandMap.put("delete-conf", new CommandDelete("deleteConfirm.jsp"));
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		if( cmdKey == null ){
			cmdKey = "main-page";
		}

		
		Command cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (Command)commandMap.get( cmdKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request, response  );

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}
