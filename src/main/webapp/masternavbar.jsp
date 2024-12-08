<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  
<title>SPP</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@coreui/icons/css/free.min.css">
    <link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/css/coreui.min.css" rel="stylesheet" integrity="sha384-u3h5SFn5baVOWbh8UkOrAaLXttgSF0vXI15ODtCSxl0v/VKivnCN6iHCcvlyTL7L" crossorigin="anonymous">

<style type="text/css">
 body {
       /* Adjusting the layout for the sidebar */
        body {
            display: flex;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #e1dbe4;
        }

       body {
    display: flex;
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f6dad3;
}

.sidebar {
    width: 220px; /* Set the width of the sidebar */
    background-color: #343a40;
    color: white;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    padding-top: 20px;
    display: flex;
    flex-direction: column; /* Allow stacking the items vertically */
    justify-content: space-between; /* This will push the last item to the bottom */
}

.sidebar-header {
    padding: 20px;
    text-align: center;
    font-size: 1.5em;
}

.sidebar-nav {
    list-style: none;
    padding: 0;
    flex-grow: 1; /* Take available space between header and footer */
}

.sidebar-nav .nav-item {
    margin: 10px 0;
}

.sidebar-nav .nav-link {
    display: flex;
    align-items: center;
    padding: 12px 20px;
    text-decoration: none;
    color: white;
    font-size: 1.1em;
    transition: background-color 0.3s;
}

.sidebar-nav .nav-link:hover {
    background-color: #007bff;
}

.sidebar-nav .nav-icon {
    margin-right: 15px;
}

/* Optional: Handle the sidebar toggle */
.sidebar.collapsed {
    width: 80px; /* Smaller width when collapsed */
}

.sidebar.collapsed .nav-link {
    justify-content: center;
}

.sidebar.collapsed .sidebar-header {
    text-align: left;
}

.sidebar .nav-icon {
    color: #FFFFFF; /* Change this color to your preferred color */
}

/* Optionally, you can change the color when hovering over the icons */
.sidebar .nav-link:hover .nav-icon {
    color: #FFFFFF; /* Change this color to your preferred hover color */
}

/* Ensures logout button is at the bottom */
.sidebar-footer {
    margin-top: auto; /* Push the footer (Logout button) to the bottom */
}

        .sidebar .nav-icon {
        color: #FFFFFF; /* Change this color to your preferred color */
    }

    /* Optionally, you can change the color when hovering over the icons */
    .sidebar .nav-link:hover .nav-icon {
        color: #FFFFFF; /* Change this color to your preferred hover color */
    }
</style>
</head>
<body>
    <body>
    <div class="sidebar sidebar-narrow-unfoldable border-end">
        <div class="sidebar-header border-bottom">
            <div class="nav-icon cil-menu"></div>
        </div>
        <ul class="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link" href="masterhome">
                    <i class="nav-icon cil-home"></i> Master Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="assignedstudents?id=${master.id}">
                    <i class="nav-icon cil-people"></i>Assigned Students
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="masterprofile">
                    <i class="nav-icon cil-user"></i> Master Profile
                </a>
            </li>
        </ul>
        <div class="sidebar-footer">
            <a class="nav-link" href="login.jsp">
                <i class="nav-icon cil-exit-to-app"></i> Logout
            </a>
        </div>
    </div>

    <!-- CoreUI JS -->
    <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/js/coreui.bundle.min.js" integrity="sha384-JdRP5GRWP6APhoVS1OM/pOKMWe7q9q8hpl+J2nhCfVJKoS+yzGtELC5REIYKrymn" crossorigin="anonymous"></script>
</body>


    <!-- CoreUI JS -->
    <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/js/coreui.bundle.min.js" integrity="sha384-JdRP5GRWP6APhoVS1OM/pOKMWe7q9q8hpl+J2nhCfVJKoS+yzGtELC5REIYKrymn" crossorigin="anonymous"></script>
</body>

</html>