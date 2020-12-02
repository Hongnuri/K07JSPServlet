<%@page import="eltag.MyTagLib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	EL 에서 Java 클래스의 메소드 호출 절차 및 방법
	1. 클래스와 메소드를 정의한다. 단 , 메소드 정의시 반드시
		public static 으로 선언해야한다.
	2. TLD 파일을 생성한다. Tag Library Descriptor 의 약자로 
		WEB_INF 폴더 하위에 생성한다. 웹어플리케이션 실행시
		컨테이너가 해당 파일을 찾아 사용하게 된다.
		우리는 tlds 폴더를 생성한 후 , 파일을 생성하고
		fn.tld 파일을 참조하여 작성하였다.	
	3. 생성한 TLD 파일의 경로를 등록한다. 등록시 <jsp-config>
		엘리먼트를 통해 기술한다.	
	4. jsp 파일에서 EL 을 통해 메소드를 호출한다.
		페이지 상단에 taglib 지시어를 선언하고, 호출시에는
		${접두어 : 메소드명(인자)} 형태로 호출한다.	
--%>    
<%@ taglib prefix="my" uri="/WEB-INF/tlds/MyTagLib.tld" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyTagLib.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h3>Java 코드로 메소드 호출하기</h3>
	<ul>
		<li>
			MyTagLig.isNumber("100")
				=><%=MyTagLib.isNumber("100") %>
		</li>
	</ul>
	
	<h3>EL에서 자바클래스의 메소드 호출하기</h3>
	<ol>
		<li>
			my:isNumber("100") => ${my:isNumber("100") }
		</li>
		<li>
			my:isNumber("백20") => ${my:isNumber("백20") }
		</li>
	</ol>
	
	
	
	
	
</body>
</html>