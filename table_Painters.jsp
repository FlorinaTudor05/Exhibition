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

        header {
            background: #4B86B4;
            padding: 20px;
            text-align: center;
            color: white;
            font-size: 24px;
        }

        nav {
            background: #6D9AC5;
            padding: 10px;
            text-align: center;
        }

        nav a {
            text-decoration: none;
            color: #294C73;
            margin: 0 15px;
            font-size: 18px;
        }

        section {
            padding: 20px;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #6D9AC5;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4B86B4;
            color: white;
        }

        input[type="submit"] {
            background-color: #4B86B4;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="checkbox"] {
            transform: scale(1.5);
        }

        footer {
            background: #4B86B4;
            padding: 10px;
            text-align: center;
            color: white;
        }
    </style>
    <title>Painter Table</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>

    <header>
        Painter Table
    </header>

    <nav>
        <a href="NEW_Painters.jsp">Add new Painter</a>
        <a href="index.html">Home</a>
    </nav>

    <section>
        <form action="delete_Painters.jsp" method="post">
            <table>
                <tr>
                    <th>Select</th>
                    <th>IdPainter</th>
                    <th>FirstName</th>
                    <th>LastName</th>
                    <th>Address</th>
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
            </table>
            <p align="center">
                <input type="submit" value="Delete marked lines">
            </p>
        </form>
    </section>

    <footer>
        &copy; 2024 Art Gallery
    </footer>

</body>
</html>
