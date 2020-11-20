<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>전송방식(Post , Get) 테스트</h2>
	<!-- 
		Get방식에는 3가지 전송방식이 있다.
			1. <a href='' 를 사용하는 방법
			2. JS 의 location.href='' 를 사용하는 방법
			3. <form method='get' 을 사용하는 방법
	-->
	<h3>Get 방식 전송</h3>
	<a href="RequestInfo.jsp?paramNum=123&paramEng=Hello&paramHan=안녕">
		Get방식</a>
		
	<h3>Post 방식 전송</h3>
	<from action="RequestInfo.jsp" method="post">
		문자열 입력 : <input type="text" name="paramHan" /> 
		++<input type="submit" value="Post방식 " />
	</from>	
</body>
<h2>파라미터 및 값 전달</h2>
<%
/*
	한글을 전송하는 경우 서버 환경에 따라 깨질 수 있으므로 
	인코딩 후 전달하는 것이 안전하다.
*/	
String encodeName = URLEncoder.encode("홍길동" , "UTF-8");
%>

<a href="RequestParameter.jsp?name=<%=encodeName %>
	&id=hong&sex=man&favorite=&self_intro=">Get방식</a>
	<br />
	<br />
	<script>
		// 폼값에 대한 검증이 아이디만 처리하고 있다.
		function checkForm(f){
			if(f.id.value==""){
				alert("아이디를 입력해주세요");
				f.id.focus();
				return false;
			}
		}
	</script>
	<form method="post" name="regFrm" action="RequestParameter.jsp"
		onsubmit="return checkForm(this);">
		이름 : <input type="text" name="name" value="홍길동" />
		<br />
		아이디 : <input type="text" name="id" value="" />
		<br />
		관심사항 :
			<input type="checkbox" name="favorite"
				value="sport" checked="checked" />스포츠
				
			<input type="checkbox" name="favorite"
				value="economic" />경제
			<input type="checkbox" name="favorite"
				value="politics" checked="checked" />정치
		<br />
		자기소개 :
		<textarea name="self_intro" cols="30"
		rows="10">나는 부유한 집안에서 태어나서 대충 살았다.</textarea>
		<!-- 
			textarea 는 태그와 태그 사이에 컨텐츠가 들어가므로 
			정렬을 위해 줄바꿈을 사용하게 되면 필요 없는 공백이 포함 될 수 있으므로 주의해야한다. 
		-->				
		<br />
			<input type="submit" valie="POST방식"	/>
</html>