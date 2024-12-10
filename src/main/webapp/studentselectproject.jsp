<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p" %>
<%@ include file="studentnavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Project</title>
    <style>
    .container{
    margin-left: -cm;
}
    
        .project-profile {
    border: 1px solid #ddd;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 5px;
    margin-left: 1cm; /* Move it 1 cm to the right */
}

        .project-row {
            margin-bottom: 10px;
        }
        .project-close-date {
            text-align: right;
        }
        .form-container {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 15px;
        }
        .view-more-btn {
            margin-top: 10px;
            cursor: pointer;
        }
        .project-details {
            display: none;
        }
        .project-info {
            font-size: 16px;
        }
        .separator {
            margin: 0 5px;
        }
         .btn.btn-primary {
        margin-left: 16cm; /* Move the submit button 1 cm to the right */
    }
    </style>
</head>
<body style="background-color: #e1dbe4;">

<div class="container"><br/>
    <h2 class="text-center">Available Projects</h2><br/>

    <!-- Start of the form for selecting projects -->
    <form action="selectproject" method="POST">
        <p:forEach var="project" items="${projects}">
            <div class="project-profile">
                <!-- Project Title -->
                <div class="row project-row">
                    <div class="col-md-8">
                        <h3>${project.title}</h3>
                    </div>
                    <!-- Close Date on the right side -->
                    <div class="col-md-4 project-close-date">
                        <p><strong>Close Date:</strong> ${project.closeDate}</p>
                    </div>
                </div>

                <!-- Frontend and Backend side by side with a separator -->
                <div class="row project-row project-info">
                    <div class="col-md-12">
                        <p><strong>Frontend:</strong> ${project.frontend} <span class="separator">|</span> <strong>Backend:</strong> ${project.backend}</p>
                    </div>
                </div>

                <!-- Hidden Project Description -->
                <div class="row project-row project-details">
                    <div class="col-md-12">
                        <p><strong>Description:</strong> ${project.description}</p>
                    </div>
                </div>

                <!-- View More / View Less Button -->
                <button type="button" class="btn btn-info view-more-btn" onclick="toggleDetails(this)">
                    View More
                </button>

                <!-- Checkbox to select the project -->
                <div class="form-container">
                    <label>
                        <input type="checkbox" name="projectId" value="${project.id}">
                        Select Project
                    </label>
                </div>
            </div>
        </p:forEach>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <!-- End of the form -->

</div>

<script>
    // Function to toggle project details
    function toggleDetails(button) {
        var details = button.previousElementSibling;
        var isVisible = details.style.display === "block";
        
        // Toggle the visibility of the project details
        if (isVisible) {
            details.style.display = "none";
            button.textContent = "View More";
        } else {
            details.style.display = "block";
            button.textContent = "View Less";
        }
    }
</script>

</body>
</html>
