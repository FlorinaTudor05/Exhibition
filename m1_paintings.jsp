<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Painting Table</title>
    <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    <style>
        body {
            background: #ECF5FF;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
        }

        p {
            text-align: center;
        }

        a {
            text-decoration: none;
            color: #294C73;
            font-weight: bold;
        }

        form {
            width: 50%;
            margin: 20px auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #294C73;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4B86B4;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #346FAB;
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>

<h1>Painting Table:</h1>
<br/>
<p><a href="new_paintings.jsp"><b>Add a new painting.</b></a> <a href="index.html"><b>Home</b></a></p>
<%
jb.connect();
int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
ResultSet rs = jb.intoarceLinieDupaId("paintings", "idpainting", aux);

rs.first();
String Name = rs.getString("Name");
String Type = rs.getString("Type");
String Location = rs.getString("Location");
String Price = rs.getString("Price");
rs.close();
jb.disconnect();
%>
<form action="m2_paintings.jsp" method="post">
    <table align="center">
        <tr>
            <td align="right">IDpainting:</td>
            <td> <input type="text" name="idpainting" size="30" value="<%= aux%>" readonly/></td>
        </tr>
        <tr>
            <td align="right">Name:</td>
            <td> <input type="text" name="Name" size="30" value="<%= Name%>"/></td>
        </tr>
        <tr>
            <td align="right">Type:</td>
            <td> <input type="text" name="Type" size="30" value="<%= Type%>"/></td>
        </tr>
        <tr>
            <td align="right">Location:</td>
            <td> <input type="text" name="Location" size="30" value="<%= Location%>"/></td>
        </tr>
        <tr>
            <td align="right">Price:</td>
            <td> <input type="text" name="Price" size="30" value="<%= Price%>"/></td>
        </tr>
    </table>
    <p align="center">
        <input type="submit" value="Modify line">
    </p>
</form>
<p align="center">
    <a href="index.html"><b>Home</b></a>
    <br/>
</p>
</body>
</html>
