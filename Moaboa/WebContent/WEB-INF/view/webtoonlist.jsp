<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input:button").on("click",function(){		
		window.open("view/dubbingplayer.do", "moaboa_player", 'scrollbars=no,toolbar=no,location=no,resizable=no,status=no,menubar=no,resizable=no,width=400,height=100,left=800,top=500');
		//resizable=no,location=no,directories=no,status=no,toolbar=no,scrollbars=no
	})	
})
	
</script>
</head>
<body>
	<table>
		<tr>
			<td><input type="button" value="마음의 소리"></td>
		</tr>
		<tr>
			<td><input type="button" value="낢이 사는 이야기"></td>
		</tr>
	</table>
</body>
</html>