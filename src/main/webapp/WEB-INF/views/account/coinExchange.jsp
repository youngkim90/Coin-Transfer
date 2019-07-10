<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코인 환전</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function myFunction(coin_count) {
		var x = document.getElementById("coinamount"+"+"+coin_count).value
		var y = document.getElementById("coinPrice"+"+"+coin_count).value
		

		var result = parseInt(x) * parseInt(y);
		var result2 = result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		document.getElementById(coin_count).value = result2;

	}
</script>
<style>
#flex-container {
	padding: 15px;
	border-radius: 25px;
	background: #ffd32a;
	display: flex;
	overflow-x:scroll;
	white-space:nowrap;
	position: absolute;
	width:1500px;
	top: 50%;
	left: 50%;
	transform:translate(-50%, -50%);
	border: 4px solid #ffa801;
}

.coin {
	text-align: center;
	padding: 0 20px 0;
	font-weight: bold;
	font-family: 'BenchNine', Arial, sans-serif;
	width:200px;
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
	margin: 10px 0 0 10px;
	font-size: 14px;
}

.btn-gradient.blue {
	background: rgba(102, 152, 203, 1);
	background: -moz-linear-gradient(top, rgba(102, 152, 203, 1) 0%, rgba(92, 138, 184, 1) 100%);
	background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(102, 152, 203, 1)), color-stop(100%, rgba(92, 138, 184, 1)));
	background: -webkit-linear-gradient(top, rgba(102, 152, 203, 1) 0%, rgba(92, 138, 184, 1) 100%);
	background: -o-linear-gradient(top, rgba(102, 152, 203, 1) 0%, rgba(92, 138, 184, 1) 100%);
	background: -ms-linear-gradient(top, rgba(102, 152, 203, 1) 0%, rgba(92, 138, 184, 1) 100%);
	background: linear-gradient(to bottom, rgba(102, 152, 203, 1) 0%, rgba(92, 138, 184, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#6698cb', endColorstr='#5c8ab8', GradientType=0);
}

.btn-gradient.blue:active {
	background: #608FBF;
}

.id1 {
	background-color: #c7ecee;
}

input {
	margin: 5px 0 0 0;
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
									보유코인이 없습니다<br> <a href="${contextPath}/account/buyCoin.do">코인 구매하기</a>
								</div>
							</c:when>
							<c:otherwise>
								<c:set var="coin_count" value="0" />
								<c:forEach var="item" items="${mycoinMap.mycoininfo}">
									<form method="post" action="${contextPath}/account/coinEx.do">
										<c:set var="coin_count" value="${coin_count+1 }" />
										<div class="coin">
											<a href="#"> <img width="120" height="120" src="${contextPath}/account/thumbnails.do?coin_id=${item.coinNum}&fileName=${item.coinName}">
											</a>
											<div class="title" style="margin: 10px 0 0 0">${item.coinTitle}</div>
											<input type="hidden" name="coinTitle" value="${item.coinTitle}" />
											<div class="price" style="margin: 3px 0 0 0">
												<fmt:formatNumber value="${item.coinPrice}" type="number" var="coinPrice" />
												<input type="hidden" id="coinPrice+${coin_count}" name="coinPrice" value="${item.coinPrice}" /> 현재시세: ${coinPrice}원
											</div>
											<div class="quantity" style="margin: 3px 0 0 0">보유코인: ${item.coinQuantity}개</div>
											<div>
												환전개수: <input type="text" size="5" id="coinamount+${coin_count}"  name="coinamount" onkeyup="myFunction(${coin_count})" />개
											</div>
											<div>
												환전금액: <input name="price" class="id1" id="${coin_count}" type="text" size="10" readonly />원
											</div>
											<div>
												2차비밀번호: <input name="cust_pw2" type="password" size="7" />
											</div>
											<div>
												<input type="submit" value="코인환전" class="btn-gradient blue"><input type="hidden" name="excoin" value="excoin" />
											</div>
										</div>
									</form>
								</c:forEach>
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