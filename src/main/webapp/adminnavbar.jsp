<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>SPP</title>
<style type="text/css">
/* Sidebar styles */
.sidebar {
    height: 100%;
    width: 250px;
    position: fixed;
    top: 0;
    left: 0;
    background-color: lightgrey;
    padding-top: 20px;
}

.sidebar a {
    padding: 8px 16px;
    text-decoration: none;
    font-size: 16px;
    color: black;
    display: block;
}

.sidebar a:hover {
    background-color: lightblue;
    color: black;
}

.sidebar a.active {
    background-color: #007bff;
    color: white;
}

/* Page content styling */
.content {
    margin-left: 250px;
    padding: 20px;
}

/* Style the header */
h2 {
    text-align: center;
    padding: 10px;
}

/* Section styling (removed dropdown functionality) */
.manage-section {
    padding: 10px 16px;
    font-size: 16px;
    font-weight: bold;
    background-color: lightgrey;
    margin-bottom: 10px;
}

.manage-section:hover {
    background-color: lightblue;
}

.sidebar .dropdown-links {
    padding-left: 20px;
}

.sidebar .dropdown-links a {
    padding: 8px 16px;
}

/* Logout button styles */
.logout-button {
    position: fixed;
    top: 10px;
    right: 10px;
    z-index: 1000;
    font-size: 16px;
}

.logout-button a {
    text-decoration: none;
    color: white;
    background-color: #007bff;
    padding: 10px 15px;
    border-radius: 5px;
    display: inline-flex;
    align-items: center;
    font-size: 16px;
}

.logout-button a:hover {
    background-color: #0056b3;
}

.logout-button i {
    margin-right: 5px;
}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</head>
<body>

<div class="logout-button">
    <a href="login.jsp">
        <i class="fas fa-sign-out-alt"></i> Logout
    </a>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <h3 align="center">Admin Dashboard</h3>
    <a href="adminhome" >Admin Home</a>

    <!-- Manage Students Section (No Dropdown) -->
    <div class="manage-section">
        Manage Students
    </div>
    <div class="dropdown-links">
        <a href="viewallstudents">View All Students</a>
        <a href="deletestudents">Delete Students</a>
    </div>

    <!-- Manage Masters Section (No Dropdown) -->
    <div class="manage-section">
        Manage Masters
    </div>
    <div class="dropdown-links">
        <a href="viewallmasters">View All Masters</a>
        <a href="addnewmaster">Add New Master</a>
        <a href="deletemasters">Delete Masters</a>
    </div>

    <!-- Projects Management Section (No Dropdown) -->
    <div class="manage-section">
        Projects Management
    </div>
    <div class="dropdown-links">
        <a href="addproject">Add Project</a>
        <a href="projects">View All Projects</a>
    </div>
    
    <div>
        <a href="studentlist">Mapping</a>
    </div>
</div>

</body>
</html>
