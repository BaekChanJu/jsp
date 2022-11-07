package mvc.guest.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.model.MessageException;

public interface Command {
	public String execute( HttpServletRequest request, HttpServletResponse response  ) throws CommandException, MessageException;
}
