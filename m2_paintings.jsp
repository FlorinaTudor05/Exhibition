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

        p {
            margin-top: 20px;
        }
    </style>
    <title>Painting Table</title>
    <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <h1 align="center"> Painting Table:</h1>
    <br/>
    <p align="center">
        <a href="new_paintings.jsp"><b>Add a new painting.</b></a>
        <a href="index.html"><b>Home</b></a>
    </p>
    <%
        jb.connect();
        int aux = java.lang.Integer.parseInt(request.getParameter("idpainting"));
        String Name = request.getParameter("Name");
        String Type = request.getParameter("Type");
        String Location = request.getParameter("Location");
        String Price = request.getParameter("Price");
        String[] valori = {Name, Type, Location, Price};
        String[] campuri = {"Name", "Type", "Location", "Price"};
        jb.modificaTabela("paintings", "idpainting", aux, campuri, valori);
        jb.disconnect();
    %>
    <h1 align="center">Modifications were done!</h1>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
    </p>
</body>
</html>
