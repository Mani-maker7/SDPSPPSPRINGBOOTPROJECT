<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="m" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Masters</title>

    <!-- CSS for Bootstrap Table -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.5/dist/bootstrap-table.min.css">

    <style>
        /* Assuming sidebar width is 250px */
        .container-fluid {
            display: flex;
            margin-top: 20px;
        }

        /* Sidebar area (fixed width) */
        .sidebar {
            width: 250px;
            background-color: #f4f4f4;
            position: fixed;
            height: 100%;
            padding-top: 20px;
        }

        /* Main content area (table will adjust here) */
        .main-content {
            margin-left: 250px; /* Push content to the right of the sidebar */
            padding: 20px;
            width: calc(100% - 250px); /* Adjust width based on sidebar size */
            overflow: hidden; /* Prevents the content from overflowing */
        }

        /* Ensure the table is responsive */
        .table-responsive {
            overflow-x: auto;
            margin: 0;
            padding: 10px;
        }

        table#table {
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
<body>

<%@ include file="adminnavbar.jsp" %><br/>

<div class="main-content">
    <h3 align="center">Manage Masters</h3>

    <!-- Bootstrap Table for Masters -->
    <table id="table"
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
                <th data-field="dob">Date of Birth</th>
                <th data-field="email">Email</th>
                <th data-field="location">Location</th>
                <th data-field="contact">Contact</th>
                <th data-field="expertise">Expertise</th>
                <th data-field="role">Role</th>
                <th data-field="joiningDate">Joining Date</th>
                <th data-field="age">Age</th>
                <th data-field="action">Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through the master list -->
            <m:forEach items="${masterlist}" var="master">
                <tr>
                    <td></td>
                    <td><m:out value="${master.id}"></m:out></td>
                    <td><m:out value="${master.name}"></m:out></td>
                    <td><m:out value="${master.gender}"></m:out></td>
                    <td><m:out value="${master.dateofbirth}"></m:out></td>
                    <td><m:out value="${master.email}"></m:out></td>
                    <td><m:out value="${master.location}"></m:out></td>
                    <td><m:out value="${master.contact}"></m:out></td>
                    <td><m:out value="${master.expertise}"></m:out></td>
                    <td><m:out value="${master.role}"></m:out></td>
                    <td><m:out value="${master.joiningDate}"></m:out></td>
                    <td><m:out value="${master.age}"></m:out></td>

                    <td>
                        <!-- Delete action link -->
                        <a href='<m:url value="deletem?id=${master.id}" />' class="delete" title="Delete">
                            <i class="fa fa-trash" style="color:red"></i> Delete
                        </a>
                    </td>
                </tr>
            </m:forEach>
        </tbody>
    </table>
</div>

<!-- JS for Bootstrap Table -->
<script src="https://cdn.jsdelivr.net/npm/tableexport.jquery.plugin@1.29.0/tableExport.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.5/dist/bootstrap-table.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.5/dist/extensions/export/bootstrap-table-export.min.js"></script>

<script>
    // Initialize Bootstrap Table
    $(function () {
        $('#table').bootstrapTable();
    });
</script>

</body>
</html>
