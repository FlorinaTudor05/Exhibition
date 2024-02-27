<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Painter Table</title>
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

        input[type="checkbox"] {
            margin: 0;
        }

        input[type="submit"] {
            background-color: #FF4D4D;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #FF3333;
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <h1>Painter Table:</h1>
    <br/>
    <p><a href="NEW_Painters.jsp"><b>Add new Painter</b></a> <a href="index.html"><b>Home</b></a></p>
    <form action="delete_Painters.jsp" method="post">
        <table align="center">
            <tr>
                <td><b>Select:</b></td>
                <td><b>IdPainter:</b></td>
                <td><b>FirstName:</b></td>
                <td><b>LastName:</b></td>
                <td><b>Address:</b></td>
            </tr>
            <% jb.connect();
                ResultSet rs = jb.vedeTabela("painters");
                long x;
                while (rs.next()) {
                    x = rs.getInt("idpainter");
            %>
            <tr>
                <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                <td><%= x%></td>
                <td><%= rs.getString("FirstName")%></td>
                <td><%= rs.getString("LastName")%></td>
                <td><%= rs.getString("Address")%></td>
            </tr>
            <%
                }
                rs.close();
                jb.disconnect();
            %>
        </table><br/>
        <p align="center">
            <input type="submit" value="Delete marked lines">
        </p>
    </form>
    <br/>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
        <br/>
    </p>
</body>
</html>
