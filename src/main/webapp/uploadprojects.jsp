<%@ page import="java.util.List" %>
<%@page import="spp.model.Student" %>
<%@page import="spp.model.Project" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Student s = (Student) session.getAttribute("student");
    List<Project> projects = s.getProjects();
%>

<!DOCTYPE html>
<html>
<style>
     body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4; /* Light background for contrast */
    margin: 0;
    padding: 0;
    display: flex;
    align-items: flex-start; /* Align content to the top */
    justify-content: center; /* Horizontally center the content */
    height: 100vh; /* Full viewport height */
    padding-top: 120px; /* Add some spacing at the top */
}

.selected-projects {
    width: 76%; /* Adjust width for responsiveness */
    max-width: 1500px; /* Limit max width */
    background-color: #ffffff; /* White background for better readability */
    border: 1px solid #ddd; /* Light border for structure */
    border-radius: 10px; /* Rounded corners */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for 3D effect */
    padding: 20px; /* Space inside the container */
    text-align: center; /* Center-align the text */
    margin: 0 auto; /* Center container horizontally */
}


.selected-projects h3 {
    font-size: 24px;
    color: #333; /* Darker heading color */
    margin-bottom: 10px;
}

.selected-projects p.text-muted {
    color: #777; /* Subtle muted text */
    margin-bottom: 20px;
}

.selected-projects ul {
    list-style: none; /* Remove bullet points */
    padding: 0; /* Remove default padding */
    margin: 0; /* Remove default margin */
}

.selected-projects li {
    background-color: #f9f9f9; /* Slightly lighter background for items */
    padding: 15px;
    margin-bottom: 10px;
    border: 1px solid #ddd; /* Light border for items */
    border-radius: 5px; /* Rounded corners */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth hover effect */
    text-align: left;
}

.selected-projects li:hover {
    transform: translateY(-3px); /* Slight lift on hover */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Slight shadow on hover */
}

.view-more-btn {
    font-size: 14px;
    color: #007bff; /* Blue for link */
    cursor: pointer;
    text-decoration: underline;
    margin-top: 10px;
    display: inline-block; /* Ensures spacing */
}

.view-more-btn:hover {
    color: #0056b3; /* Darker blue on hover */
}

.project-details {
    display: none; /* Initially hidden */
    margin-top: 10px; /* Space between details and the button */
    text-align: left; /* Left-align the details */
    background-color: #fefefe; /* Slightly off-white */
    padding: 10px;
    border: 1px solid #ccc; /* Subtle border */
    border-radius: 5px; /* Rounded corners */
}


.project-item {
    background-color: #f9f9f9;
    padding: 15px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.project-info {
    display: flex; /* Flex container for layout */
    justify-content: space-between; /* Push items to edges */
    align-items: center; /* Center vertically */
}

.project-details-left {
    text-align: left; /* Align text on the left */
}

.upload-button {
    background-color: #007bff; /* Blue button */
    color: white; /* White text */
    border: none;
    padding: 5px 10px; /* Compact size */
    font-size: 12px; /* Smaller font size */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Pointer cursor on hover */
    display: inline-flex; /* Align icon and text inline */
    align-items: center; /* Vertically center icon and text */
    gap: 5px; /* Space between icon and text */
    transition: background-color 0.3s ease;
}

.upload-button:hover {
    background-color: #0056b3; /* Darker blue on hover */
}

.upload-button i {
    font-size: 14px; /* Icon size */
}
.alert {
    position: fixed;
    top: 10px; /* Adjust as needed */
    left: 50%;
    transform: translateX(-50%);
    z-index: 1000; /* Ensure it appears above other elements */
    width: auto; /* Adjust width as needed */
    max-width: 90%; /* Responsive limit */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 10px 20px;
    border-radius: 5px;
    text-align: center;
}
</style>

<head>
<body style="background-color: #e1dbe4;">

    <title>Upload Projects</title>
    <!-- Include Bootstrap for Modal -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <%@include file="studentnavbar.jsp" %><br/>

    <div class="selected-projects">
        <h3 align="center">Upload Projects</h3>
        <p class="text-muted">You can't select more than two projects.</p>

        <!-- Check if no projects are selected -->
        <c:if test="${empty student.projects}">
            <p>No projects selected yet.</p>
        </c:if>

        <!-- Display selected projects -->
        <c:if test="${not empty student.projects}">
            <ul>
                <c:forEach var="project" items="${student.projects}">
                    <li class="project-item">
                        <div class="project-info">
                            <div class="project-details-left">
                                <c:if test="${not empty project.githubLink}">
                                    <span style="color: green; font-weight: bold;">✔Uploaded</span><br>
                                   <div style="border-top: 1px solid #ccc; margin: 10px 0; width: 526%;"></div>
                                 
                                </c:if>
                                <span><strong>Title:</strong> ${project.title}</span><br>
                                <span><strong>Due Date:</strong> ${project.closeDate}</span>
                            </div>

                            <!-- Button to trigger modal -->
                           <button 
    class="upload-button" 
    data-bs-toggle="modal" 
    data-bs-target="#uploadModal-${project.id}" 
    style="margin-top: 16px;">
    <i class="cil-cloud-upload"></i> Add Details
</button>

                        </div>

                        <!-- View More button -->
                        <a href="javascript:void(0);" class="view-more-btn" onclick="toggleDetails(${project.id})">View More</a>

                        <!-- Hidden Project Details -->
                        <div id="project-details-${project.id}" class="project-details">
                            <strong>Frontend:</strong> ${project.frontend}<br>
                            <strong>Backend:</strong> ${project.backend}<br>
                            <strong>Description:</strong> ${project.description}<br>
                        </div>
                    </li>

                    <!-- Modal for Upload -->
                    <div class="modal fade" 
     id="uploadModal-${project.id}" 
     tabindex="-1" 
     aria-labelledby="uploadModalLabel-${project.id}" 
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="uploadProjectFile" method="post">
                <!-- Include the projectId hidden field -->
                <input type="hidden" name="projectId" value="${project.id}" />

                <div class="modal-header">
                    <h5 class="modal-title">Add Project Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Project Title Input -->
                    <div class="mb-3">
                        <label for="projectTitle-${project.id}" class="form-label">
                            Project Title
                        </label>
                        <input 
                            type="text" 
                            class="form-control" 
                            id="projectTitle-${project.id}" 
                            name="projectTitle" 
                            value="${project.title}" 
                            required />
                    </div>

                    <!-- Project Link Input -->
                    <div class="mb-3">
                        <label for="projectLink-${project.id}" class="form-label">
                            Project Link
                        </label>
                        <input 
                            type="url" 
                            class="form-control" 
                            id="projectLink-${project.id}" 
                            name="projectLink" 
                            placeholder="e.g., https://example.com/project-demo"
                            value="${not empty project.projectLink ? project.projectLink : ''}" 
                            required />
                    </div>

                    <!-- GitHub Link Input -->
                    <div class="mb-3">
                        <label for="githubLink-${project.id}" class="form-label">
                            GitHub Repository Link
                        </label>
                        <input 
                            type="url" 
                            class="form-control" 
                            id="githubLink-${project.id}" 
                            name="githubLink" 
                            value="${not empty project.githubLink ? project.githubLink : ''}" 
                            required />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

                </c:forEach>
            </ul>
        </c:if>
    </div>

    <!-- JavaScript for toggling project details -->
    <script>
        function toggleDetails(projectId) {
            var details = document.getElementById("project-details-" + projectId);
            details.style.display = details.style.display === "none" ? "block" : "none";
        }
    </script>

</body>
</html>
