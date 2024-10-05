<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        /* Fullscreen background image */
        body {
            background-image: url('https://img.freepik.com/free-photo/still-life-books-versus-technology_23-2150062979.jpg?size=626&ext=jpg&ga=GA1.1.464910780.1720724193&semt=ais_hybrid'); 
            background-size: cover;
            background-position: center;
            backdrop-filter: blur(5px);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            flex-direction: column;
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

        /* Form card styling */
        .card {
            background: rgba(255, 192, 203, 0.5); /* Soft pink with 50% transparency */
            backdrop-filter: blur(5px); /* Blur the background behind the card */
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2); /* Soft shadow for the card */
            margin-top: 80px; /* Adjust margin to not overlap with the header */
        }

        .card-header h3 {
            font-weight: bold;
        }

        .text-danger {
            font-weight: bold;
        }
    </style>
</head>
<body>

    <!-- Header with blurred background -->
    <div class="header">
        Book Management
    </div>

    <!-- Register Form -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Register</h3>
                    </div>
                    <div class="card-body">
                        <span class="text-danger">
                        ${error}
                        </span>
                        
                        <form:form action="/insert" method="post" modelAttribute="userObj">
                            <div class="form-floating mb-3">
                                <form:input type="text" path="name" class="form-control" id="floatingName" placeholder="John Doe"/>
                                <form:label for="floatingName" path="name">Name</form:label>
                            </div>

                            <div class="form-floating mb-3">
  								<form:input type="email" path="email" class="form-control" id="floatingInput" placeholder="name@example.com"/>
  								<form:label for="floatingInput" path="email">Email address</form:label>
							</div>
							<div class="form-floating">
  								<form:password path="password" class="form-control" id="floatingPassword" placeholder="Password"/>
  								<form:label for="floatingPassword" path="password">Password</form:label>
							</div>

                             <button type="submit" class="btn btn-primary w-100 mt-3">Create</button>
                        </form:form>
                        	Already have an account? <a href="/SprignMVCMaven/">Login</a>
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
