<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">

<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div>
		<div>
			<tiles:insertAttribute name="main" />

			<article>
			 	<tiles:insertAttribute name="body" />
			</article>

		</div>

    </div>        	
</body>      
        
        