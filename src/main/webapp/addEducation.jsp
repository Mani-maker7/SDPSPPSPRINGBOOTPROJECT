<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Education</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@coreui/icons/css/free.min.css">

    <!-- Shared CSS Styles -->
    <style>
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .form-container form {
            width: 50%;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
        }

        .text-center {
            text-align: center;
        }

        .btn-primary:hover, .btn-secondary:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <%@include file="studentnavbar.jsp" %><br/>

    <div class="main-content">
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/addEducation" method="POST">
                <h2 class="text-center">Add Education</h2>

                <div class="form-group">
                    <label for="institution">Institution</label>
                    <input type="text" class="form-control" id="institution" name="institution" required>
                </div>
                <div class="form-group">
                    <label for="department">Department</label>
                    <input type="text" class="form-control" id="department" name="department" required>
                </div>
                <div class="form-group">
                    <label for="programDegree">Program Degree</label>
                    <input type="text" class="form-control" id="programDegree" name="programDegree" required>
                </div>
                <div class="form-group">
                    <label for="branch">Branch</label>
                    <input type="text" class="form-control" id="branch" name="branch" required>
                </div>
                <div class="form-group">
                    <label for="currentSemester">Current Semester</label>
                    <input type="text" class="form-control" id="currentSemester" name="currentSemester" required>
                </div>
                <div class="form-group">
                    <label for="rollNo">Roll No</label>
                    <input type="text" class="form-control" id="rollNo" name="rollNo" required>
                </div>
                <div class="form-group">
                    <label for="cgpa">CGPA</label>
                    <input type="text" class="form-control" id="cgpa" name="cgpa" required>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Add Education</button>
                    <a href="education" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/js/coreui.bundle.min.js" integrity="sha384-JdRP5GRWP6APhoVS1OM/pOKMWe7q9q8hpl+J2nhCfVJKoS+yzGtELC5REIYKrymn" crossorigin="anonymous"></script>
</body>
</html>
