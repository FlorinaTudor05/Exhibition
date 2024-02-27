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
        <title>Add Painting</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>

        <header>
            Add Painting
        </header>

        <nav>
            <a href="new_paintings.jsp">Add new painting</a>
            <a href="index.html">Home</a>
        </nav>

        <section>
            <%
                String Name = request.getParameter("Name");
                String Type = request.getParameter("Type");
                String Location = request.getParameter("Location");
                String Price = request.getParameter("Price");

                if (Name != null) {
                    jb.connect();
                    jb.adaugapaintings(Name, Type, Location, Price);
                    jb.disconnect();
            %>
            <p>Data was added.</p>
            <%
                } else {
            %>
            <h1>We are in the Painting Table.</h1>
            <form action="new_paintings.jsp" method="post">
                <table>
                    <tr>
                        <td align="right">Painting Name:</td>
                        <td> <input type="text" name="Name" size="40" /></td>
                    </tr>
                    <tr>
                        <td align="right">Painting Type:</td>
                        <td> <input type="text" name="Type" size="30" /></td>
                    </tr>
                    <tr>
                        <td align="right">Location:</td>
                        <td> <input type="text" name="Location" size="30" /></td>
                    </tr>
                    <tr>
                        <td align="right">Price: $</td>
                        <td> <input type="text" name="Price" size="30" /></td>
                    </tr>
                </table>
                <input type="submit" value="Add Painting" />
            </form>
            <%
                }
            %>
        </section>

        <footer>
            &copy; 2024 Art Gallery
        </footer>

    </body>
</html>
