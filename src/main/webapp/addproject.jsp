<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p" %>
<%@ include file="adminnavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Project</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <style>
        /* Main container to adjust based on sidebar */
        .main-content {
            margin-left: 250px; /* Adjust according to the sidebar width */
            padding: 20px;
            width: calc(100% - 250px); /* Dynamically adjust width */
        }

        /* Centering the form */
        .form-container {
            display: flex;
            justify-content: center; /* Horizontally center the form */
            align-items: center; /* Vertically center the form */
            min-height: 80vh; /* Adjust height to center content */
        }

        .form-container form {
            width: 50%; /* Set the form width (adjust as needed) */
            background: #f9f9f9; /* Optional: Light background for form */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Optional: Subtle shadow */
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="main-content">
    <div class="form-container">
        <form action="saveproject" method="post">
            <h2 class="text-center">Add New Project</h2>

            <!-- Display message if project is added successfully -->
            <p:if test="${not empty message}">
                <div class="alert alert-success">
                    ${message}
                </div>
            </p:if>

            <div class="form-group">
                <label for="title">Project Title:</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="Enter project title" required>
            </div>

            <div class="form-group">
                <label for="frontend">Frontend:</label>
                <input type="text" class="form-control" id="frontend" name="frontend" placeholder="Enter frontend technology" required>
            </div>

            <div class="form-group">
                <label for="backend">Backend:</label>
                <input type="text" class="form-control" id="backend" name="backend" placeholder="Enter backend technology" required>
            </div>

            <div class="form-group">
                <label for="description">Project Description:</label>
                <textarea class="form-control" id="description" name="description" rows="5" placeholder="Enter project description" required></textarea>
            </div>

            <div class="form-group">
                <label for="dateEntered">Date Posted (YYYY-MM-DD HH:mm):</label>
                <input type="datetime-local" class="form-control" id="dateEntered" name="dateEntered" required>
            </div>

            <div class="form-group">
                <label for="closeDate">Due Date (YYYY-MM-DD HH:mm):</label>
                <input type="datetime-local" class="form-control" id="closeDate" name="closeDate" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Save Project</button>
                <a href="projects" class="btn btn-secondary">Back to Project List</a>
            </div>
        </form>
    </div>
</div>

<!-- Add your JavaScript files or libraries if needed -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
