<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="adminnavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Project</title>
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
<body style="background-color: #e1dbe4;">
<div class="main-content">
    <div class="form-container">
        <form action="editproject" method="post">
            <input type="hidden" name="id" value="${project.id}" />
            
            <h2 class="text-center">Edit Project</h2>
            <div class="form-group">
                <label>Project Title</label>
                <input type="text" name="title" value="${project.title}" class="form-control" required />
            </div>
            
            <div class="form-group">
                <label>Frontend</label>
                <input type="text" name="frontend" value="${project.frontend}" class="form-control" required />
            </div>
            
            <div class="form-group">
                <label>Backend</label>
                <input type="text" name="backend" value="${project.backend}" class="form-control" required />
            </div>
            
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" class="form-control" required>${project.description}</textarea>
            </div>
            
            <div class="form-group">
                <label>Date Entered</label>
                <input type="datetime-local" name="dateEntered" value="${project.dateEntered}" class="form-control" required />
            </div>
            
            <div class="form-group">
                <label>Close Date</label>
                <input type="datetime-local" name="closeDate" value="${project.closeDate}" class="form-control" required />
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="projects" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
