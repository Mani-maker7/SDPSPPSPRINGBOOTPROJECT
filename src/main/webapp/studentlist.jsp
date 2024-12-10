<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List</title>

    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.5/dist/bootstrap-table.min.css">

    <style>
        /* Styling for the container and table */
        .container-fluid {
            display: flex;
            margin-top: 20px;
        }

        .main-content {
            margin-left: 250px; /* Sidebar width */
            padding: 20px;
            width: calc(100% - 250px); /* Adjust width based on sidebar size */
            overflow: hidden; /* Prevents the content from overflowing */
        }

        .table-responsive {
            overflow-x: auto;
            margin: 0;
            padding: 10px;
        }

        table#studentTable {
            width: 100%;
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
<body style="background-color: #e1dbe4;">

<!-- Include the admin navbar -->
<%@ include file="adminnavbar.jsp" %>

<div class="main-content">
    <h3 align="center">All Students</h3>

    <!-- Bootstrap Table for Students -->
    <table id="studentTable"
           class="table table-striped"
           data-toolbar="#toolbar"
           data-search="true"
           data-show-refresh="true"
           data-show-toggle="true"
           data-show-columns="true"
           data-show-export="true"
           data-click-to-select="true"
           data-pagination="true"
           data-page-list="[10, 25, 50, 100, all]">
        <thead>
            <tr>
                <th data-field="state" data-checkbox="true"></th>
                <th data-field="id">ID</th>
                <th data-field="name">Name</th>
                <th data-field="gender">Gender</th>
                <th data-field="dob">DOB</th>
                <th data-field="email">Email</th>
                <th data-field="location">Location</th>
                <th data-field="contact">Contact</th>
                <th data-field="master">Assigned Master</th>
                <th data-field="actions">Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Iterate over the list of students and display their details -->
            <s:forEach items="${studentList}" var="student">
                <tr>
                    <td></td>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.gender}</td>
                    <td>${student.dateofbirth}</td>
                    <td>${student.email}</td>
                    <td>${student.location}</td>
                    <td>${student.contact}</td>
                    <td>
                        <s:choose>
                            <s:when test="${not empty student.master}">
                                ${student.master.name}
                            </s:when>
                            <s:otherwise>
                                No Master Assigned
                            </s:otherwise>
                        </s:choose>
                    </td>
                    <td>
                        <!-- Edit Button to assign a master to this student -->
                        <a href="assignmaster?id=${student.id}" class="btn btn-primary">Assign Master</a>
                        <s:choose>
                            <s:when test="${not empty student.master}">
                                <!-- Button to remove the assigned master -->
                                <a href="removemaster?id=${student.id}" class="btn btn-danger">Remove Master</a>
                            </s:when>
                        </s:choose>
                    </td>
                </tr>
            </s:forEach>
        </tbody>
    </table>
</div>

<!-- Include Bootstrap Table JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/tableexport.jquery.plugin@1.29.0/tableExport.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.5/dist/bootstrap-table.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.5/dist/extensions/export/bootstrap-table-export.min.js"></script>

<script>
    // Initialize Bootstrap Table
    $(function () {
        $('#studentTable').bootstrapTable();
    });
</script>

</body>
</html>
