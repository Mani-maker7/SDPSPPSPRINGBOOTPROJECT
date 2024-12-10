<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Master</title>

    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

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
        margin-top: -20px; /* Reduce extra space */
    }
    .form-card {
        max-width: 700px;
        width: 100%;
        border-radius: 1rem;
        background-color: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 30px;
    }
    h2 {
        text-align: center;
        color: #007bff;
        margin-bottom: 20px;
        margin-top: 10px; /* Adjust margin above heading */
    }
    .btn-success {
        width: 100%;
        padding: 10px;
    }
</style>

</head>
<body style="background-color: #e1dbe4;">

<%@include file="adminnavbar.jsp" %>
<div class="form-container">
    <div class="form-card">
       <h2>Add New Master</h2>
        <form method="post" action="addnewmaster">
            <!-- Name -->
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <!-- Gender -->
            <div class="mb-3">
                <label for="gender" class="form-label">Gender:</label>
                <select class="form-control" id="gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <!-- Date of Birth -->
            <div class="mb-3">
                <label for="dateofbirth" class="form-label">Date of Birth:</label>
                <input type="date" class="form-control" id="dateofbirth" name="dateofbirth" required>
            </div>

            <!-- Email -->
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <!-- Location -->
            <div class="mb-3">
                <label for="location" class="form-label">Location:</label>
                <input type="text" class="form-control" id="location" name="location" required>
            </div>

            <!-- Contact -->
            <div class="mb-3">
                <label for="contact" class="form-label">Contact:</label>
                <input type="text" class="form-control" id="contact" name="contact" required>
            </div>

            <!-- Expertise -->
            <div class="mb-3">
                <label for="expertise" class="form-label">Experience:</label>
                <input type="text" class="form-control" id="expertise" name="expertise" required>
            </div>

            <!-- Role -->
            <div class="mb-3">
                <label for="role" class="form-label">Role:</label>
                <input type="text" class="form-control" id="role" name="role" required>
            </div>

            <!-- Joining Date -->
            <div class="mb-3">
                <label for="joiningDate" class="form-label">Joining Date:</label>
                <input type="date" class="form-control" id="joiningDate" name="joiningDate" required>
            </div>

            <!-- Age -->
            <div class="mb-3">
                <label for="age" class="form-label">Age:</label>
                <input type="number" class="form-control" id="age" name="age" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-success">Add New Master</button>
        </form>
    </div>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
