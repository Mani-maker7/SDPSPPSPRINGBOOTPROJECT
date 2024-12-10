<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="m" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Master to Student</title>

    <!-- Include Bootstrap for styling -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body style="background-color: #e1dbe4;">

<!-- Include admin navbar -->
<%@ include file="adminnavbar.jsp" %>

<div class="container">
    <h3 class="text-center">Assign Master to Student</h3>
    
    <form action="savemasterassignment" method="post">
        <input type="hidden" name="studentId" value="${student.id}">
        
        <div class="form-group">
            <label>Select Masters</label><br>
            <!-- Create a table for better alignment -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Select</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <m:forEach items="${masters}" var="master">
                        <tr>
                            <td>
                                <input type="checkbox" name="masterId" value="${master.id}">
                            </td>
                            <td>${master.id}</td>
                            <td>${master.name}</td>
                            <td>${master.email}</td>
                        </tr>
                    </m:forEach>
                </tbody>
            </table>
        </div>
        
        <button type="submit" class="btn btn-success">Assign Master</button>
    </form>
</div>

</div>

</body>
</html>
