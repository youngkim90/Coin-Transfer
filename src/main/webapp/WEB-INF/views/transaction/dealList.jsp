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
<title>거래 목록</title>
<c:if test="${custInfo.accountNO3==null or custInfo.accountNO3==0}">
	<script>
		window.onload = function() {

			init();
		}

		function init() {
			alert("가상계좌를 생성 후 확인하실 수 있습니다.")
		}
	</script>
</c:if>
<style>
#flex-container {
	padding: 15px;
	border-radius: 25px;
	background: #ffd32a; flex-wrap : nowrap; position : absolute; top : 50%; left : 50%; transform : translate( -50%, -50%);
	border: 4px solid #ffa801;
	flex-wrap: nowrap;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.coin {
	text-align: center;

	font-weight: bold;
	font-family: 'BenchNine', Arial, sans-serif;
}

.coin-button {
	float: left;
	margin: 30;
	padding: 8px 0 0 0;
	width: 220px;
	text-align: center;
	height: 30px;
	font-weight: bold;
}

.button-2 {
	background-color: #6c5ce7;
	border: none;
	color: #ffffff;
	cursor: pointer;
	display: inline-block;
	font-family: 'BenchNine', Arial, sans-serif;
	font-size: 1em;
	line-height: 1em;
	margin: auto;
	outline: none;
	padding: 10px 30px 6px;
	position: relative;
	text-transform: uppercase;
	font-weight: 700;
	text-decoration: none
}

.button-2:hover, .button-2.hover {
	background-color: #6c5ce7;
}

.button-2:before, .button-2:after {
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

.button-2:before {
	border-color: #6c5ce7;
	border-right-width: 2px;
	border-top-width: 2px;
	right: -5px;
	top: -5px;
}

.button-2:after {
	border-bottom-width: 2px;
	border-color: #6c5ce7;
	border-left-width: 2px;
	bottom: -5px;
	left: -5px;
}

.button-2:hover:before, .button-2.hover:before, .button-2:hover:after, .button-2.hover:after {
	height: 100%;
	width: 100%;
}

.button-2:active {
	background: #0984e3;
}
</style>

</head>
<body>
	<div id="flex-container">
		<c:choose>
			<c:when test="${isLogOn==true and not empty custInfo }">
				<c:choose>
					<c:when test="${custInfo.accountNO3==null or custInfo.accountNO3==0}">
						<div id="init">
							<a href="${contextPath}/account/newAccount.do">가상계좌 생성하기</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="coin">
							<div class="coin-button">
								<a href="${contextPath}/transaction/buyList.do" class="button-2"> 코인구매내역 </a>
							</div>
							<div class="coin-button">
								<a href="${contextPath}/transaction/sellList.do" class="button-2"> 코인환전내역 </a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<div id="init">
					<a href="${contextPath}/account/login.do">로그인이 필요합니다.</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>