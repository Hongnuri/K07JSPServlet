<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true" %>
<%--
	isErrorPage 지시어
	: 현재 JSP 페이지가 에러처리를 담당하는지 구분하는 속성으로 false 가 디폴트값이다.
	에러처리를 위해서는 true 로 설정해야한다.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>에러발생 됨 : 관리자에게 문의하세요</h2>
	<h3>연락처 : 010-1234-5678</h3>
	<h3>서버 업그레이드 중 입니다.</h3>
	<img src="http://sgled.co.kr/files/attach/images/469/580/c3b5f7492cf16d83d0e66dfa1488e879.jpg"/>
	<h3>
		에러 내용 : <%=exception.getMessage() %>
	</h3>
</body>
</html>