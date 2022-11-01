<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="member.beans.MemberDao"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원가입</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">

$(function () {
    $('.sameBtn').click(function () {
    	 if($('#id').val() ==null || $('#id').val() ==''){
    		 $('#result').text('아이디를 입력해 주세요.');
    	 }else{
       	
    	
       var param = {
    		   id : $('#id').val()
    		   };
      
      $.ajax({
         url : 'selectID.jsp',
         data : param,
         success : function (data) {
        	// alert(data); 먼저 확인을 해줘야하는이유 무슨깡으로 트루와 풜스가 나올줄아냐
        	//찍어보니 트루 밑에 아까 html 이상한 구문들이 막떳다 그러니까 true 라고 인식을 못핮
        	 
            if(data.trim() == "true" ) {
               $('#result').text('사용중인 아이디가 있습니다. 다시 입력하여 주십시오.');
            
          }else if(data.trim() == 'false') { 
             $('#result').text('사용할 수 있는 아이디입니다.');
          
          }
         }
      })
    	 } 
      
   })
})

   
</script>

</head>
<body>

	<h1>회원가입서 작성하기</h1>

	<form action="InsertMember.jsp" method="post" name="frm">
		<table>
			<tr>
				<td width="100"><font color="blue">아이디</font></td>
				<td width="100"><input type="text" name="id" id="id">
					<input type="button" value="중복확인" class='sameBtn'><br />
					<div id='result'></div></td>
			</tr>
			<tr>
				<td width="100"><font color="blue">비밀번호</font></td>
				<td width="100"><input type="password" name="password" /><br />
				</td>
			</tr>
			<tr>
				<td width="100"><font color="blue">비밀번호학인</font></td>
				<td width="100"><input type="password" name="repassword" /><br />
				</td>
			</tr>
			<tr>
				<td width="100"><font color="blue">이름</font></td>
				<td width="100"><input type="text" name="name" /><br /></td>
			</tr>
			<tr>
				<td width="100"><font color="blue">전화번호</font></td>
				<td><input type="text" size="15" name="tel" /> <br /></td>
			</tr>
			<tr>
				<td width="100"><font color="blue">주소</font></td>
				<td><input type="text" size="50" name="addr" /><br /></td>
			</tr>
			<tr>
				<td width="100">
					<!--로그인 버튼--> <input type="submit" value="회원가입">
				</td>
				<td width="100"><input type="reset" name="cancel" value="취소"><br />
				</td>
			</tr>
		</table>
	</form>



</body>
</html>
