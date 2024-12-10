<%@page import="spp.model.Master" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Master m = (Master) session.getAttribute("master");
if (m == null) {
    response.sendRedirect("masterlogin"); // Redirect to login page
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Master Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/css/coreui.min.css" rel="stylesheet" integrity="sha384-u3h5SFn5baVOWbh8UkOrAaLXttgSF0vXI15ODtCSxl0v/VKivnCN6iHCcvlyTL7L" crossorigin="anonymous">
<style>
    .profile-container {
        max-width: 600px;
        margin: 30px auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 10px;
        background-color: #f9f9f9;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .profile-header {
        text-align: center;
        margin-bottom: 20px;
    }
    .profile-header h3 {
        margin: 0;
        font-size: 24px;
        color: #333;
    }
    .profile-header p {
        color: #777;
        font-size: 14px;
    }
    .profile-detail {
        margin: 15px 0;
    }
    .profile-detail label {
        font-weight: bold;
        color: #555;
        display: block;
        margin-bottom: 5px;
    }
    .profile-detail span {
        font-size: 16px;
        color: #333;
    }
</style>
</head>
<body style="background-color: #e1dbe4;">
<%@include file="masternavbar.jsp" %><br/>

<div class="profile-container">
    <!-- Profile Header -->
    <div class="profile-header">
        <h3><%= m.getName() %></h3>
        <p>Master ID: <%= m.getId() %></p>
    </div>

    <!-- Profile Details -->
    <div class="profile-detail">
        <label>Gender</label>
        <span><%= m.getGender() %></span>
    </div>
    <div class="profile-detail">
        <label>Email</label>
        <span><%= m.getEmail() %></span>
    </div>
    <div class="profile-detail">
        <label>Location</label>
        <span><%= m.getLocation() %></span>
    </div>
    <div class="profile-detail">
        <label>Contact</label>
        <span><%= m.getContact() %></span>
    </div>
</div>

</body>
</html>
