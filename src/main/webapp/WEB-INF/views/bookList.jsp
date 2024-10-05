<%@page import="java.util.List"%> 
<%@page import="com.spring.model.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Bootstrap Icons CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <style>
        /* Fullscreen background image */
        body {
            background-image: url('https://img.freepik.com/free-photo/still-life-books-versus-technology_23-2150062979.jpg?size=626&ext=jpg&ga=GA1.1.464910780.1720724193&semt=ais_hybrid');
            background-size: cover;
            background-position: center;
            backdrop-filter: blur(5px);
            height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Blurred header background */
        .header {
            width: 100%;
            background: rgba(255, 192, 203, 0.5); /* Soft pink with 50% transparency */
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 1.5rem;
            font-weight: bold;
            backdrop-filter: blur(10px); /* Blur the background behind the header */
            position: fixed;
            top: 0;
            z-index: 1;
        }

        /* Navigation bar */
        .navbar {
            position: absolute;
            top: 0;
            right: 20px;
            font-size: 1rem;
            display: flex;
            gap: 10px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px;
            background: rgba(255, 255, 255, 0.2); /* Soft transparency */
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: rgba(255, 255, 255, 0.5);
        }


        /* Card styling */
        .card {
            background: rgba(255, 192, 203, 0.5); /* Soft pink with 50% transparency */
            backdrop-filter: blur(5px); /* Blur the background behind the card */
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2); /* Soft shadow for the card */
            margin-top: 80px; /* Adjust margin to not overlap with the header */
            padding: 20px;
            width: 100%;
            max-width: 1200px;
        }

        .card-header {
            background: rgba(255, 255, 255, 0.3); /* Semi-transparent white for blur effect */
            color: white;
            font-size: 1.5rem;
            border-radius: 10px;
            padding: 10px;
        }

        .table {
            margin-top: 20px;
            border-radius: 5px;
        }

        .table th {
            background-color: #0d6efd;
            color: white;
        }

        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
        }

        .btn-warning, .btn-danger {
            border-radius: 20px;
            padding: 5px 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-warning {
            background-color: #17a2b8; /* Cool blue color */
            border: none; 
        }

        .btn-warning:hover {
            background-color: #138496; /* Darker blue on hover */
            transform: scale(1.1); /* Slightly increase button size on hover */
            box-shadow: 0px 4px 10px rgba(19, 132, 150, 0.5); /* Add shadow effect */
        }

        .btn-danger:hover {
            background-color: #c82333; /* Darker red on hover */
            transform: scale(1.1); /* Slightly increase button size on hover */
            box-shadow: 0px 4px 10px rgba(200, 35, 51, 0.5); /* Add shadow effect */
        }

        .table-responsive {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <!-- Header with blurred background and navigation -->
    <div class="header">
        Book Management
        <!-- Navigation bar for Delete History and Log Out -->
        <div class="navbar">
            <a href="/SprignMVCMaven/book/showDeletedBooks">Delete History</a>
            <a href="/SprignMVCMaven/">Log Out</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="card">
            <div class="card-header text-center">
                Book List
            </div>
            <div class="card-body">
                <!-- Error Alert -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>404:</strong> ${error}
                    </div>
                </c:if>
                
                <a href="/SprignMVCMaven/book/insertBook" class="btn btn-sm btn-warning">
                <i class="bi bi-plus-circle"></i> Add Book
                </a>

                <!-- Responsive Table or Error Message -->
                <div class="table-responsive">
                    <c:choose>
                        <c:when test="${empty list}">
                            <table class="table table-hover table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Title</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Qty</th>
                                        <th scope="col">Edit/Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="6" class="text-center text-danger">No books available at the moment.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-hover table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Title</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Qty</th>
                                        <th scope="col">Edit/Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="book">
                                        <tr>
                                            <td scope="row">${book.id}</td>
                                            <td>${book.title}</td>
                                            <td>${book.author}</td>
                                            <td>${book.price}</td>
                                            <td>${book.quantity}</td>
                                            <td>
                                                <a href="editBook/${book.id}" class="btn btn-sm btn-warning">
                                                    <i class="bi bi-pencil"></i> Edit
                                                </a>
                                                <a href="deleteBook/${book.id}" class="btn btn-sm btn-danger">
                                                    <i class="bi bi-trash"></i> Delete
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/js/bootstrap.min.js"></script>
</body>
</html>
