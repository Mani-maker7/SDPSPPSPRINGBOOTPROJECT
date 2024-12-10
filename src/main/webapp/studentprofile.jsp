<%@page import="spp.model.Student" %>
<%@page import="spp.model.Project" %>
<%@ page import="java.util.List" %>
<%@page import="spp.model.Education" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Student s = (Student) session.getAttribute("student");
    List<Project> projects = s.getProjects();
    List<Education> educationList = s.getEducationList();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Profile</title>
    <style>
        /* Same styles as before for layout */
        .container {
            display: flex;
            flex-direction: column; 
            align-items: center;    
            margin-top: 30px;       
            gap: 20px;              
        }

        .profile-container {
            max-width: 430px;
            max-height: 550px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: absolute;
            left: 100px;
            top: 30px;
        }

        .profile-header {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-bottom: 20px;
        }

        .profile-header img {
            margin-right: 20px;
        }

        .profile-header h3 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }

        .profile-header p {
            color: #777;
            font-size: 14px;
        }

        .profile-detail {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
            align-items: center;
        }

        .profile-detail label {
            font-weight: bold;
            color: #555;
            width: 40%;
        }

        .profile-detail span {
            font-size: 16px;
            color: #333;
            width: 55%;
            padding-left: 16px;
            border-left: 4px solid #D3D3D3;
            display: flex;
            align-items: center;
        }

        .edit-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
            color: #007bff;
            text-decoration: none;
            border: none;
            background: none;
            cursor: pointer;
        }

        .edit-btn:hover {
            color: #0056b3;
        }

        .edit-btn i {
            font-size: 20px;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }

        .project-details {
            display: none;
            padding-left: 20px;
        }

        .project-item {
            margin-bottom: 20px;
        }

        .view-more-btn {
            margin-top: 10px;
            font-size: 14px;
            color: #007bff;
            cursor: pointer;
        }

        .sidebar-header {
            padding: 20px;
            text-align: center;
            font-size: 1.5em;
        }

        .selected-projects {
            max-width: 400px;
            width: 45%;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: absolute;
            top: 450px;
            left: 100px;
        }

        .selected-projects h2 {
            text-align: center;
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .selected-projects ul {
            list-style: none;
            padding-left: 0;
        }

        .selected-projects li {
            padding: 10px;
            margin-bottom: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .selected-projects li:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .remove-project-btn {
            background-color: transparent;
            border: none;
            color: #ff0000;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            float: right;
            margin-bottom: 5px;
        }

        .remove-project-btn:hover {
            color: #cc0000;
        }

       .education-container {
    display: flex;
    flex-direction: column; /* Stack the cards vertically */
    gap: 20px; /* Space between the cards */
    width: 100%;
}

.education-card {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    position: relative;
    max-width: 100%;
    height: auto; /* Ensure the height adjusts based on content */
}

.education-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.education-title {
    font-size: 1.6em;
    color: #007bff;
    margin-bottom: 10px;
}

.education-card p {
    font-size: 14px;
    color: #555;
    margin: 5px 0;
}

.education-card p strong {
    color: #333;
}

/* Edit icon styling */
.edit-icon {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 18px;
    color: #007bff;
    background-color: #fff;
    border: 1px solid #007bff;
    border-radius: 50%;
    padding: 10px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.edit-icon:hover {
    background-color: #007bff;
    color: #fff;
}

.btn-primary {
    position: relative;
    left: -10px;
    top: 10px;
}

    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body style="background-color: #e1dbe4;">
    <%@include file="studentnavbar.jsp" %><br/>

    <div class="container">
        <!-- Profile Container -->
        <div class="profile-container">
            <a href="updateprofile.jsp" class="edit-btn" title="Edit Profile">
                <i class="fas fa-edit"></i>
            </a>
            
            <div class="profile-header">
                <img src="displayprofileimage?id=${student.id}" alt="Profile Image" class="profile-image"><br>
                <div>
                    <h3><%= s.getName() %></h3>
                    <p>Student ID: <%= s.getId() %></p>
                </div>
            </div>

            <div class="profile-detail">
                <label>Gender</label> 
                <span><%= s.getGender() %></span> 
            </div>
            <div class="profile-detail">
                <label>Date of Birth</label>
                <span><%= s.getDateofbirth() %></span>
            </div>
            <div class="profile-detail">
                <label>Email</label>
                <span><%= s.getEmail() %></span>
            </div>
            <div class="profile-detail">
                <label>Location</label>
                <span><%= s.getLocation() %></span>
            </div>
            <div class="profile-detail">
                <label>Contact</label>
                <span><%= s.getContact() %></span>
            </div>
        </div>

        <!-- Selected Projects Container -->
        <div class="selected-projects">
            <h3 align ="center">Selected Projects</h3>
            <p class="text-muted">Can't select more than two projects.</p>
            <c:if test="${empty student.projects}">
                <p>No projects selected.</p>
            </c:if>

            <c:if test="${not empty student.projects}">
                <ul>
                    <c:forEach var="project" items="${student.projects}">
                        <li class="project-item">
                            <strong>Title:</strong> ${project.title}<br>
                            <strong>Close Date:</strong> ${project.closeDate}<br>
                            <a href="javascript:void(0);" class="view-more-btn" onclick="toggleDetails(${project.id})">View More</a>
                            <div id="project-details-${project.id}" class="project-details">
                                <strong>Frontend:</strong> ${project.frontend}<br>
                                <strong>Backend:</strong> ${project.backend}<br>
                                <strong>Description:</strong> ${project.description}<br>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>

            <a href="studentselectproject" class="btn btn-primary">Select a Project</a>
        </div>

<a href="viewEducation" style="position: relative; left: 200px; top: 4px; font-size: 18px; 
    background-color: rgba(0, 123, 255, 0.1); 
    color: #007bff; 
    padding: 8px 30px; 
    border-radius: 5px; 
    box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2); 
    text-decoration: none;
    display: inline-block;
    padding-right: 888px;
    text-align: center;
    margin-left: 60px;"> <!-- Adjust this value to move it slightly to the right -->
    Education
</a>




        <!-- Display Education Details -->
    <!-- Display Education Details -->
<div class="education-details" style="float: right; margin-left: 460px; width: 80%; max-width: 1000px;">
    <c:if test="${not empty educationList}">
        <!-- Education Container with Edit Icon -->
        <div class="education-container">
            <c:forEach var="education" items="${educationList}">
                <div class="education-card">
                    <!-- Edit Icon -->
                    <a href="editEducation?id=${education.id}" class="edit-icon">
                        <i class="fa fa-edit"></i> Edit
                    </a>
                    <!-- Education Details -->
                    <h4 class="education-title">${education.institution}</h4>
                    <p><strong>Department:</strong> ${education.department}</p>
                    <p><strong>Program Degree:</strong> ${education.programDegree}</p>
                    <p><strong>Branch:</strong> ${education.branch}</p>
                    <p><strong>Current Semester:</strong> ${education.currentSemester}</p>
                    <p><strong>Roll No:</strong> ${education.rollNo}</p>
                    <p><strong>CGPA:</strong> ${education.cgpa}</p>
                </div>
            </c:forEach>
            <a href="addEducationForm" class="btn btn-primary">Add Education</a>
        </div>
    </c:if>
</div>


<a href="viewEducation" style="position: relative; left: 200px; top: 4px; font-size: 18px; 
    background-color: rgba(0, 123, 255, 0.1); 
    color: #007bff; 
    padding: 8px 30px; 
    border-radius: 5px; 
    box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2); 
    text-decoration: none;
    display: inline-block;
    padding-right: 888px;
    text-align: center;
    margin-left: 60px;"> <!-- Adjust this value to move it slightly to the right -->
    Skills
</a>

<!-- Display the skills -->
<div class="profile-container" style="float: right; margin-left: 480px; width: 58%; max-width: 1000px; margin-top: 450px;">
    <h3>Skills</h3>
    <ul>
        <c:forEach var="skill" items="${student.skills}">
            <li>${skill.skillName} - ${skill.proficiency}</li>
        </c:forEach>
    </ul>
    <a href="addSkill.jsp" class="btn btn-primary">Add Skill</a>
</div>


    </div>

</body>
</html>
