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
<title>코인이체</title>
<script>
	
</script>
<style>
a {
	color: #273c75;
	text-decoration: none;
}

.button-1 {
	background-color: #e58e26;
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

.button-1:before, .button-1:after {
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

.button-1:before {
	border-color: #e58e26;
	border-right-width: 2px;
	border-top-width: 2px;
	right: -5px;
	top: -5px;
}

.button-1:after {
	border-bottom-width: 2px;
	border-color: #e58e26;
	border-left-width: 2px;
	bottom: -5px;
	left: -5px;
}

.button-1:hover, .button-1.hover {
	background-color: #e58e26;
}

.button-1:hover:before, .button-1.hover:before, .button-1:hover:after, .button-1.hover:after {
	height: 100%;
	width: 100%;
}

.button-1:active {
	background: #cd6133;
}

.box1 {
	width: 20%;
	padding: 10px;
	border: 1px solid black;
}

#flex-container {
	padding: 10px;
	border-radius: 25px;
	background: #ffd32a;
	display: flex;
	flex-wrap: nowrap;
	overflow: auto;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border: 4px solid #ffa801;
}

#coin {
	padding: 15px 0 0 15px;
	font-family: 'BenchNine', Arial, sans-serif;
	color: #485460;
	display: inline-block;
	margin: 15px 0 0 0;

}

.coin-left {
	float: left;
	margin: 0;
	padding: 8px 0 0 0;
	width: 210px;
	text-align: left;
	height: 23px;
	font-weight: bold;
	display: block;
}

.coin-middle {
	float: left;
	width: 350px;
	text-align: center;
	height: 63px;
	font-weight: bold;
	display: block;
}

.coin-right {
	float: left;
	margin: 0 20px 20px 0;
	width: 180px;
	text-align: right;
	height: 13px;
	font-weight: bold;
	display: block;

}

.button-2 {
	background-color: #6c5ce7;
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
	padding: 5px 30px 5px;
	position: relative;
	text-transform: uppercase;
	font-weight: 700;
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
				<div id="coin">
					<div class="coin-left">회원이름: ${custInfo.custName}</div>
					<div class="coin-left">
						회원계좌번호:
						<c:choose>
							<c:when test="${custInfo.accountNO3==null or custInfo.accountNO3==0}">
								<a href="${contextPath}/account/newAccount.do">가상계좌생성</a>
							</c:when>
							<c:otherwise>${custInfo.accountNO1}-${custInfo.accountNO2}-${custInfo.accountNO3}</c:otherwise>
						</c:choose>
					</div>
					<div class="coin-left">
						회원계좌잔액:
						<c:choose>
							<c:when test="${custInfo.balance==null or custInfo.balance==0}">0 원</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${custInfo.balance}" type="number" var="balance" />${balance}원</c:otherwise>
						</c:choose>
					</div>
					<div class="coin-left">
						<a href="${contextPath}/account/mycoin.do">보유 코인현황 조회</a>
					</div>
					<div class="coin-left">
						<a href="${contextPath}/transaction/dealList.do">코인 거래내역 조회</a>
					</div>
				</div>

				<div id="coin">
					<div class="coin-middle">
						<a href="${contextPath}/account/coinPrice.do" class="button-1">코인시세</a>
					</div>
					<div class="coin-middle">
						<a href="${contextPath}/account/buyCoin.do" class="button-1">코인구매</a>
					</div>
					<div class="coin-middle">
						<a href="${contextPath}/account/coinExchange.do" class="button-1">코인환전</a>
					</div>
				</div>

				<div id="coin">
					<div class="coin-right">
						<a href="#" class="button-2"> 가장 핫한 코인</a>
					</div>
					<br><br><br>
					<div class="coin-right" style="color: blue;height:30px;">
						첼시코인: 5.35%↑
						<img width="30" height="30" src="${contextPath}/account/thumbnails.do?coin_id=9&fileName=첼시코인.png">
	
					</div>
					<br><br><br>
					<div class="coin-right" style="color: red;height:30px;">
					맨시티코인: 2.80%↓
					<img width="30" height="30" src="${contextPath}/account/thumbnails.do?coin_id=4&fileName=맨시티코인.png">
					</div>
				</div>
				
			</c:when>
			<c:otherwise>
				<div id="coin">
					<div class="coin-left"></div>
					<div class="coin-left"></div>
					<div class="coin-left" style="text-align: center; font-size: 28px; font-weight: bold;">
						<a href="${contextPath}/account/login.do">로그인</a>
					</div>
				</div>

				<div id="coin">
					<div class="coin-middle">
						<a href="${contextPath}/account/coinPrice.do" class="button-1">코인시세</a>
					</div>
					<div class="coin-middle">
						<a href="${contextPath}/account/buyCoin.do" class="button-1">코인구매</a>
					</div>
					<div class="coin-middle">
						<a href="${contextPath}/account/coinExchange.do" class="button-1">코인환전</a>
					</div>

				</div>

				<div id="coin">
					<div class="coin-right">
						<a href="#" class="button-2"> 가장 핫한 코인</a>
					</div>
					<br><br><br>
					<div class="coin-right" style="color: blue;height:30px;">
						첼시코인: 5.35%↑
						<img width="30" height="30" src="${contextPath}/account/thumbnails.do?coin_id=9&fileName=첼시코인.png">
	
					</div>
					<br><br><br>
					<div class="coin-right" style="color: red;height:30px;">
					맨시티코인: 2.80%↓
					<img width="30" height="30" src="${contextPath}/account/thumbnails.do?coin_id=4&fileName=맨시티코인.png">
					</div>
				</div>

			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>