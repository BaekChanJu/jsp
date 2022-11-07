package mvc.guest.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.guest.model.Message;
import mvc.guest.model.MessageDao;
import mvc.guest.model.MessageException;

public class CommandList implements Command 
{
	private String next;    

	public CommandList( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException{
		try{
			
			//여기로 왔다면 selectList() 함수로 가보자 중요한건 여기서 값을  setAttribute로 보냈으니 나중에 받을땐 겟어디리비티다!
		    List <Message> mList = MessageDao.getInstance().selectList();	
		    request.setAttribute("param", mList );

		}catch( MessageException ex ){
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
}
