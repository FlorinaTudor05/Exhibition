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
    <title>Exhibition Table:</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <%
        String[] s = request.getParameterValues("primarykey");
        jb.connect();
        jb.stergeDateTabela(s, "combined", "idcombined");
        jb.disconnect();
    %>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
        <br/>
    </p>
</body>
</html>
