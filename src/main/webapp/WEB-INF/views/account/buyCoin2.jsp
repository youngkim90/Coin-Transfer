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
<title>코인 구매</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
<script type="text/javascript">


	function myFunction() {
		var x = document.getElementById('amount').value
		var buyPrice = document.getElementById("buyPrice");
		var y = ${buycoin.coinPrice};

		var result = parseInt(x) * parseInt(y);
		var result2 = result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

		buyPrice.value = result2;

	}
	window.onload = function() {
		init();
	}

	function init() {
		var balance1=${custInfo.balance}
		var balance2 = balance1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		document.getElementById("accbalance").value=balance2;
	}
</script>

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
	margin: 20px 0 0 90px;
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

input {
	border: 2px solid #f7b731;
}

#td1 {
	text-align: right;
}

.id1 {
	background-color: #c7ecee;
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
						<div class="coin">
							<img width="150" height="150" src="${contextPath}/account/thumbnails.do?coin_id=${buycoin.coinNum}&fileName=${buycoin.coinName}">
							<div class="title" style="margin: 10px 0 0 0">코인명: ${buycoin.coinTitle}</div>
							<div class="price" style="margin: 3px 0 0 0">
								<fmt:formatNumber value="${buycoin.coinPrice}" type="number" var="coinPrice" />
								코인시세: ${coinPrice}원
							</div>
						</div>

						<div class="buyinfo">
							<form method="post" action="${contextPath}/account/coinTransfer2.do">
								<table style="margin: 20px 0 0 0";>
									<tr>
										<td id="td1">계좌보유금액: </td>
										<td id="td2"><input name="haveMoney" class="id1" id="accbalance" type="text" size="15" readonly /> 원</td>
									</tr>
									<tr>
										<td id="td1"></td>
										<td id="td2"></td>
									</tr>
									<tr>
										<td id="td1">구매 개수:</td>
										<td id="td2"><input type="text" name="buyamount" id="amount" size="10" onkeyup="myFunction()" /> 개</td>
									</tr>
									<tr>
										<td id="td1"></td>
										<td id="td2"></td>
									</tr>
									<tr>
										<td id="td1">구매 가격:</td>
										<td id="td2"><input name="price" class="id1" id="buyPrice" type="text" size="15" readonly /> 원</td>
									</tr>
									<tr>
										<td id="td1"></td>
										<td id="td2"></td>
									</tr>
									<tr>
										<td id="td1">2차비밀번호:</td>
										<td id="td2"><input name="cust_pw2" type="password" size="10" /></td>
									</tr>


								</table>
								<div>
									<input type="submit" value="코인구매" class="btn-gradient blue"><input type="hidden" name="buycoin" value="buycoin" />

								</div>
							</form>
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