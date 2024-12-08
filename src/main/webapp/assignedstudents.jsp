<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="m" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assigned Students</title>
    <link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/css/coreui.min.css" rel="stylesheet" integrity="sha384-u3h5SFn5baVOWbh8UkOrAaLXttgSF0vXI15ODtCSxl0v/VKivnCN6iHCcvlyTL7L" crossorigin="anonymous">
     <style>
       .table-container {
    float: right; /* Moves the table to the right side */
    width: 70%; /* Adjust the width as needed */
    position: relative; /* Allow movement using left */
    left: 5cm; /* Moves the table 1cm to the right */
    
    
}

    </style>
</head>
<body style="background-color: #e1dbe4;">

<%@ include file="masternavbar.jsp" %>

<div class="container"><br/>
    <h3 class="text-center">Students Assigned to Master: ${master.name}</h3><br/>
    <p><strong>Email:</strong> ${master.email}</p>
    
    <div >
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Location</th>
                <th>Contact</th>
                <th>View Project Submission</th> <!-- New column -->
            </tr>
        </thead>
        <tbody>
            <m:forEach items="${assignedStudents}" var="student">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>${student.gender}</td>
                    <td>${student.location}</td>
                    <td>${student.contact}</td>
                   <td>
                    <!-- View Project Submission -->
                    <c:if test="${not empty student.projects}">
                        <a href="viewProjectSubmission?id=${student.id}" class="btn btn-info">View Submission</a>
                    </c:if>
                </td>
                </tr>
            </m:forEach>
        </tbody>
    </table>
    </div>

    <a href="masterhome.jsp" class="btn btn-primary">Back to Master Home</a>
</div>
    <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/js/coreui.bundle.min.js" integrity="sha384-JdRP5GRWP6APhoVS1OM/pOKMWe7q9q8hpl+J2nhCfVJKoS+yzGtELC5REIYKrymn" crossorigin="anonymous"></script>

</body>
</html>
