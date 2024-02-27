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
            background-color: #294C73;
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
            background-color: #294C73;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1E3557;
        }
    </style>
    <title>Table Exhibition</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <h1 align="center">Table Exhibition</h1>
    <br/>
    <p align="center">
        <a href="new_combined.jsp"><b>Add a new Exhibition</b></a>
        <a href="index.html"><b>Home</b></a>
    </p>
    <%
        jb.connect();
        int aux = java.lang.Integer.parseInt(request.getParameter("idcombined"));
        String idpainter = request.getParameter("idpainter");
        String idpainting = request.getParameter("idpainting");
        String Name = request.getParameter("Name");
        String Prize = request.getParameter("Prize");

        String[] valori = {idpainter, idpainting, Name, Prize};
        String[] campuri = {"idpainter", "idpainting","Name","Prize"};
        jb.modificaTabela("combined", "idcombined", aux, campuri, valori);
        jb.disconnect();
    %>
    <h1 align="center">Changes have been applied!</h1>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
        <br/>
    </p>
</body>
</html>
