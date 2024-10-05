<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Custom Styles -->
    <style>
        /* Background with dark overlay */
        body {
            background: url('https://img.freepik.com/free-photo/still-life-books-versus-technology_23-2150062979.jpg?size=626&ext=jpg&ga=GA1.1.464910780.1720724193&semt=ais_hybrid') no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: blur(5px); /* Apply a blur to the background image */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
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

        /* Dark semi-transparent overlay for the form */
        .card {
            background: rgba(255, 192, 203, 0.5); /* Soft pink with 50% transparency */
            color: white; /* White text color */
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
            padding: 20px;
        }

        /* Blurred and highlighted card header */
        .card-header {
            background: rgba(255, 255, 255, 0.1); /* Semi-transparent white for blur effect */
            color: white;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            border-radius: 10px;
            backdrop-filter: blur(5px); /* Blur effect */
        }

        /* Form input fields */
        .form-control {
            background: rgba(255, 255, 255, 0.8); /* Light transparent background for inputs */
            color: black;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 1); /* Solid background when focused */
        }

        /* Button styling */
        .btn-primary {
            background-color: #0d6efd;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0b5ed7;
        }

        /* Error text styling */
        .text-danger {
            margin-bottom: 10px;
            display: block;
        }
        
    </style>
</head>
<body>

	<!-- Header with blurred background -->
    <div class="header">
        Book Management
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Edit Book
                    </div>
                    <div class="card-body">
                        <!-- Error Display -->
                        <span class="text-danger">
                            ${error}
                        </span>
                        
                        <!-- Edit Book Form -->
                        <form:form modelAttribute="obj" action="${pageContext.request.contextPath}/book/editBook" method="post">

                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="floatingId" placeholder="Id" path="id" readonly="readonly"/>
                                <form:label for="floatingId" path="id">Id</form:label>
                            </div>
                            <div class="form-floating mb-3">
                                 <form:input type="text" class="form-control" id="floatingTitle" placeholder="Title" path="title" required="required" />
                                <form:label for="floatingTitle" path="title">Title</form:label>
                            </div>
                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="floatingAuthor" placeholder="Author" path="author" value="${obj.author}" required="required" />
                                <form:label for="floatingAuthor" path="author">Author</form:label>
                            </div>
                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="floatingPrice" placeholder="Price" path="price" value="${obj.price}" required="required" />
                                <form:label for="floatingPrice" path="price">Price</form:label>
                            </div>
                             <div class="form-floating mb-3">
                                <form:input type="number" class="form-control" id="floatingPrice" placeholder="Quantity" path="quantity" value="${obj.quantity}" required="required" />
                                <form:label for="floatingPrice" path="quantity">Quantity</form:label>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 mt-3">Update</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
