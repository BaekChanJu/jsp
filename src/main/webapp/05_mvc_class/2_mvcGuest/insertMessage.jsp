<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>
<script type="text/javascript">
//지금 나는 	commandMap.put("input-form", new CommandNull("insertMessage.jsp")); 게스트컨트롤에서 여기까지 하고왔다!
//그리고 여기는 방명록을 남길수 있는란이다!

	function checkFields()
	{
		var frmObj = document.frm;
		
		//이제는 jsp방식으로 넘기면 안되!
			//액션은 무저건 GuestControl이 담당하고있음!
			//여기서 또 GuestControl 넘겼으니 GuestControl란으로 가볼까?! 
		frmObj.action = "GuestControl?cmd=input-do"; //즉 세이브메세지란으로 넘어갈거란뜻임
		frmObj.submit(); 
	}
</script>
</head>

<body>

	<form name="frm" method="post">
		이름 : <input type="text" name="guestName"/><br/><br/>
		암호 : <input type="password" name="password"/><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30"></textarea><br/><br/>
		<input type="button" value="메세지 남기기" onclick="Javascript:checkFields()">
	</form>
</body>
</html>