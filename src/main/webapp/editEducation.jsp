<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Education</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@coreui/icons/css/free.min.css">
    

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

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            color: #fff;
        }
    </style>
    
</head>
<body>
    <%@include file="studentnavbar.jsp" %><br/>

    <div class="main-content">
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/updateEducation" method="post">
               

                <h2 class="text-center">Edit Education</h2>
                 <div class="form-group">
                    <label for="id">ID</label>
                 <input type="number" name="id" id="id" value="${education.id != null ? education.id : 0}" class="form-control" readonly required/>
                 </div>
                <div class="form-group">
                    <label for="institution">Institution</label>
                    <input type="text" name="institution" id="institution" value="${education.institution}" class="form-control" required />
                </div>

                <div class="form-group">
                    <label for="department">Department</label>
                    <input type="text" name="department" id="department" value="${education.department}" class="form-control" required />
                </div>

                <div class="form-group">
                    <label for="programDegree">Program Degree</label>
                    <input type="text" name="programDegree" id="programDegree" value="${education.programDegree}" class="form-control" required />
                </div>

                <div class="form-group">
                    <label for="branch">Branch</label>
                    <input type="text" name="branch" id="branch" value="${education.branch}" class="form-control" required />
                </div>

                <div class="form-group">
                    <label for="currentSemester">Current Semester</label>
                    <input type="text" name="currentSemester" id="currentSemester" value="${education.currentSemester}" class="form-control" required />
                </div>

                <div class="form-group">
                    <label for="rollNo">Roll No</label>
                    <input type="text" name="rollNo" id="rollNo" value="${education.rollNo}" class="form-control" required />
                </div>

                <div class="form-group">
                    <label for="cgpa">CGPA</label>
                    <input type="text" name="cgpa" id="cgpa" value="${education.cgpa}" class="form-control" required />
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success">Save Changes</button>
                    <a href="education" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
        <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/js/coreui.bundle.min.js" integrity="sha384-JdRP5GRWP6APhoVS1OM/pOKMWe7q9q8hpl+J2nhCfVJKoS+yzGtELC5REIYKrymn" crossorigin="anonymous"></script>
    
</body>
</html>
