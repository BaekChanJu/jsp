<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	
	//$('#id_check').click(function(){
		$('.userinput').keyup(function(){ //타자 누르고 띄웠을때 이벤트발생
			
	
		var id = $('.userinput').val(); //인풋태그는 클래스 찾아서 바로 값가져오기가능
		
		$.ajax({
			url : 'IdCheck.jsp',
			data : id,
			success : function(data){
				if(data.trim() == 'YES'){ //공백때문에 trim 필요
					$('#idmessage').text('이미존재하는 아이디입니당');
					$('#idmessage').show(); //아래 디스플레이스논 되있어서
				
				}else if (data.trim() == 'NO'){
					$('#idmessage').text('사용가능 아이디입니다');
					$('#idmessage').show(); //아래 디스플레이스논 되있어서
				}
			}//end suc
			
			
			
			
		});
		
	})
	

	
	})


</script>

</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;"></div>

</body>
</html>