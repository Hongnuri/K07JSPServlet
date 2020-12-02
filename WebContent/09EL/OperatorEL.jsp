<%@page import="java.util.Vector"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h2>EL의 연산자들</h2>
	<h3>EL에서의 null 연산</h3>
	<%--
	/*
		Java 에서는 null 과 연산을 수행할 수 없다.
		하지만 EL 에서는 null 을 0으로 간주하여 계산한다.
	*/
	int a = null + 10; <- null 과의 연산이므로 에러가 발생된다.
	--%>
	
	\${null+10 } : ${null+10 } <br /><!-- 결과 : 10 -->
	<!-- 
		최초 실행시에는 파라미터가 없으므로 0으로 간주되어 계산된다.
		만약
			해당 페이지?myNumber=20 	-> 결과 30 출력
			해당 페이지?myNumber=		-> 0으로 간주되어 10 출력
			해당 페이지?myNumber=Three -> 문자는 숫자로 변경할 수 없어 에러가 발생 된다.
	-->
	\${param.myNumber+10 } : ${param.myNumber+10 } <br />
	<br />
	
	<!-- 
		null값과 비교연산에서는 false 를 반환한다.
		산술연산에서는 0으로 간주하고 연산을 진행하지만
		비교연산은 null 과의 비교 자체가 불가하기 때문이다.
	-->
	\${param.myNum>10 } : ${param.myNum>10 }<br />
	\${param.myNum<10 } : ${param.myNum<10 }<br />
	
	<h3>JSTL 로 EL 에서 사용 할 변수 선언</h3>
	<%
	/*
		EL 에서는 JSP 에서 선언한 변수는 직접 사용할 수 없다. 
		값이 출력되지 않고 null 로 인식하게 된다.
		JSP 에서 변수를 EL 에서 사용할 수 없는 이유는 EL 은 
		4가지 영역에 저장 된 속성들만 사용하기 때문이다. 
		JSTL도 동일한 특성을 가지고 있다.
	*/
	String varScriptLet = "스크립트렛 안에서 변수선언";
	%>
	<!-- null 로 인식되어 결과는 100이 출력 된다. -->
	\${varScriptLet+100 } : ${varScriptLet+100 } <br />
	
	<!-- 
		JSP 에서 선언한 변수를 EL 에서 사용해야 할 경우에는 JSTL 의
		SET 태그를 이용해서 변수를 선언한다.
		JSP 에서 선언 후 , 바로 사용하려면 영역에 저장해야 한다.
	-->
	<c:set var="elVar" value="<%=varScriptLet %>" />
	\${elVar } : ${elVar }
	
	<!-- 
		Tomcat8.0 부터는 EL 에서 변수할당이 가능해졌다.
		하지만 개발시에는 실제 서비스 할 웹서버의 버전을 확인한 후 , 사용여부를 결정해야한다.
		EL 은 전통적으로 값을 표현 (출력) 하는 용도로 사용되어 졌으므로 표현용으로만 사용하는 것이 좋다.
	--> 
	<h3>EL변수에 값 할당</h3>
	<c:set var="fnum" value="9" />
	<c:set var="snum" value="5" />
	\${fnum=99 } : ${fnum=99 } <!-- 99로 재할당 되어 99가 출력된다. -->
	
	<!-- 
		EL 에서는 정 수와 정수를 연산하더라도 실수의 결과가 나올 수 있다.
		즉 , 자동형 변환되어 출력된다.
		나눗셈을 위한 / 연산자 대신 div , 나머지를 구하는 % 대신 mod 를 사용할 수 있다.
	-->
	<h3>EL의 산술연산자</h3>
	<ul>
		<li>\${fnum+snum } : ${fnum+snum }</li>
		<li>\${fnum/snum } : ${fnum/snum }</li>
		<li>\${fnum div snum } : ${fnum div snum }</li>
		
		<li>\${fnum % snum } : ${fnum % snum }</li>
		<li>\${fnum mod snum } : ${fnum mod snum }</li>
		
		<!-- 
			EL 에서는 + 연산자는 덧셈의 용도로만 사용된다.
			문자열을 연결하기 위한 용도로는 사용할 수 없다.
			아래 문장중 "100"은 자동으로 숫자로 변경 된 후 , 연산 된다.
			나머지는 NumberFormatException 이 발생 된다.
		-->	
		<li>\${"100"+100 } : ${"100"+100 }</li>
		<li>\${"hello~"+"EL~" } : \${"Hello!"+"EL" }</li>
		<li>\${"일"+2 } : \${"일"+2 }</li>
	</ul>
	
	<!-- 
		EL 에서는 비교연산자를 이용한 비교시 변수의 값을 모두 문자열로
		인식하여 String 클래스의 compareTo() 와 같은 방식으로 비교한다.
		즉 , 첫 번째 문자부터 하나씩 비교해나간다.
		단 , 실제 숫자의 비교시에는 일반적인 숫자 비교가 이루어진다.
	-->
	<h3>EL의 비교연산자</h3>
	<c:set var="fnum" value="100" />
	<c:set var="snum" value="90" />
	<ul>
		<!--
			fnum 과 snum 은 영역에 저장 된 데이터이므로 Object 형으로 저장된다.
			따라서 비교시 객체 상태에서 비교가 이루어지게된다.
			100 과 90 은 실제 숫자의 비교가 이루어진다. 
		-->
		<li>\${fnum > snum } : ${fnum > snum }</li> <!-- 결과 : false -->
		<li>\${100 > 90 } : ${100 > 90 }</li> <!-- 결과 : true -->
		
		<!-- 
			Java 에서는 문자열을 비교할 때 , equals() 로 비교하지만 
			EL 에서는 == 의 형태로 비교한다.
		-->
		<li>\${"JAVA"=='JAVA' } : ${"JAVA"=='JAVA' }</li> <!-- 결과 : true -->
		<li>\${"JAVA"=='JAVA' } : ${"Java"=='JAVA' }</li> <!-- 결과 : false -->
	</ul>
	
	<!--  
		> : gt(Greater Then)
		>= : ge(Greater then Equal)
		< : lt(Less Then)
		<= : le(Less then Equal)
		== : eq(EQual)
		!= : ne(Not Equal)
		&& : And
		|| : Or
	-->
	
	<h3>EL 의 논리 연산자</h3>
	<ul>
		<li>\${5>=5 && 10!=10 } :
				${5 ge 5 and 10 ne 10 }</li>
		<li></li>
	</ul>	
	<h3>EL의 삼항연산자</h3>
	\${10 gt 9 ? "참이닷" : "거짓이닷" }
		: ${10 gt 9 ? "참이닷" : "거짓이닷" }
		
	<!-- 
		null 이거나 ""(빈문자열) 일 때
			혹은 배열인 경우 길이가 0일 때 
			혹은 컬렉션인 경우 size 가 0 일 때
		true 를 반환하는 연산자	
	-->	
	<h3>EL의 empty 연산자 : null 일 때 , true 를 반환하는 연산자</h3>
	<%
		String nullStr = null;
		String emptyStr = "";
		Integer[] lengthZero = new Integer[0];
		Collection sizeZero = new Vector();
	%>	
	
	<c:set var="elnullStr" value="<%=nullStr %>" />
	<c:set var="elemptyStr" value="<%=emptyStr %>" />
	<c:set var="ellengthZero" value="<%=lengthZero %>" />
	<c:set var="elsizeZero" value="<%=sizeZero %>" />
	<ul>
		<li>\${empty elnullStr } : ${empty elnullStr } </li>
		<li>\${not empty elemptyStr } : ${not elemptyStr }</li>
		<li>${empty ellengthZero ?
				"배열크기가 0임" : "배열크기가 0이 아님" }</li>
		<li>${not empty elsizeZero ?
				"컬렉션에 저장 된 객체 있음" :
				"컬렉션에 저장 된 객체 없음" }</li>
	</ul>
	
	
</body>
</html>