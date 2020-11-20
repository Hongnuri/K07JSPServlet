<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public int getBaesu(int x , int y , int z){
	int sum=0;
	for(int i=x; i<=y; i++){
		if(i % z == 0){
			sum += i;
		}
	}
	return sum;
}
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
	<h2>선언부에서 메소드 정의</h2>
	<h3>스크립트렛에서 결과값 출력</h3>
	<%
	/*
	연습문제] 1부터 100 사이의 숫자 중 , 3의 배수의 합을 반환하는 함수를 선언 후 , 결과를 출력하시오.
		함수명 : getBaesu()
	*/
		int hapResult = getBaesu(1, 100, 3);
	out.println("1 ~ 100 사이의 3의 배수의 합 : " + hapResult);
	%>
	
	<h3>표현식에서 결과값 출력</h3>
	1 ~ 200 사이의 숫자 중 , 5의 배수의 합은 ?
	<%=getBaesu(1 , 200 , 5) %>
</body>
</html>