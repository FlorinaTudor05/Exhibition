<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Painter Table</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center"> Painter Table:</h1>
<br/>
<p align="center"><a href="new_Painters.jsp"><b>Add new Painter.</b></a> <a href="index.html"><b>Home</b></a></p>
<%
jb.connect();
int aux = java.lang.Integer.parseInt(request.getParameter("idpainter"));
String IdPainting = request.getParameter("IdPainting");
String FirstName = request.getParameter("FirstName");
String LastName = request.getParameter("LastName");
String Address = request.getParameter("Address");
String[] valori = {FirstName, LastName, Address};
String[] campuri = {"FirstName", "LastName", "Address"};
jb.modificaTabela("painters", "idpainter", aux, campuri, valori);
jb.disconnect();
%>
<h1 align="center">Modifications were done !</h1>
<p align="center">
<a href="index.html"><b>Home</b></a>
<br/>
</body>
</html>