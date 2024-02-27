<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        body {
            background: #ECF5FF;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        h1, p {
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
            background-color: #4B86B4;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #4B6993;
        }
    </style>
    <title>painter Table</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <h1 align="center"> painter Table:</h1>
    <br/>
    <p align="center">
        <a href="new_painters.jsp"><b>Add new painter.</b></a>
        <a href="index.html"><b>Home</b></a>
    </p>
    <form action="M1_painters.jsp" method="post">
        <table border="1" align="center">
            <tr>
                <td><b>Mark:</b></td>
                <td><b>FirstName:</b></td>
                <td><b>LastName:</b></td>
                <td><b>Address:</b></td>
            </tr>
            <%
                jb.connect();
                ResultSet rs = jb.vedeTabela("painters");
                long x;
                while (rs.next()) {
                    x = rs.getLong("idpainter");
            %>
            <tr>
                <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                <td><%= rs.getString("FirstName")%></td>
                <td><%= rs.getString("LastName")%></td>
                <td><%= rs.getString("Address")%></td>
                <%
                    }
                    rs.close();
                    jb.disconnect();
                %>
            </tr>
        </table><br/>
        <p align="center">
            <input type="submit" value="Modify line">
        </p>
    </form>
    <br/>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
        <br/>
    </p>
</body>
</html>
