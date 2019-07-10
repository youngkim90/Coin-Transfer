<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	margin: 0;
	background-color: #38ada9;
}

.button-3 {
	background-color: #218c74;
	border: none;
	color: #ffffff;
	cursor: pointer;
	display: inline-block;
	font-family: 'BenchNine', Arial, sans-serif;
	font-size: 1em;
	font-size: 15px;
	line-height: 1em;
	margin: auto;
	outline: none;
	padding: 12px 40px 10px;
	position: relative;
	text-transform: uppercase;
	font-weight: 700;
}

.button-3:before, .button-3:after {
	border-color: transparent;
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
	border-style: solid;
	border-width: 0;
	content: "";
	height: 24px;
	position: absolute;
	width: 24px;
	
}

.button-3:before {
	border-color: #218c74;
	border-right-width: 2px;
	border-top-width: 2px;
	right: -5px;
	top: -5px;
}

.button-3:after {
	border-bottom-width: 2px;
	border-color: #218c74;
	border-left-width: 2px;
	bottom: -5px;
	left: -5px;
}

.button-3:hover, .button-3.hover {
	background-color: #218c74;
}

.button-3:hover:before, .button-3.hover:before, .button-3:hover:after, .button-3.hover:after {
	height: 100%;
	width: 100%;
}

.button-3:active {
	background: #cd6133;
}

.menu {
	display: inline-block;
	border-left: 1px dotted #EE5A24;
	font-weight: bold;
	font-size: 20px;
	text-align:center;
	width:200px;
	height:40px;
}
.position{
	position: absolute;
	top: 15%;
	left: 50%;
	transform: translate(-50%, -50%);

}

a{text-decoration:none;}
</style>
</head>
<body>
<div class="position">
	<div class="menu">
		<a href="${contextPath}/account/login.do" class="button-3">로그인</a>
	</div>
	<div class="menu">
		<a href="${contextPath}/account/logOut.do" class="button-3">로그아웃</a>
	</div>
	<div class="menu">
		<a href="${contextPath}/account/join.do" class="button-3">회원가입</a>
	</div>
	<div class="menu" style="border-right: 1px dotted #EE5A24;">
		<a href="${contextPath}/account/coinTransfer.do" class="button-3">메인으로</a>
	</div>
	</div>


</body>
</html>