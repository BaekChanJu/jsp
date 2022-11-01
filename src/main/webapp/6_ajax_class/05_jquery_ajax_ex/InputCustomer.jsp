<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 고객관리 프로그램 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript" >
$(function(){
	
	$('#btnInsert').click(function(){
		/* //원래통신 패턴이다
		$('form').attr('action', 'DataInput.jsp'); //저 페이지로 날려주면
		//저페이지는 오라클에 정보를 저장해줌
		$('form').submit(); */
		
		//ajax
			//1번 사용자 입력값을 객체형식으로 저장
				//추후에 폼객체 serialize() 추후에 참고 반복느낌일듯
		var param = { //우선 사용자입력값을 키벨류로 얻어온다
				name : $('#name').val(),
				age : $('#age').val(),
				tel : $('#tel').val(),
				addr : $('#addr').val()
		} //end param
		
		$.ajax({
			url : 'DataInput.jsp',
			data : param,
			success : function(data){
				if(data.trim() == '1'){
					alert('입력성공');
			//화면 깔끔히 할라고 입력값을 초기화
				$('#name').val('');
				$('#age').val('');
				$('#tel').val('');
				$('#addr').val('');
			
				}else{
					alert('입력실패');
				}//end of if
			} //end of success
		}); // end ajax
	}) //end of btnInsert
	
	
	
	
	//2번 가져오기 버튼이 눌려졌을때 가져오기
	$('#btnSelect').click(function(){
		
		$.ajax({
			url : 'DataSelect.jsp',
			dataType : 'xml',
			success : selecrResult
			
		});//end of jax
		
		function selecrResult(data){
			var person = $(data).find('person'); //배열이라는의미
			//DataSelect 에 있음 펄슨
			
			$('#tbd').empty(); //붙히기전 지우기
			
			person.each(function(){
				var name = $(this).find('name').text(); //텍스트가 사이값 가져옴
				var age = $(this).find('age').text();
				var tel = $(this).find('tel').text();
				var addr = $(this).find('addr').text();
				
				//테이블 보디에 테이블리스트 만들어 그사에이 테이블데이터 만들어 붙혀넣기
				$('#tbd').append('<tr>'  
							+'<td>' + name + '</td>'
							+'<td>' + age + '</td>'
							+'<td>' + tel + '</td>'
							+'<td>' + addr + '</td>'	
						+ '</tr>' ); // 테이블 바디에 
			})//end of person.each
			
		}// end of selecrResult
		
	}) //end of btnSelect
	
	
})//end of main

</script>

</head>


<!-- <body> -->
<body>

<h2> 고객정보 입력 </h2>

<form name="inForm" method="post">
<table border = 1>
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tr>
		<td align="center"><input type="text" size="8" name="name" id="name"></td>
		<td align="center"><input type="text" size="4" name="age" id="age"></td>
		<td align="center"><input type="text" size="12" name="tel" id="tel"></td>
		<td align="center"><input type="text" size="30" name="addr" id="addr"></td>
	</tr>
	<tr>
		<td colspan="4" align="center"> 
			<input type="button" id='btnInsert' value="입력">
		</td>
	</tr>
</table>

<br>
<hr>

<h2> 고객정보 목록보기  </h2>
<table border='0' width="510"> 
	<tr>
		<td align="right"><input type="button"  id='btnSelect' value="가져오기"></td>
	</tr>
</table>
<table border = 1 id="listTable">
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tbody id='tbd'></tbody>
</table>
<div id="myDiv"> </div>

</form>
</body>
</html>