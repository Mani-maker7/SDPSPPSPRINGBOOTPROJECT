<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SPP</title>
    <!-- CoreUI CSS -->
    
    <!-- CoreUI Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@coreui/icons/css/free.min.css">
    <link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/css/coreui.min.css" rel="stylesheet" integrity="sha384-u3h5SFn5baVOWbh8UkOrAaLXttgSF0vXI15ODtCSxl0v/VKivnCN6iHCcvlyTL7L" crossorigin="anonymous">
    <style>
        body {
            display: flex;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .sidebar {
            display: flex;
            flex-direction: column;  /* Use column layout */
            width: 220px;
            background-color: #343a40;
            color: white;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
            transition: width 0.3s ease;
        }

        .sidebar-header {
            padding: 20px;
            text-align: center;
            font-size: 1.5em;
        }

        .sidebar-nav {
            list-style: none;
            padding: 0;
            flex-grow: 1; /* Ensures the nav items take available space */
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

        .sidebar .nav-icon {
            color: #FFFFFF;
        }

        /* Change color on hover */
        .sidebar .nav-link:hover .nav-icon {
            color: #FFFFFF;
        }

        /* Keep the Logout button at the bottom */
        .sidebar .nav-item.logout-item {
            margin-top: auto; /* Pushes the Logout button to the bottom */
        }

    </style>
</head>
<body>
    <div class="sidebar sidebar-narrow-unfoldable border-end">
        <div class="sidebar-header border-bottom">
            <div class="nav-icon cil-menu"></div>
        </div>
        <ul class="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link" href="studenthome">
                    <i class="nav-icon cil-home"></i> Student Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="studentprofile">
                    <i class="nav-icon cil-user"></i> Student Profile
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="studentselectproject">
                    <i class="nav-icon cil-check-circle"></i> Select Project
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="viewSelectedProjects">
                    <i class="nav-icon cil-cloud-upload"></i> Upload Projects
                </a>
            </li>
            
            <!-- Logout Button at the Bottom -->
            <li class="nav-item logout-item">
                <a class="nav-link" href="studentlogout">
                    <i class="nav-icon cil-exit-to-app"></i> Logout
                </a>
            </li>
        </ul>
    </div>

    <!-- CoreUI JS -->
    <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.2.0/dist/js/coreui.bundle.min.js" integrity="sha384-JdRP5GRWP6APhoVS1OM/pOKMWe7q9q8hpl+J2nhCfVJKoS+yzGtELC5REIYKrymn" crossorigin="anonymous"></script>
</body>
</html>
