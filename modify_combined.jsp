<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Table Exhibition</title>
    <style>
        body {
            background: #D4E4F7; /* Light Blue */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1, p {
            margin: 20px 0;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #4285F4; /* Dark Blue */
            color: white;
        }

        input[type="submit"] {
            background-color: #4285F4; /* Dark Blue */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2B5797; /* Slightly Darker Blue */
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
    <h1 align="center"> Table Exhibition</h1>
    <br/>
    <p align="center"><a href="new_combined.jsp"><b>Add a new Exhibition</b></a> <a href="index.html"><b>Home</b></a></p>
    <form action="m1_combined.jsp" method="post">
        <table border="1" align="center">
            <tr>
                <th><b>Mark:</b></th>
                <th><b>IdExhibition:</b></th>
                <th><b>IdPainter:</b></th>
                <th><b>IdPainting:</b></th>
                <th><b>FirstName:</b></th>
                <th><b>LastName:</b></th>
                <th><b>Address:</b></th>
                <th><b>Name:</b></th>
                <th><b>Type:</b></th>
                <th><b>Location:</b></th>
                <th><b>Name:</b></th>
                <th><b>Entrance Fee:</b></th>
            </tr>
            <%
                jb.connect();
                ResultSet rs = jb.vedeCombined();
                long x;
                while (rs.next()) {
                    x = rs.getLong("idcombined");
            %>
            <tr>
                <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                <td><%= x%></td>
                <td><%= rs.getInt("idpainter_combined")%></td>
                <td><%= rs.getInt("idpainter_combined")%></td>
                <td><%= rs.getString("PainterFirstName")%></td>
                <td><%= rs.getString("PainterLastName")%></td>
                <td><%= rs.getString("PainterAddress")%></td>
                <td><%= rs.getString("PaintingName")%></td>
                <td><%= rs.getString("PaintingType")%></td>
                <td><%= rs.getString("PaintingLocation")%></td>
                <td><%= rs.getString("CombinedName")%></td>
                <td><%= rs.getBigDecimal("CombinedPrize")%></td>
            </tr>
            <%
                }
            %>
        </table><br/>
        <p align="center">
            <input type="submit" value="Modify the line.">
        </p>
    </form>
    <%
jb.disconnect();%>
    <br/>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
        <br/>
    </p>
</body>

</html>
