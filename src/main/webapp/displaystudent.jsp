<%@page import="spp.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Student</title>

<!-- Bootstrap for table styling -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
    /* Main content */
    .main-content {
        margin-left: 250px; /* Sidebar width */
        padding: 20px;
    }

    /* Table Styling */
    table {
        width: 100%;
        margin-top: 20px;
    }

    th, td {
        text-align: center;
        padding: 10px;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    td {
        background-color: #f9f9f9;
    }
</style>

</head>
<body>
<%@include file="adminnavbar.jsp" %><br/>
<!-- Main Content Section -->
<div class="main-content">
    <h3 align="center">Display Student</h3>

    <!-- Table to display student details -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Date of Birth</th>
                <th>Email</th>
                <th>Location</th>
                <th>Contact</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><s:out value="${s.id}"></s:out></td>
                <td><s:out value="${s.name}"></s:out></td>
                <td><s:out value="${s.gender}"></s:out></td>
                <td><s:out value="${s.dateofbirth}"></s:out></td>
                <td><s:out value="${s.email}"></s:out></td>
                <td><s:out value="${s.location}"></s:out></td>
                <td><s:out value="${s.contact}"></s:out></td>
            </tr>
        </tbody>
    </table>
</div>

</body>
</html>
