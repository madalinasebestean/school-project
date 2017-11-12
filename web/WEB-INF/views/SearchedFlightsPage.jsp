<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="employee" type="org.springframework.remoting.jaxws.JaxWsPortClientInterceptor"--%>
<%--
  Created by IntelliJ IDEA.
  User: msebestean
  Date: 27.06.2017
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <style>
        #header_list {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
            position: fixed;
            top: 0;
            width: 100%;
        }

        #content{
            margin-top: 50px;
        }

        .active {
            background-color: #4CAF50;
        }

        .out_buy{
            background-color: #d360f7;
        }

        .out_rent{
            background-color: #f4f760;
        }

        .out_full{
            background-color: #f4424b;
        }

        .ok_stock{
            background-color: #4CAF50;
        }


        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover:not(.active) {
            background-color: #111;
        }

        .active {
            background-color: #4CAF50;
        }
        #header_list {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
            position: fixed;
            top: 0;
            width: 100%;
        }

        #content{
            margin-top: 50px;
        }

        .active {
            background-color: #4CAF50;
        }

        .out_buy{
            background-color: #d360f7;
        }

        .out_rent{
            background-color: #f4f760;
        }

        .out_full{
            background-color: #f4424b;
        }

        .ok_stock{
            background-color: #4CAF50;
        }


        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover:not(.active) {
            background-color: #111;
        }

        .active {
            background-color: #4CAF50;
        }
    </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<ul id="header_list">
    <li><a href="/client/book">Book</a></li>
    <li><a href="/client/orders">Orders</a></li>
    <li><a href='' onclick="this.href='/client/profile/'+loggedIn.value">Profile</a></li>
    <input hidden="true" type="text" id="loggedIn" name="loggedIn" />

    <li>
        <form action="/" >
            <button class="btn" onclick="clearUser()" type="Submit">Logout</button>
        </form>
    </li>
</ul>

<script>
    document.getElementById('loggedIn').value = localStorage.getItem("username");
</script>

<script>
    function clearUser(){
        localStorage.clear();
    }
</script>


<div id="content">
    <div id="books_div">
        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-10">
                    <br>
                    <div>
                        <h2>Flights</h2>
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th>From</th>
                                <th>To</th>
                                <th>Leaving time</th>
                                <th>Arriving time</th>
                                <th>Price</th>
                                <th>Persons</th>
                                <th>Luggages</th>
                                <th>Book</th>
                            </tr>
                            </thead>
                            <tbody>
                            <div class="container-fluid">
                                <c:forEach var="flight" items="${flightsList}">
                                    <tr>
                                        <td>${flight.placeFrom}</td>
                                        <td>${flight.placeTo }</td>
                                        <td>${flight.dateFrom }</td>
                                        <td>${flight.dateTo }</td>
                                        <td>${flight.price }</td>
                                        <td><input type="text" id="numberOfSeats" name="numberOfSeats"/></td>
                                        <td><input type="text" id="numberOfLuggages" name="numberOfLuggages"/></td>
                                        <div class="btn-group btn-group-sm">
                                            <td>
                                                <a href='' onclick="this.href='order/${flight.id}/seats/'+numberOfSeats.value
                                                        +'/luggages/'+numberOfLuggages.value+'/from/'+loggedIn.value">
                                                    <span class="glyphicon glyphicon-pencil"></span>
                                                </a>
                                            </td>
                                        </div>
                                    </tr>
                                </c:forEach>
                            </div>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- First include jquery js -->
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- Then include bootstrap js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

</body>
</html>
