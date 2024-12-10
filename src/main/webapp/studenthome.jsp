<%@page import="spp.model.Student" %>
<%@page import="spp.model.Project" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <!-- Link to a CSS framework like Bootstrap for better styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7fc;
            font-family: 'Arial', sans-serif;
        }
        .dashboard-container {
            margin-top: 30px;
        }
        .card-header {
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
            background-color: #4CAF50;
            color: white;
        }
        .card-body {
            background-color: #ffffff;
        }
        .project-card {
            margin: 15px;
        }
        .project-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }
        .project-info {
            margin-top: 10px;
        }
        .status-badge {
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
        }
        .status-selected {
            background-color: #17a2b8;
            color: white;
        }
        .status-completed {
            background-color: #28a745;
            color: white;
        }
        .status-inprocess {
            background-color: #ffc107;
            color: white;
        }
    </style>
</head>
    <%@include file="studentnavbar.jsp" %><br/>

<body style="background-color: #e1dbe4;">


<!-- Navigation Bar (you can replace this with your actual navbar) -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#"></a>
</nav>

<div class="container dashboard-container">
    <div class="row">
        <!-- Selected Projects Column -->
        <div class="col-lg-4">
            <div class="card">
                <div class="card-header">Selected Projects</div>
                <div class="card-body">
                    <!-- Example project card -->
                    <div class="card project-card">
                        <div class="card-body">
                            <h5 class="project-title">Project A</h5>
                            <p class="project-info">Frontend: React</p>
                            <p class="project-info">Backend: Node.js</p>
                            <span class="badge status-badge status-selected">Selected</span>
                        </div>
                    </div>
                    <!-- Another example project -->
                    <div class="card project-card">
                        <div class="card-body">
                            <h5 class="project-title">Project B</h5>
                            <p class="project-info">Frontend: Angular</p>
                            <p class="project-info">Backend: Java</p>
                            <span class="badge status-badge status-selected">Selected</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Completed Projects Column -->
        <div class="col-lg-4">
            <div class="card">
                <div class="card-header">Completed Projects</div>
                <div class="card-body">
                    <!-- Example project card -->
                    <div class="card project-card">
                        <div class="card-body">
                            <h5 class="project-title">Project C</h5>
                            <p class="project-info">Frontend: Vue.js</p>
                            <p class="project-info">Backend: Python</p>
                            <span class="badge status-badge status-completed">Completed</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- In-Process Projects Column -->
        <div class="col-lg-4">
            <div class="card">
                <div class="card-header">In-Process Projects</div>
                <div class="card-body">
                    <!-- Example project card -->
                    <div class="card project-card">
                        <div class="card-body">
                            <h5 class="project-title">Project D</h5>
                            <p class="project-info">Frontend: HTML/CSS</p>
                            <p class="project-info">Backend: PHP</p>
                            <span class="badge status-badge status-inprocess">In Process</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (optional, for any Bootstrap components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
