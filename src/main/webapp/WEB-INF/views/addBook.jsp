<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Custom Styles -->
    <style>
        /* Background styling */
        body {
            background: url('https://img.freepik.com/free-photo/still-life-books-versus-technology_23-2150062979.jpg?size=626&ext=jpg&ga=GA1.1.464910780.1720724193&semt=ais_hybrid') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            backdrop-filter: blur(5px); /* Apply blur to the background */
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

        /* Semi-transparent card styling */
        .card {
            background: rgba(255, 192, 203, 0.5); /* Soft pink with 50% transparency */
            color: black;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px); /* Extra blur for card */
        }

        /* Title styling */
        .card-header {
            background: rgba(255, 255, 255, 0.4); /* Semi-transparent white for blur effect */
            color: white;
            border-radius: 15px 15px 0 0; /* Rounded corners on top */
        }

        .card-header h3 {
            margin: 0;
            font-size: 1.5rem;
        }

        /* Button styling */
        .btn-primary {
            border-radius: 25px;
        }
    </style>
</head>
<body>

	<!-- Header with blurred background -->
    <div class="header">
        Book Management
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Add Book</h3>
                    </div>
                    <div class="card-body">
                        <form:form  modelAttribute="bean" action="/SprignMVCMaven/book/addBook" method="post">
                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="floatingTitle" placeholder="Enter Book Title...." path="title" required="required" />
                                <form:label for="floatingTitle" path="title">Title</form:label>
                                <form:errors path="title" cssClass="error"></form:errors>
                            </div>
                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="floatingAuthor" placeholder="Author" path="author" required="required" />
                                <form:label for="floatingAuthor" path="author">Author</form:label>
                            </div>
                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="floatingPrice" placeholder="Price" path="price" required="required" />
                                <form:label for="floatingPrice" path="price">Price</form:label>
                            </div>
                             <div class="form-floating mb-3">
                                <form:input type="number" class="form-control" id="floatingPrice" placeholder="Quantity" path="quantity" required="required" />
                                <form:label for="floatingPrice" path="quantity">Qty</form:label>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 mt-3">Add</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/js/bootstrap.min.js"></script>
</body>
</html>
