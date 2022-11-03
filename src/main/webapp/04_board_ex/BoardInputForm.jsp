<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	// 작성 버튼이 눌렸을 때
	$('input[value="작성"]').click(function(){
		
		// 폼태그 변수에 담고  폼태그의 submit() 호출
		var frm = $('form[name="frm"]');
		frm.submit();
		
		// 폼태그의 action 속성을 'BoardSave.jsp' 이렇게 액션을 보내기가능 - 원래는 폼태그안에 액션을 썻었음
			//BoardSave.jsp로 사용자 입력값을 넘긴다
		frm.attr('action','BoardSave.jsp');
	
		
		
		// 각 input 태그에 name 부여 이유는
		//-지금 get방식으로 넘겼는데 url에 뭐가딱히 안뜬다 왜냐 name을 설정을 안해서다
		//설정한 네임은 VO의 변수이름 과 동일해야 저장이된다 / 완벽히 VO의 이름과 동일해야 저장이된다
	});
});
</script>
</head>
 <body>
	<h4> 게시판 글 쓰기 </h4><br/>
	나중에 이쁘게 만드시오 <br/><br/>
	<form name='frm' method='post'>
	<!-- 지금 get방식으로 넘겼는데 url에 뭐가딱히 안뜬다 왜냐 name을 설정을 안해서다 -->
	<!-- 여기 해당네임은 VO의 변수이름 과 동일해야 저장이된다 기억 
	완벽히 VO의 이름과 동일해야 저장이된다 꼮!-->
	작성자 : <input type='text' name='writer'><br/><br/>
	제  목 : <input type='text' name='title'><br/><br/>
	내  용 : <textarea rows='10' cols='40' name='content'></textarea><br/><br/>
	비밀번호 : <input type='password' name='pass'><br/><br/>
	<input type='button' value='작성'>
	<input type='reset' value='취소'>
	</form>

</body>
</html>