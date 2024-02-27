<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        body {
            background: #ECF5FF; /* Change this to a pale blue color */
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
            width: 60%;
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
            background-color: #FF4D4D;
            color: white;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
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
    <title>Table Exhibition</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <h1 align="center">Table Exhibition:</h1>
    <br/>
    <p align="center"><a href="new_Combine.jsp"><b>Add a new Exhibition</b></a> <a href="index.html"><b>Home</b></a></p>
    <%
        jb.connect();
        int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
        ResultSet rs = jb.intoarceCombinedId(aux);
        rs.first();
        int idPainter = rs.getInt("idpainter_combined");
        int idPainting = rs.getInt("idpainting_combined");
        String FirstName = rs.getString("PainterFirstName");
        String LastName = rs.getString("PainterLastName");
        String Address = rs.getString("PainterAddress");
        String Name = rs.getString("PaintingName");
        String Type = rs.getString("PaintingType");
        String Location = rs.getString("PaintingLocation");
        String CombinedName = rs.getString("CombinedName");
        BigDecimal Prize = rs.getBigDecimal("CombinedPrize");
        rs.close();
        jb.disconnect();
    %>
    <form action="m2_combined.jsp" method="post">
        <table align="center">
            <tr>
                <td align="right">IdExhibition:</td>
                <td> <input type="text" name="idcombined" size="30" value="<%= aux%>" readonly/></td>
            </tr>
            <tr>
                <td align="right">IdPainter:</td>
                <td> <input type="text" name="idpainter" size="30" value="<%= idPainter%>"/></td>
            </tr>
            <tr>
                <td align="right">IdPainting:</td>
                <td> <input type="text" name="idpainting" size="30" value="<%= idPainting%>"/></td>
            </tr>
            <tr>
                <td align="right">FirstName:</td>
                <td> <input type="text" name="FirstName" size="30" value="<%= FirstName%>"/></td>
            </tr>
            <tr>
                <td align="right">LastName:</td>
                <td> <input type="text" name="LastName" size="30" value="<%= LastName%>"/></td>
            </tr>
            <tr>
                <td align="right">Address:</td>
                <td> <input type="text" name="Address" size="30" value="<%= Address%>"/></td>
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
                <td align="right">Name:</td>
                <td> <input type="text" name="Name" size="30" value="<%= Name%>"/></td>
            </tr>
            <tr>
                <td align="right">Entrance Fee:</td>
                <td> <input type="text" name="Prize" size="30" value="<%= Prize%>"/></td>
            </tr>
        </table>
        <p align="center">
            <input type="submit" value="Modify the line.">
        </p>
    </form>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
        <br/>
    </p>
</body>
<%
    jb.disconnect();
%>
</html>
