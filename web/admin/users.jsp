<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users Management</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        table { width: 80%; margin: 20px auto; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid black; }
        th { background: #ff5733; color: white; }
        td { background: #f9f9f9; }
    </style>
</head>
<body>
    <h2>Users Management</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Email</th>
        </tr>
        <%
            ArrayList<String[]> users = (ArrayList<String[]>) request.getAttribute("userList");
            if (users != null) {
                for (String[] user : users) {
        %>
        <tr>
            <td><%= user[0] %></td>
            <td><%= user[1] %></td>
            <td><%= user[2] %></td>
            <td><%= user[3] %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="4">No users found</td></tr>
        <% } %>
    </table>
</body>
</html>
