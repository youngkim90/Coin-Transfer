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
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>

function fn_overlapped(){
    var _id=document.getElementById("_cust_id").value;
    
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }

     $.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/account/overlapped.do",
			data : {
				id:_id
			},
			success : function(data, textStatus) {
				if(data=='false'){
					alert("사용할 수 있는 ID입니다.");
		       	    $('#btnOverlapped').prop("disabled", true);
		       	    $('#_cust_id').prop("disabled", true);
		       	    document.getElementById("cust_id").value=_id

		          }else{
		        	  alert("사용할 수 없는 ID입니다.");
		          }
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax

}

    function fn_inspect(){
    	var _pw=document.getElementById("cust_pw").value;
    	var _id=document.getElementById("_cust_id").value;
    	var _pw2=document.getElementById("cust_pw2").value;
    	var _name=document.getElementById("custName").value;

    	
    	if(_id==''){
    		alert("아이디를 입력하세요.")
    	}
    	else if(_pw==''){
    		alert("비밀번호를 입력하세요.")
    	}
    	else if(_pw2==''){
    		alert("2차 비밀번호를 입력하세요.")
    	}
    	else if(_name==''){
    		alert("이름을 입력하세요.")
    	}
    	else{
    		
    		addform.submit();
    	}
  
    }
</script>
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

#login {
	padding: 2px;
	width: 600px;
	font-family: 'BenchNine', Arial, sans-serif;
	color: #485460;
}
#td2{
	border-bottom:1px dotted #EE5A24;
	border-left:1px dotted #EE5A24;
		font-weight:bold;
	
}

 input, select, option{
	margin: 5px;
	font-family: 'BenchNine', Arial, sans-serif;

}

#td1{
	width:130px;
	border-bottom:1px dotted #EE5A24;
		font-weight:bold;
}

</style>
</head>

<body>
		<div id="flex-container">
		<form id="addform" action="${contextPath}/account/addCust.do" method="post">
			<table id="login">
				<tr>
					<td id="td1">아이디</td>
					<td id="td2"><input type="text" name="_cust_id" id="_cust_id" size="20" /> <input type="hidden" name="cust_id" id="cust_id" /> <input type="button" id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" /></td>
				</tr>
				<tr>
					<td id="td1">비밀번호</td>
					<td id="td2"><input name="cust_pw" id="cust_pw" type="password" size="20" /></td>
				</tr>
				<tr>
					<td id="td1">2차비밀번호</td>
					<td id="td2"><input name="cust_pw2" id="cust_pw2" type="password" size="20" /></td>
				</tr>
				<tr>
					<td id="td1">이름</td>
					<td id="td2"><input name="custName" id="custName" type="text" size="20" /></td>
				</tr>
				<tr>
					<td id="td1">성별</td>
					<td id="td2"><input type="radio" name="cust_gender" value="102" /> 여성<span style="padding-left: 120px"></span> <input type="radio" name="cust_gender" value="101" checked />남성</td>
				</tr>
				<tr>
					<td id="td1">법정생년월일</td>
					<td id="td2"><select name="cust_birth_y">

							<c:forEach var="year" begin="1" end="100">
								<c:choose>
									<c:when test="${year==80}">
										<option value="${ 1920+year}" selected>${ 1920+year}</option>
									</c:when>
									<c:otherwise>
										<option value="${ 1920+year}">${ 1920+year}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>

					</select>년 <select name="cust_birth_m">
							<c:forEach var="month" begin="1" end="12">
								<c:choose>
									<c:when test="${month==5 }">
										<option value="${month }" selected>${month }</option>
									</c:when>
									<c:otherwise>
										<option value="${month }">${month}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>월 <select name="cust_birth_d">
							<c:forEach var="day" begin="1" end="31">
								<c:choose>
									<c:when test="${day==10 }">
										<option value="${day}" selected>${day}</option>
									</c:when>
									<c:otherwise>
										<option value="${day}">${day}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>일 <span style="padding-left: 50px"></span> <input type="radio" name="cust_birth_gn" value="2" checked />양력 <span style="padding-left: 50px"></span> <input type="radio" name="cust_birth_gn"
						value="1" />음력</td>
				</tr>
				<tr>
					<td id="td1">휴대폰번호</td>
					<td id="td2"><select name="hp1">
							<option>없음</option>
							<option selected value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> - <input size="10px" type="text" name="hp2"> - <input size="10px" type="text" name="hp3"><br>
				</tr>
		
			</table>
			<input type="button" value="회원가입" onClick="javascript:fn_inspect()" />
			</form>
		</div>


</body>
</html>