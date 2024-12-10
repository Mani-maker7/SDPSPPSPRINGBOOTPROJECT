<%@page import="spp.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
     Student s = (Student)session.getAttribute("student");
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body style="background-color: #e1dbe4;">
<%@include file="studentnavbar.jsp" %>

<h3 align="center">Update profile</h3>
<div class= "container">
<form method = "post" action = "update" enctype="multipart/form-data">



<label>ID</label>
<input type = "number" class="form-control" name = "sid" value="<%=s.getId()%>" readonly required />
<br/>
<label>Enter name</label>
<input type = "text" class="form-control" name = "sname" value="<%=s.getName()%>" required />
<br/>
<label>Gender</label>
<input type = "radio" name = "sgender" required value = "Male" class="form-check-input" />Male
<input type = "radio" name = "sgender" required value = "Female" class="form-check-input"/>Female
<input type = "radio" name = "sgender" required value = "others" class="form-check-input" />Others 
<br/>
<label>Date of Birth</label>
<input type = "date" name = "sdob" class="form-control" value="<%=s.getDateofbirth()%>" required />
<br/>
<label>Email ID</label>
<input type = "email" name = "semail" class="form-control" value="<%=s.getEmail()%>" readonly required />
<br/>
<label>Password</label>
<input type = "password" name = "spwd" class="form-control" value="<%=s.getPassword()%>" required />
<br/>
<label>Location</label>
<input type = "text" name = "slocation" class="form-control" value="<%=s.getLocation()%>" required />
<br/>
<label>Contact</label>
<input type = "number" name = "scontact" class="form-control" value="<%=s.getContact()%>" required />
<br/>
<input type = "file" name="studentprofileimage" required />
<br/>
<input type="submit" value = "Update" class="btn btn-success">
<input type="reset" value = "Clear" class="btn btn-success">

</form>
</div>
</body>
</html>