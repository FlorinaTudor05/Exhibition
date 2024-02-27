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

            footer {
                background: #4B86B4;
                padding: 10px;
                text-align: center;
                color: white;
            }

            form {
                width: 50%;
                margin: 20px auto;
            }

            table {
                width: 100%;
            }

            table tr, table td {
                padding: 10px;
            }

            input[type="submit"] {
                background-color: #4B86B4;
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
            }
        </style>
        <title>Painting Table</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>

        <header>
            Painting Table
        </header>

        <nav>
            <a href="new_paintings.jsp">Add a new painting</a>
            <a href="index.html">Home</a>
        </nav>

        <section>
            <form action="m1_paintings.jsp" method="post">
                <table border="1" align="center">
                    <tr>
                        <td><b>Select:</b></td>
                        <td><b>Idpainting:</b></td>
                        <td><b>Name:</b></td>
                        <td><b>Type:</b></td>
                        <td><b>Location:</b></td>
                        <td><b>Price:</b></td>
                    </tr>
                    <%
                        jb.connect();
                        ResultSet rs = jb.vedeTabela("paintings");
                        long x;
                        while (rs.next()) {
                            x = rs.getInt("idpainting");
                    %>
                    <tr>
                        <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                        <td><%= x%></td>
                        <td><%= rs.getString("Name")%></td>
                        <td><%= rs.getString("Type")%></td>
                        <td><%= rs.getString("Location")%></td>
                        <td><%= rs.getString("Price")%></td>
                        <%
                            }
                        %>
                    </tr>
                </table><br/>
                <p align="center">
                    <input type="submit" value="Modify line">
                </p>
            </form>
        </section>

        <footer>
            &copy; 2023 Art Gallery
        </footer>

    </body>
</html>
