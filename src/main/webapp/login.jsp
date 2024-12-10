<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="jakarta.tags.core" prefix="s"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- Add Bootstrap CSS for styling -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<!-- Optional FontAwesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
</style>
</head>
<body style="background-color: #e1dbe4;">
<%@ include file="mainnavbar.jsp" %>

<!-- Login Form Section -->
<div class="form-container">
  <div class="form-card">
    <form method="post" action="/checklogin">
      <div class="text-center mb-4">
        <i class="fas fa-user fa-3x" style="color: #2575fc;"></i>
        <h1 class="h3 fw-bold mt-3">Login</h1>
      </div>

      <!-- Error Message Display -->
      <h4 class="text-center text-danger mb-3">
        <s:out value="${message}"></s:out>
      </h4>

      <h5 class="fw-normal mb-3" style="letter-spacing: 1px;">Sign into your account</h5>

      <!-- Email Field -->
      <div class="form-outline mb-4">
        <label class="form-label" for="email">Email</label>
        <input type="email" id="email" name="email" class="form-control form-control-lg" required />
      </div>

      <!-- Password Field -->
      <div class="form-outline mb-4">
        <label class="form-label" for="password">Password</label>
        <input type="password" id="password" name="password" class="form-control form-control-lg" required />
      </div>

      <!-- Login Button -->
      <div class="d-grid gap-2 mb-4">
        <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
      </div>

      <!-- Registration Link -->
      <p class="text-center mt-4 mb-0" style="color: #393f81;">Don't have an account? <a href="studentreg.jsp"
          style="color: #393f81;">Register here</a></p>
    </form>
  </div>
</div>
<!-- End Login Form Section -->

<!-- Include Bootstrap JS and Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
