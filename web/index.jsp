<%--
  Created by IntelliJ IDEA.
  User: msebestean
  Date: 22.06.2017
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>

    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);
        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }
        .form {
            position: relative;
            z-index: 2;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        error {
            color: #ff0000;
            font-style: italic;
            font-weight: bold;
        }
        input{
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }
        button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #337ab7;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }
        button:hover,button:active,button:focus {
            background: #265a88;
        }
        message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }
        message a {
            color: #4CAF50;
            text-decoration: none;
        }
        .container {
            position: relative;
            z-index: 2;
            max-width: 300px;
            margin: 0 auto;
        }
        .container:before, .container:after {
            content: "";
            display: block;
            clear: both;
        }
        .container .info {
            margin: 50px auto;
            text-align: center;
        }
        h1 {
            margin: 0 0 15px;
            padding: 0;
            font-size: 36px;
            font-weight: 300;
            color: #1a1a1a;
        }
        span {
            color: #4d4d4d;
            font-size: 12px;
        }
        span a {
            color: #000000;
            text-decoration: none;
        }
        body {
            background: 	#00BFFF; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #1E90FF, 	#00BFFF);
            background: -moz-linear-gradient(right, #1E90FF,	#00BFFF);
            background: -o-linear-gradient(right, #1E90FF, 	#00BFFF);
            background: linear-gradient(to left, #1E90FF, 	#00BFFF);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        #footer{
            z-index: 3;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>

</head>
<body>
<div class="login-page">
    <div class="form">
        <form method="POST" modelAttribute="" action="LoginServlet">
            <h1>Login info</h1>
            <input type="text" id="username" name="username" placeholder="username"/>
            <label errors="*{username}" class="error"></label>
            <input type="password" name="password" placeholder="password"/>
            <%--<button onclick="save()">login</button>--%>
            <input type="submit" value="login">
        </form>
    </div>
</div>
<script>
    function save() {
        localStorage.setItem("username", document.getElementById('username').value);
    }
</script>
<div id="footer">
    <p class="message">Errors: <span style="color:red">${error}</span></p>
    <p class="message">Message: <span style="color:green">${message}</span></p>
</div>
</body>
</html>