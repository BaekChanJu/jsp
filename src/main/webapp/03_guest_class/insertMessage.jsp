<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>


<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<script type="text/javascript">

$(function(){
	
	/* 1102 시작란
		-준비물 : 제이쿼리 라이브러리 연동 필수
	1. 여기는 이름과 비밀번호 메모를 써서 전송 버튼을 누르는 창을 만드는 칸이다
	2. 메세지남기기 버튼이 눌리면 정보를 넘어가게 만들면 되는것이다
	3.form태그 안에 내용이 있기에 서브밋 버튼이면 쉽게 전송이 될탠데 안쓰는이유는
		버튼자체가 사진일 수 도 있고 유효성 검사를 못하기 때문에 제이쿼리 란에 직접 서브밋을 만들어준다
	4. 속성값을 찾을때는 [] 를 기억하자 꼭!	
	*/
	
	
	//input 타입에 버튼이라는 걸 찾아서 클릭하면 그내용들을 서브밋해서 넘기겠다 + 유효성 검사까지
	$('input[type="button"]').click(function(){
		
		
		//1.속성값으로 찾아와 이름과 비밀번호 메세지를 val()로 값을 가져와 변수에 지정을 해줬다
		   var id = $('input[name="guestName"]').val();
		   var pass = $('input[name="password"]').val();
		   var msg = $('textarea[name="message"]').val();
		
		//3.유효성검사때메 만듬 
		   if(id =="" || id == null){
	             alert('id가 없다!');   
	             return;
	      }else if (pass == "" || pass == null){
	    	  alert("비번이없다!");
	      }else if(msg == ""||msg ==null){
	    	  alert("메세지가 없다");
	      } //end of if/else
		
		
		//2.그래서 form태그의 속성값 네임을 찾아와 서브밋으로 날린다
		 	//참고로 form에 액션값이 saveMessage.jsp 로 지정되어 있어 눌러지는동시 그 페이지로 넘어간다
		$('form[name="frm"]').submit();

	}) //end of 'input[type="button"]'
	


})//end of start
</script>

</head>
<!-- 메인창 - 버튼이 눌리면  saveMessage.js 넘어간다 왜냐 form태그 액션에 그 주소를 넣어놨으니까!! -->
<body>
<!-- 아래 input들의 name 들은 우리가 만들어놓은 겟세터란의 이름과 동일해야한다 그래야 정확이 가져오고 useBean을 사용이가능하다 ! -->
	<form action="saveMessage.jsp" name="frm" method="get">
		이름 : <input type="text" name="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input type="button" value="메세지 남기기">
	</form>
</body>
</html>