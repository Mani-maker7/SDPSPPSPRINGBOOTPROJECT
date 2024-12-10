<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Submission</title>
    <link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/css/coreui.min.css" rel="stylesheet" integrity="sha384-u3h5SFn5baVOWbh8UkOrAaLXttgSF0vXI15ODtCSxl0v/VKivnCN6iHCcvlyTL7L" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #e1dbe4;">

<%@ include file="masternavbar.jsp" %>

<div class="container">
    <h3 class="text-center">Project Submission for ${student.name}</h3>
    <p><strong>Email:</strong> ${student.email}</p>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Title</th>
                <th>GitHub Link</th>
                <th>Project Link</th>
                <th>Submission Status</th>
                <th>Grade</th> <!-- New column for grading -->
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${projects}" var="project">
                <tr>
                    <td>${project.title}</td>
                    <td><a href="${project.githubLink}" target="_blank">${project.githubLink}</a></td>
                    <td><a href="${project.projectLink}" target="_blank">${project.projectLink}</a></td>
                    <td>
                        <c:if test="${not empty project.githubLink}">
                            <span class="label label-success">Submitted</span>
                        </c:if>
                        <c:if test="${empty project.githubLink}">
                            <span class="label label-danger">Not Submitted</span>
                        </c:if>
                    </td>
                    <td>
                        <!-- Grade button that triggers the modal -->
                        <button class="btn btn-info" data-toggle="modal" data-target="#gradeModal" data-title="${project.title}" data-id="${project.id}">
                            Grade
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="assignedstudents?id=${student.id}" class="btn btn-primary">Back to Assigned Students</a>
</div>

<!-- Modal for grading -->
<div class="modal fade" id="gradeModal" tabindex="-1" role="dialog" aria-labelledby="gradeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="gradeModalLabel">Grade Project</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="gradeProject" method="POST">
            <input type="hidden" name="projectId" id="projectId">
            <div class="form-group">
                <label for="projectTitle">Project Title:</label>
                <input type="text" class="form-control" id="projectTitle" disabled>
            </div>
            <div class="form-group">
                <label for="grade">Grade:</label>
                <input type="number" class="form-control" name="grade" id="grade" required>
            </div>
            <div class="form-group">
                <label for="feedback">Feedback:</label>
                <textarea class="form-control" name="feedback" id="feedback" rows="3"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Grade</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // JavaScript to populate modal with project data when the 'Grade' button is clicked
    $('#gradeModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var projectTitle = button.data('title'); // Extract project title
        var projectId = button.data('id'); // Extract project ID
        var modal = $(this);
        modal.find('.modal-body #projectTitle').val(projectTitle); // Set the title in the modal
        modal.find('.modal-body #projectId').val(projectId); // Set the project ID for form submission
    });
</script>

</body>
</html>
