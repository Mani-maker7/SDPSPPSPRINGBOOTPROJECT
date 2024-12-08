<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p" %>
<%@ include file="adminnavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projects</title>

    <!-- CSS for Bootstrap and Table -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.5/dist/bootstrap-table.min.css">

    <style>
        .container-fluid {
            display: flex;
            margin-top: 20px;
        }

        .sidebar {
            width: 250px;
            background-color: #f4f4f4;
            position: fixed;
            height: 100%;
            padding-top: 20px;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            overflow: hidden;
        }

        .table-responsive {
            overflow-x: auto;
            margin: 0;
            padding: 10px;
        }

        table#table {
            width: 100%;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>
<div class="main-content">
    <h2 class="text-center">Project List</h2>

    <!-- Display success message -->
    <p:if test="${not empty message}">
        <div class="alert alert-success">
            ${message}
        </div>
    </p:if>

    <!-- Table to display projects -->
    <div class="table-responsive">
        <table id="table" 
               class="table table-striped table-bordered"
               data-search="true"
               
               data-pagination="true"
               data-page-list="[10, 25, 50, 100, all]">
            <thead>
                <tr>
                    <th>Project Title</th>
                    <th>Frontend</th>
                    <th>Backend</th>
                    <th>Description</th>
                    <th>Date Entered</th>
                    <th>Close Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <p:forEach var="project" items="${projects}">
                    <tr>
                        <td>${project.title}</td>
                        <td>${project.frontend}</td>
                        <td>${project.backend}</td>
                        <td>${project.description}</td>
                        <td>${project.dateEntered}</td>
                        <td>${project.closeDate}</td>
                        <td>
                            <div class="action-buttons">
                                <a href="editproject?id=${project.id}" class="btn btn-warning">Edit</a>
                                <a href="deleteproject?id=${project.id}" class="btn btn-danger">Delete</a>
                            </div>
                        </td>
                    </tr>
                </p:forEach>
            </tbody>
        </table>
    </div>

    <a href="addproject" class="btn btn-primary">Add New Project</a>
</div>

<!-- JS for Bootstrap Table -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.5/dist/bootstrap-table.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.5/dist/extensions/export/bootstrap-table-export.min.js"></script>

<script>
    $(function () {
        $('#table').bootstrapTable();
    });
</script>
</body>
</html>
