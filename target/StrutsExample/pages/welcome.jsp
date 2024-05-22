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
%>
    <div class="container">
        <h1>User List</h1>
        <button id="addUserBtn">Add User</button>
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
            <% for (UserForm i : list){ %>
            	<td><%= i.getId() %></td>
                        <td><%= i.getName() %></td>
                        <td><%= i.getBirday() %> </td>
                        <td><%= i.getPhoneNumber() %> </td>
                        <td>
                            <button onclick="editUser(<%= i.getId() %>)">Edit</button>
                            <button onclick="deleteUser(<%= i.getId() %>)">Delete</button>
               </td>
            	
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
        document.addEventListener('DOMContentLoaded', () => {
            const userTableBody = document.querySelector('#userTable tbody');
            const addUserBtn = document.getElementById('addUserBtn');
            const userFormModal = document.getElementById('userFormModal');
            const closeBtn = document.querySelector('.close');
            const userForm = document.getElementById('userForm');
            const formTitle = document.getElementById('formTitle');
            const userIdInput = document.getElementById('userId');
            const userNameInput = document.getElementById('userName');
            const userDobInput = document.getElementById('userDob');
            const userPhoneInput = document.getElementById('userPhone');

            let users = [];
            let editingUserId = null;

            function renderUserTable() {
                userTableBody.innerHTML = '';
                users.forEach((user, index) => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        
                    `;
                    userTableBody.appendChild(row);
                });
            }

            function openModal() {
                userFormModal.style.display = 'block';
            }

            function closeModal() {
                userFormModal.style.display = 'none';
            }

            addUserBtn.addEventListener('click', () => {
                editingUserId = null;
                formTitle.textContent = 'Add User';
                userForm.reset();
                openModal();
            });

            closeBtn.addEventListener('click', closeModal);

            window.onclick = function(event) {
                if (event.target == userFormModal) {
                    closeModal();
                }
            }

            userForm.addEventListener('submit', (event) => {
                event.preventDefault();
                const userName = userNameInput.value;
                const userDob = userDobInput.value;
                const userPhone = userPhoneInput.value;

                if (editingUserId !== null) {
                    users[editingUserId] = { name: userName, dob: userDob, phone: userPhone };
                } else {
                    users.push({ name: userName, dob: userDob, phone: userPhone });
                }

                renderUserTable();
                closeModal();
            });

            window.editUser = function(index) {
                editingUserId = index;
                formTitle.textContent = 'Edit User';
                userIdInput.value = index + 1;
                userNameInput.value = users[index].name;
                userDobInput.value = users[index].dob;
                userPhoneInput.value = users[index].phone;
                openModal();
            };

            window.deleteUser = function(index) {
                users.splice(index, 1);
                renderUserTable();
            };

            renderUserTable();
        });
    </script>
</body>
</html>
