<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Table paintings:</title>
    <style>
        body {
            background: #ECF5FF;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            background: #4B86B4;
            color: white;
            padding: 20px;
        }

        a {
            text-decoration: none;
            color: #294C73;
            font-weight: bold;
            padding: 10px 20px;
            border: 2px solid #6D9AC5;
            border-radius: 5px;
            margin: 10px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #6D9AC5;
            color: white;
        }

        p {
            margin: 10px;
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
    <%
        String[] s = request.getParameterValues("primarykey");
        jb.connect();
        jb.stergeDateTabela(s, "painters", "idpainter");
        jb.disconnect();
    %>
    <h1>Data was deleted.</h1>
    <p align="center">
        <a href="index.html">Home</a>
        <br/>
    </p>
</body>

</html>
