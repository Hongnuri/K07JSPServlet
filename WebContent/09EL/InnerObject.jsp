<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 각 4개의 영역에 같은 속성명으로 데이터 저장
pageContext.setAttribute("scopeVar","페이지영역");
request.setAttribute("scopeVar","리퀘스트영역");
session.setAttribute("scopeVar","세션영역");
application.setAttribute("scopeVar","어플리케이션영역");
%>    
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
	<!-- 
		EL 에서 각 영역에 저장 된 속성을 읽을 때는 xxScope 계열의 내장객체를 사용한다.
		xxScope.속성명 혹은 xxScope['속성명'] 형태로 읽어올 수 있고
		속성명이 유일할 때는 내장객체를 생략할 수 있다.
		만약 속성명이 동일하면 가장 좁은 영역의 속성을 읽어온다.
	-->
	<h2>EL 에서 내장객체 사용하기 : xxxScope 계열</h2>
	<h3>각 영역에 저장 된 속성 읽기</h3>
	<ul>
		<!-- 해당 페이지에서 가장 좁은 영역은 page 이므로 아래와 같이 
		내장 객체는 있어도 없어도 동일한 결과가 출력된다. -->
		<li>페이지영역1 : ${pageScope.scopeVar }</li>
		<li>페이지영역2 : ${scopeVar }</li>
		<li>리퀘스트영역: ${requestScope.scopeVar } </li>
		<li>세션영역 : ${sessionScope.scopeVar }</li>
		<li>어플리케이션영역 : ${applicationScope.scopeVar }</li>
	</ul>
	
	<h3>xxxScope 미지정 후 , 속성읽기</h3>
	<ul>
		<li>가장 좁은 영역 읽음 : ${scopeVar }</li>
		<li>위처럼 영역부분을 생략한 후 , EL 로 읽게 되면 가장 좁은 영역인
		page 영역이 읽혀지게 된다.</li>
	</ul>
	
	<jsp:foward page="InnerForward.jsp" />
</body>
</html>