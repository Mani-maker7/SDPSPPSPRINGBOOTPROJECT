<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>

    <!-- Include Bootstrap CSS and FontAwesome for styling -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Meta for responsiveness -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .form-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .form-card {
            max-width: 600px;
            width: 100%;
            border-radius: 1rem;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .success-message {
            font-size: 24px;
            font-weight: bold;
            color: #28a745;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body style="background-color: #e1dbe4;">

<!-- Modern Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary">
    <div class="container">
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarButtonsExample"
            aria-controls="navbarButtonsExample"
            aria-expanded="false"
            aria-label="Toggle navigation"
        >
            <i class="fas fa-bars"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarButtonsExample">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/">Contact</a>
                </li>
                
            </ul>
            <div class="d-flex align-items-center">
                <div class="dropdown me-3">
                    <button type="button" class="btn btn-primary">
                     <a class="nav-link" href="login.jsp">Login</a>
                     </button>

                </div>
                <button type="button" class="btn btn-primary">
                    <a class="nav-link" href="studentreg.jsp">Registration</a>
                </button>
            </div>
        </div>
    </div>
</nav>

<!-- Registration Form Section -->
<div class="form-container">
    <div class="form-card">

        <!-- Display Registration Success Message if Exists -->
        <% 
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
            <div class="success-message">
                <i class="fas fa-check-circle"></i> <br>
                <%= successMessage %>
            </div>
        <% 
            }
        %>

        <!-- Registration Form -->
        <form method="post" action="insertstudent">
            <div class="text-center mb-4">
                <!-- Change the icon color to blue -->
                <i class="fas fa-user-plus fa-3x" style="color: #007bff;"></i>
                <h1 class="h3 fw-bold mt-3">Student Registration</h1>
            </div>

            <h5 class="fw-normal mb-3" style="letter-spacing: 1px;">Create your account</h5>

            <div class="form-outline mb-3">
                <label class="form-label" for="sname">Enter Name</label>
                <input type="text" id="sname" name="sname" class="form-control" required />
            </div>

            <div class="form-outline mb-3">
                <label class="form-label">Gender</label><br />
                <div class="form-check form-check-inline">
                    <input type="radio" id="genderMale" name="sgender" value="Male" class="form-check-input" required />
                    <label class="form-check-label" for="genderMale">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" id="genderFemale" name="sgender" value="Female" class="form-check-input" required />
                    <label class="form-check-label" for="genderFemale">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" id="genderOther" name="sgender" value="Others" class="form-check-input" required />
                    <label class="form-check-label" for="genderOther">Others</label>
                </div>
            </div>

            <div class="form-outline mb-3">
                <label class="form-label" for="sdob">Date of Birth</label>
                <input type="date" id="sdob" name="sdob" class="form-control" required />
            </div>

            <div class="form-outline mb-3">
                <label class="form-label" for="semail">Email ID</label>
                <input type="email" id="semail" name="semail" class="form-control" required />
            </div>

            <div class="form-outline mb-3">
                <label class="form-label" for="spwd">Password</label>
                <input type="password" id="spwd" name="spwd" class="form-control" required />
            </div>

            <div class="form-outline mb-3">
                <label class="form-label" for="slocation">Location</label>
                <input type="text" id="slocation" name="slocation" class="form-control" required />
            </div>

            <div class="form-outline mb-3">
                <label class="form-label" for="scontact">Contact</label>
                <input type="number" id="scontact" name="scontact" class="form-control" required />
            </div>

            <div class="d-grid gap-2">
                <button class="btn btn-dark btn-lg btn-block" type="submit">Register</button>
            </div>

            <p class="text-center mt-4 mb-0" style="color: #393f81;">Already have an account? <a href="login.jsp" style="color: #393f81;">Login here</a></p>
        </form>
    </div>
</div>
<!-- End Registration Form Section -->

<!-- Include Bootstrap JS and Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>