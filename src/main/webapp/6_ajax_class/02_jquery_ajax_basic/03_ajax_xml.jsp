<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>


<script type="text/javascript">
$(function(){
	var param = {cate : 'book', name : 'hong'};
	
	$.ajax({
		type : 'get',
		data : param,
		url : '03_server.jsp', //여기서 처리되고 난 데이타 를 아래매개변수로
		dataType : 'xml', //지정안하면 text가 디폴트
		//html, xml json으로 받을거다~ 이렇게 지정가능
		success : function(data){
			//alert(data);
			$('#cate').val($(data).find('first').text());
			$('#name').val($(data).find('second').text());
			//네임아이디에 값이 나오게한다 값을 지정했는데
			//그 지정값이 data의 자식의 세컨드라는 태그를 가지고있는 녀석을 나오게한다
			//여기서 펄스트 세컨드는 03페이지 에설정한것
			
		}
		
		
	}); //end of ajax

})//end of jQ


</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


