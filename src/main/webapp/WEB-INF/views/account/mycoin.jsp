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
<title>보유 코인</title>

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
	display: flex;
	position: absolute;
	top: 50%;
	left: 50%;
	width:1500px;
	transform: translate(-50%, -50%);
	border: 4px solid #ffa801;
	overflow-x:scroll;
	white-space:nowrap;
}

.coin {
	text-align: center;
	padding: 0 20px 0;
	font-weight: bold;
	font-family: 'BenchNine', Arial, sans-serif;
	width:170px;
	display:inline-block;
	margin:15px 0 0 0;
	color:#212121;
}

#init {
	margin: 50px;
	text-align: center;
	font-size: 2em;
}
.total{
	width:30px;
	height:70px;
	text-align:center;
	font-weight: bold;
	font-size:40px;
	margin:20px 0 0 550px;
	color:#1A237E;
}
.totalinfo{}
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
						<c:choose>
							<c:when test="${overlapped==0}">
								<div id="init">
									보유코인이 없습니다<br>
									<a href="${contextPath}/account/buyCoin.do">코인 구매하기</a>
								</div>
							</c:when>
							<c:otherwise>
							<div class="totalinfo">
								<c:set var="coin_count" value="0" />
								<c:set var="coinTotalPrice" value="0" />
								<c:forEach var="item" items="${mycoinMap.mycoininfo}">
									<c:set var="coin_count" value="${coin_count+1 }" />
									
									<div class="coin">
										<a href="#"> <img width="120" height="120" src="${contextPath}/account/thumbnails.do?coin_id=${item.coinNum}&fileName=${item.coinName}">
										</a>
										<div class="title" style="margin: 10px 0 0 0; font-size:22px;">${item.coinTitle}</div>
										<div class="price" style="margin: 3px 0 0 0">
											<fmt:formatNumber value="${item.coinPrice}" type="number" var="coinPrice" />
											현재시세: ${coinPrice}원
										</div>
										<div class="quantity" style="margin: 3px 0 0 0">보유코인: ${item.coinQuantity}개</div>

										<input type="hidden" id="totalprice" name="totalprice" value="${item.coinPrice*item.coinQuantity}" />
										<div class="price" style="margin: 3px 0 0 0">
											<fmt:formatNumber value="${item.coinPrice*item.coinQuantity}" type="number" var="totalPrice" />
											코인자산: ${totalPrice}원
										</div>
										<c:set var="coinTotalPrice" value="${coinTotalPrice+item.coinPrice*item.coinQuantity}" />
									</div>
								</c:forEach>
								<fmt:formatNumber value="${coinTotalPrice}" type="number" var="cointotalPrice" />
								<div class="total" style="float:bottom;">총 코인자산: ${cointotalPrice}원</div></div>
							</c:otherwise>
							
							</c:choose>
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