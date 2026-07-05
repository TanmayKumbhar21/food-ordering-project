<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('images/rimg3.jpg') no-repeat center center/cover;
        }

        .container {
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            text-align: center;
            width: 350px;
            color: white;
        }

        .container h2 {
            margin-bottom: 15px;
        }

        .container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }

        .container button {
            width: 100%;
            padding: 10px;
            background: #ff5733;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .container button:hover {
            background: #e64a19;
        }

        .toggle-btn {
            background: none;
            border: none;
            color: white;
            font-size: 14px;
            cursor: pointer;
            margin-top: 10px;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
       <form action="LoginServlet" method="post">
    <h2>Login</h2>
    <input type="email" name="email" placeholder="Enter Email" required><br>
    <input type="password" name="password" placeholder="Enter Password" required><br>
    <button type="submit">Login</button>
</form>
<p>New user? <a href="register.jsp">Register</a></p>

        <button class="toggle-btn" onclick="window.location.href='register.jsp'">Register</button>
    </div>
</body>
</html>
