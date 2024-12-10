<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="m" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Student by ID</title>

<style>
.container {
    text-align: center;
}

.form-group {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
    const dropdownState = localStorage.getItem("dropdownState");
    if (dropdownState === "open") {
        $(".dropdown-links").show();
        $(".dropdown-toggle").addClass("open");
    }

    $(".dropdown-toggle").click(function () {
        const isOpen = $(this).next(".dropdown-links").is(":visible");
        $(this).next(".dropdown-links").slideToggle();
        $(this).toggleClass("open");
        localStorage.setItem("dropdownState", isOpen ? "closed" : "open");
    });
});
</script>
</head>
<body style="background-color: #e1dbe4;">

<%@include file="adminnavbar.jsp" %>

<h3 align="center">View Student by ID</h3><br/>
<div class="container">
    <form method="post" action="displaystudent">
        <div class="form-group">
            <label for="id">Select Master ID</label>
            <select name="id" id="id" class="form-select" required>
                <option value="">---Select---</option>
                <m:forEach items="${masterlist}" var="student">
                    <option value="${student.id}">${student.id}-${student.name}</option>
                </m:forEach>
            </select>
            <input type="submit" value="View" class="btn btn-success">
        </div>
    </form>
</div>
</body>
</html>
