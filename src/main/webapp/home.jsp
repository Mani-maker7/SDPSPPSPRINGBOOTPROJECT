<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Student Projects and Portfolio Management System</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    .hero-section {
      background: linear-gradient(to bottom right, #007bff, #00d4ff);
      color: white;
      padding: 50px 20px;
      text-align: center;
    }
    .hero-section h1 {
      font-size: 3rem;
      margin-bottom: 20px;
    }
    .hero-section p {
      font-size: 1.2rem;
      margin-bottom: 30px;
    }
    .features-section {
      padding: 50px 20px;
      text-align: center;
    }
    .features-section h2 {
      font-size: 2.5rem;
      margin-bottom: 30px;
    }
    .feature-card {
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border: none;
      padding: 20px;
      transition: transform 0.3s ease;
    }
    .feature-card:hover {
      transform: scale(1.05);
    }
    .cta-section {
      background-color: #f8f9fa;
      padding: 50px 20px;
      text-align: center;
    }
    .cta-section h2 {
      font-size: 2rem;
      margin-bottom: 20px;
    }
    .cta-section a {
      font-size: 1.2rem;
    }
    .contact-info {
      background-color: #f8f9fa;
      padding: 30px 20px;
      text-align: center;
      margin-top: 50px;
    }
    .contact-info h3 {
      font-size: 2rem;
      margin-bottom: 20px;
    }
    .contact-info i {
      margin-right: 10px;
    }
  </style>
</head>
<body>
  <!-- Hero Section -->
  <div class="hero-section">
    <h1>Welcome to the Student Projects and Portfolio</h1>
    <p>Showcase your skills, manage your projects, and explore exciting portfolios in one platform.</p>
    <a href="studentreg.jsp" class="btn btn-primary btn-lg">Get Started</a>
  </div>

  <!-- Features Section -->
  <div class="features-section">
    <h2>Why Use This Platform?</h2>
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="feature-card p-4">
            <i class="fas fa-laptop-code fa-3x mb-3 text-primary"></i>
            <h4>Project Management</h4>
            <p>Submit, track, and collaborate on projects seamlessly.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="feature-card p-4">
            <i class="fas fa-user-graduate fa-3x mb-3 text-success"></i>
            <h4>Portfolio Creation</h4>
            <p>Build professional portfolios to showcase your achievements.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="feature-card p-4">
            <i class="fas fa-comments fa-3x mb-3 text-info"></i>
            <h4>Mentor Feedback</h4>
            <p>Get valuable feedback and improve your work.</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Call-to-Action Section -->
  <div class="cta-section">
    <h2>Ready to Start Your Journey?</h2>
    <a href="login.jsp" class="btn btn-success btn-lg">Login Now</a>
    <a href="studentreg.jsp" class="btn btn-outline-primary btn-lg">Register Here</a>
  </div>

  <!-- Contact Information Section -->
  <div class="contact-info">
    <h3>Contact Us</h3>
    <p>If you have any questions or need support, feel free to reach out to us:</p>
    <p><i class="fas fa-phone"></i> +1 234 567 890</p>
    <p><i class="fas fa-envelope"></i> support@yourplatform.com</p>
    <p><i class="fas fa-map-marker-alt"></i> 123 Your Street, City, Country</p>
  </div>

  <!-- Include Bootstrap JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>