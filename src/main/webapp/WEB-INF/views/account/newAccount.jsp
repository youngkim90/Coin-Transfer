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
<title>가상계좌생성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	function fn_makeAccount() {
		var accountNO = ${custInfo.accountNO3};
		$.ajax({
			type : "post",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/account/accMake.do",
			data : {
				accountNO3:accountNO
			},
			success : function(data, textStatus) {
				
				var jsonInfo = JSON.parse(data);
				if(jsonInfo!=null){
					var no1=jsonInfo.accno[0];
					var no2=jsonInfo.accno[1];
					var no3=jsonInfo.accno[2];
		document.getElementById("account").value=no1+"-"+no2+"-"+no3;
		document.getElementById("accountNO1").value=no1;
		document.getElementById("accountNO2").value=no2;
		document.getElementById("accountNO3").value=no3;

				} else {
					alert("사용할 수 없는 ID입니다.");

				}

			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다." + data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");

			}
		}); //end ajax

	}
	

</script>
<style>
#flex-container {
	padding: 15px;
	border-radius: 25px;
	background: #ffd32a;
	display: flex;
	flex-wrap: nowrap;
	overflow: auto;
	position: absolute;
		transform:translate(-50%, -50%);
	top: 50%;
	left: 50%;
	border: 4px solid #ffa801;
}

#login {
	padding: 2px;
	width: 600px;
	font-family: 'BenchNine', Arial, sans-serif;
	color: #485460;
	overflow: auto;
}

#td2 {
	border-bottom: 1px dotted #EE5A24;
	border-left: 1px dotted #EE5A24;
	font-weight: bold;
}

input, select, option {
	margin: 5px;
	font-family: 'BenchNine', Arial, sans-serif;
}

#td1 {
	width: 130px;
	border-bottom: 1px dotted #EE5A24;
	font-weight: bold;
}

.text-field {
	border: 10px solid #ffffff;
	border-radius: 5px;
	font-size: 14px;
	margin: 5px;
	width: 200px;
	height: 35px;
}

.submit-btn {
	font-size: 14px;
	background-color: #f6e58d;
	border-radius: 5px;
	border: 10px solid #f6e58d;
	width: 240px;
	height: 40px;
	margin: 15px 0px 0px 165px;
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
	text-align:center;
	font-size:2em;
}
</style>
</head>
<body>
	<div id="flex-container">
		<c:choose>
			<c:when test="${isLogOn==true and not empty custInfo }">
				<form method="post" action="${contextPath}/account/newAccount2.do">
					<table id="login">

						<tr>
							<td id="td1">아이디</td>
							<td id="td2"><input type="text" name="cust_id" size="20" /></td>
						</tr>
						<tr>
							<td id="td1">비밀번호</td>
							<td id="td2"><input name="cust_pw" type="password" size="20" /></td>
						</tr>
						<tr>
							<td id="td1">2차비밀번호</td>
							<td id="td2"><input name="cust_pw2" type="password" size="20" /></td>
						</tr>
						<tr>
							<td id="td1">가상계좌발급</td>
							<td id="td2"><input type="text" id="account" name="account" size="20" class="text-field" placeholder="계좌번호" /><input type="button" id="makeaccount" value="계좌발급" onClick="javascript:fn_makeAccount()" /></td>
						</tr>
						<tr>
							<td id="td1">계좌비밀번호</td>
							<td id="td2"><input name="accountPW" type="password" size="20" /><input type="hidden" id="accountNO1" name="accountNO1" /><input type="hidden" id="accountNO2" name="accountNO2"  /><input type="hidden" id="accountNO3" name="accountNO3" /><br></td>
						</tr>
					</table>
					<div>
						<input type="submit" value="가상계좌생성" class="submit-btn">
					</div>
				</form>
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