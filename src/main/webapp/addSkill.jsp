<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Skill</title>
    <%@include file="studentnavbar.jsp" %><br/>

<style>
    /* CSS for centering the form */
    body, html {
        height: 100%;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }

    .skills-section {
        width: 100%;
        max-width: 800px; /* Set the max width for the form */
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .skills-title {
        text-align: center;
        color: #007bff;
        font-size: 24px;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        font-weight: bold;
        color: #555;
    }

    .form-group input,
    .form-group select {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ddd;
        font-size: 16px;
    }

    .form-group select {
        cursor: pointer;
    }

    .btn-primary {
        padding: 10px 30px;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }
</style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

<div class="skills-section">
    <div class="skills-container">
        <h3 class="skills-title">Add Skills</h3>
        <form action="addSkill" method="post">
            <!-- Skill Name -->
            <div class="form-group">
                <label for="skillName">Skill Name:</label>
                <input type="text" name="skillName" id="skillName" required>
            </div>
            
            <!-- Proficiency -->
            <div class="form-group">
                <label for="proficiency">Proficiency Level:</label>
                <select name="proficiency" id="proficiency" required>
                    <option value="" disabled selected>Select proficiency level</option>
                    <option value="Beginner">Beginner</option>
                    <option value="Intermediate">Intermediate</option>
                    <option value="Advanced">Advanced</option>
                </select>
            </div>

            <!-- Submit Button -->
            <div style="text-align: center;">
                <button type="submit" class="btn-primary">Add Skill</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
