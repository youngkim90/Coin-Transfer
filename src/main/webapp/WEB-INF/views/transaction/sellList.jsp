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
<meta charset="UTF-8">
<title>판매내역</title>
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
	background: #ffd32a; 
	flex-wrap : nowrap; 
	position : absolute; 
	top : 50%; left : 50%; 
	transform : translate( -50%, -50%);
	border: 4px solid #ffa801;
	flex-wrap: nowrap;
	position: absolute;
	height:300px;
	overflow-y:scroll;
}

#coin {
	padding: 2px;
	width: 760px;
	font-family: 'BenchNine', Arial, sans-serif;
	color: #485460;
}

.coin-1 {
	float: left;
	margin: 5px 15px 5px;
	width: 120px;
	text-align: center;
	height: 30px;
	font-weight: bold;
	font-size: 20px;
	color: naby;
	display: inline-block;
}

.coin-2 {
	float: left;
	margin: 5px 15px 5px;
	width: 120px;
	text-align: center;
	height: 40px;
	font-size: 15px;
	font-weight: bold;
	display: inline-block;
	border-bottom: 1px dotted #EE5A24;
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
						<div id="coin">
							<div class="coin-1">코인이름</div>
							<div class="coin-1">환전개수</div>
							<div class="coin-1">환전금액</div>
							<div class="coin-1">코인시세</div>
							<div class="coin-1">환전날짜</div>
						</div>
						<div id="coin">
							<c:set var="coin_count" value="0" />
							<c:forEach var="item" items="${sellMap.selllist}">
								<c:set var="coin_count" value="${coin_count+1 }" />
								<div class="coin-2">${item.coinTitle}</div>
								<div class="coin-2">${item.sellAmount}</div>
								<div class="coin-2">${item.getMoney}</div>
								<div class="coin-2">${item.sellPrice}</div>
								<div class="coin-2">${item.sellDate}</div>
							</c:forEach>
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
</div>
</body>
</html>