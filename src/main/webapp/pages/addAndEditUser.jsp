<%@page import="com.mkyong.common.form.UserForm"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="date"], input[type="tel"] {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #333;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<% UserForm user = (UserForm) request.getAttribute("user"); %>
    <div class="container">
        <h1>Add User</h1>
        <form action="addAndEditUser.do" method="post">
                    <input type="hidden" id="userId" value="<%= user.getId() %>" name="id">
        
            <div>
                <label for="userName">Name:</label>
                <input type="text" id="userName" value="<%= user.getName() %>" name="name" required>
            </div>
            <div>
                <label for="userDob">Date of Birth:</label>
                <input type="text" id="userDob" value="<%= user.getBirday() %>" name="dob" required>
            </div>
            <div>
                <label for="userPhone">Phone Number:</label>
                <input type="tel" id="userPhone" name="phone" value="<%= user.getPhoneNumber() %>" required>
            </div>
            <button type="submit">Add User</button>
        </form>
        <div class="back-link">
            <a href="userList.jsp">Back to User List</a>
        </div>
    </div>
</body>
</html>
