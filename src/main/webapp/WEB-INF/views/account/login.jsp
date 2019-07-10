<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">

<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
	alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
}
</script>
</c:if>


<style>
#flex-container {
	padding: 30px;
	border-radius: 25px;
	background: #ffd32a;
	display: flex;
	flex-wrap: nowrap;
	overflow: auto;
	position: absolute;
	top: 25%;
	left: 40%;
	border: 4px solid #ffa801;
}

h1 {text-align:center;}

* {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

.login-form {
	background-color: #eeeff1;
	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
	overflow: auto;
	padding: 20px;
}

.text-field {
	border: 10px solid #ffffff;
	border-radius: 5px;
	font-size: 14px;
	margin: 10px 0 0 0;
	width: 260px;
	height: 44px;
}

.submit-btn {
	font-size: 14px;
	background-color: #f6e58d;
	border-radius: 5px;
	border: 10px solid #f6e58d;
	width: 260px;
	height: 44px;
	margin: 10px 0 30px 0;
}

.links {
	text-align: center;

}

.links a {
	font-size: 12px;
	color: #3c6382;
	text-align: center;
	padding:0 6px 0 0;
	
}
</style>
</head>
<body>

	<div id="flex-container">
		<div class="login-form">
			<form method="post"  action="${contextPath}/account/login2.do">
			<h1>로그인</h1>
				<input type="text" name="cust_id" class="text-field" placeholder="아이디"><br> <input type="password" name="cust_pw" class="text-field" placeholder="비밀번호"><br> 
				<input type="submit" value="로그인" class="submit-btn">
			</form>

			<div class="links">
				<a href="${contextPath}/account/join.do">회원가입</a>
				<a href="#">ID/비밀번호 찾기</a>
			</div>
		</div>
	</div>
	
	
</body>
</html>