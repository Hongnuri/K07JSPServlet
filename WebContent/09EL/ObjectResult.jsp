<%@page import="model.MemberDTO"%>
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
	<h2>EL의 param 내장객체로 파라미터 읽기</h2>
	<h3>자바코드로 영역 및 파라미터 읽기</h3>
	<h4>영역에 저장 된 값</h4>
	<%
	/*
		Java 코드를 통해 영역에 저장 된 속성을 가져올 때는 아래와 같이 한다.
		1. getAttribute() 으로 속성을 가져온다.
		2. 형변환 한다.
		3. getter() 로 저장 된 값을 출력한다.
	*/
	MemberDTO member = (MemberDTO)request.getAttribute("dtoObj");
	%>
	<ul>
		<li>
			MemberDTO객체 : <%=String.format("아이디:%s,"
				+"비번:%s,이름:%s",
				member.getId(),
				member.getPass(),
				member.getName()) %>
		</li>
		<!-- String 과 같은 자바의 기본 객체는 형변환 없이 출력할 수 있다. -->
		<li>
			String객체 : <%=request.getAttribute("strObj") %>
		</li>
		<li>
			Integer객체 : <%=request.getAttribute("integerObj") %>
		</li>
	</ul>
	<h4>파라미터로 전달 된 값 읽기</h4>
	<%
	/*
		파라미터로 전달 되는 값은 항상 String이므로 산술연산을
		위해서는 숫자로 변환이 필요하다.
	*/
	int fNum = Integer.parseInt(request.getParameter("firstNum"));
	int sNum = Integer.parseInt(request.getParameter("secondNum"));
	%>
	두 파라미터의 합 : <%=fNum+sNum %>
	
	<!-- 
		속성명이 유일하다면 xxxScope 내장 객체 없이 읽어 올수 있고
		형변환이 필요없고 숫자로 변경하지 않아도 산술연산이 가능하다.
		getter() 호출 없이 멤버변수의 이름으로 저장 된 값을 바로 읽어 올 수 있다.
		따라서 java 코드를 사용할 때 보다 EL 을 사용하면 훨씬 간편해진다.
	-->
	<h3>EL로 영역과 파라미터로 전달 된 값 읽기</h3>
	<h4>영역에 저장 된 값</h4>
	<ul>
		<li>MemberDTO객체 : <br/>
			아이디 : ${dtoObj.id },
			비번 : ${dtoObj.pass },
			이름 : ${dtoObj.name }
		</li>
		<li>String객체 : ${requestScope.strObj }</li>
		<li>Integer객체 : ${integerObj }</li>
	</ul>	
	<!-- 
		EL 의 param 내장 객체를 통해 파라미터를 읽을 때 
			1. param.폼이름
			2. param[' ']
			3. param["폼이름"]
		세 가지 모두 표현이 가능하다.	
		
	-->
	<h4>파라미터로 전달 된 값의 합</h4>
	<ul>
		<li> ${param.firstNum + param['secondNum'] }</li>
		<!--
			윗부분은 산술연산이 되어 500이 출력된다.
			아래는 200 , 300 이라는 별도의 값이 출력된다. 
		-->
		<li> ${param.firstNum + ${param['secondNum'] }</li>
	</ul>		
</body>
</html>