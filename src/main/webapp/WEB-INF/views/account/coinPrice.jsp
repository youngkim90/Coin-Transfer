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
<title>코인시세</title>
<style>
#flex-container {
	padding: 15px;
	border-radius: 25px;
	background: #ffd32a;
	display: flex;
	flex-wrap: nowrap;
	height: 210px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border: 4px solid #ffa801;
}

.coin {
	text-align: center;
	padding: 0 20px 0;
	font-weight: bold;
	font-family: 'BenchNine', Arial, sans-serif;
}

.btn-gradient {
	text-decoration: none;
	color: white;
	padding: 5px 15px;
	display: inline-block;
	position: relative;
	border: 1px solid rgba(0, 0, 0, 0.21);
	border-bottom: 4px solid rgba(0, 0, 0, 0.21);
	border-radius: 4px;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
	margin: 7px 0 0 0;
	font-size: 14px;
}

/* Gradient - ugly css is ugly */
.btn-gradient.cyan {
	background: rgba(27, 188, 194, 1);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(27, 188, 194, 1)), to(rgba(24, 163, 168, 1)));
	background: -webkit-linear-gradient(rgba(27, 188, 194, 1) 0%, rgba(24, 163, 168, 1) 100%);
	background: -moz-linear-gradient(rgba(27, 188, 194, 1) 0%, rgba(24, 163, 168, 1) 100%);
	background: -o-linear-gradient(rgba(27, 188, 194, 1) 0%, rgba(24, 163, 168, 1) 100%);
	background: linear-gradient(rgba(27, 188, 194, 1) 0%, rgba(24, 163, 168, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#1bbcc2', endColorstr='#18a3a8', GradientType=0);
}

.btn-gradient.cyan:active {
	background: #169499;
}

#init {
	margin: 50px;
	text-align: center;
	font-size: 2em;
}
</style>
</head>
<body>
	<div id="flex-container">
		<c:choose>
			<c:when test="${isLogOn==true and not empty custInfo }">
				<c:set var="coin_count" value="0" />
				<c:forEach var="item" items="${coinMap.coininfo}">
					<c:set var="coin_count" value="${coin_count+1 }" />
					<div class="coin">
						<a href="#"> <img width="120" height="120" src="${contextPath}/account/thumbnails.do?coin_id=${item.coinNum}&fileName=${item.coinName}">
						</a>
						<div class="title" style="margin: 10px 0 0 0">${item.coinTitle}</div>
						<div class="price" style="margin: 3px 0 0 0">
							<fmt:formatNumber value="${item.coinPrice}" type="number" var="coinPrice" />
							${coinPrice}원
						</div>
					</div>

				</c:forEach>
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