<%@page import="com.mkyong.common.form.UserForm"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        #userTable {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #userTable th, #userTable td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        #userTable th {
            background-color: #f2f2f2;
        }

        button {
            margin: 5px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover, .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%
List<UserForm> list = (List<UserForm>)  request.getAttribute("listUser");
System.out.print(list.size());
%>
    <div class="container">
        <h1>User List</h1>
        <a href= "http://localhost:8080/StrutsExample/add.do"><button id="addUserBtn">Add User</button></a>
        <table id="userTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Phone Number</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <% for (UserForm i : list){ 
          %>
     		
          	<tr>
            	<td>   <%= i.getId() %></td>
                        <td><%= i.getName() %></td>
                        <td><%= i.getBirday() %> </td>
                        <td><%= i.getPhoneNumber() %> </td>
                        <td>
                            <button onclick="editUser(<%= i.getId() %>)">Edit</button>
                            <button onclick="deleteUser(<%= i.getId() %>)">Delete</button>
               </td>
            	
            </tr>
            <% } %>
                <!-- Rows will be dynamically added here -->
            </tbody>
        </table>
    </div>

    <div id="userFormModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 id="formTitle">Add User</h2>
            <form id="userForm">
                <input type="hidden" id="userId">
                <div>
                    <label for="userName">Name:</label>
                    <input type="text" id="userName" required>
                </div>
                <div>
                    <label for="userDob">Date of Birth:</label>
                    <input type="date" id="userDob" required>
                </div>
                <div>
                    <label for="userPhone">Phone Number:</label>
                    <input type="tel" id="userPhone" required>
                </div>
                <button type="submit">Save</button>
            </form>
        </div>
    </div>

    <script>
       
        function deleteUser(index){
        	console.log(index)
        	window.location.href ="http://localhost:8080/StrutsExample/delete.do?id=" + index
		}
        function editUser(index){
        	console.log(index)
        	window.location.href ="http://localhost:8080/StrutsExample/add.do?id=" + index
		}
    </script>
</body>
</html>
