<%@page import="spp.model.Master"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
     Master m = (Master)session.getAttribute("master");
     %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Master home</title>
</head>
<body>
<%@include file="masternavbar.jsp" %><br/>
Welcome <%=m.getName() %>
</body>
</html>