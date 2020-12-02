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
	<h2>forward 된 페이지 입니다.</h2>
	
	<!--
		포워드 처리 된 페이지에서는 page 영역은 공유되지 않고
		request 영역만 공유 된다. 따라서 해당 페이지의 가장 좁은 영역은 request 영역이 된다.
	-->
	<h3>자바코드를 통해서 속성 읽기</h3>
	<ul>
		<li> <!-- 출력 되지 않음 -->
			pageContext.getAttribute("scopeVar") :
				<%=pageContext.getAttribute("scopeVar") %>
		</li>
		<li>
			request.getAttribute("scopeVar") :
				<%=request.getAttribute("scopeVar") %>
		</li>
		<li>
			session.getAttribute("scopeVar") :
				<%=request.getAttribute("scopeVar") %>		
		</li>
		<li>
			application.getAttribute("scopeVar") :
				<%=request.getAttribute("scopeVar") %>
		</li>
	</ul>
	<h3>각 영역에 저장 된 속성 읽기</h3>
	<ul>
		<li>페이지영역 : ${pageScope.scopeVar }</li><!-- 출력 되지 않음 -->
		<li>리퀘스트영역: ${requestScope.scopeVar } </li>
		<li>세션영역 : ${sessionScope.scopeVar }</li>
		<li>어플리케이션영역 : ${applicationScope.scopeVar }</li>
	</ul>
	<h3>xxxScope 미지정 후 속성읽기</h3>
	<ul>
		<li>가장 좁은 영역 읽음 : ${scopeVar}</li>
		<li>포워드 된 페이지에서는
		가장 좁은 영역인 request 영역이 읽혀지게 된다. page 영역은
		포워드 된 페이지에는 공유 되지 않는다.
		</li>
	</ul>
</body>
</html>