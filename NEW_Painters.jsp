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

        table tr,
        table td {
            padding: 10px;
        }

        input[type="submit"] {
            background-color: #4B86B4;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        .home-link {
            text-decoration: none;
            color: white;
            background-color: #4B86B4;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 10px;
            display: inline-block;
        }

        .home-link:hover {
            background-color: #294C73;
        }
    </style>
    <title>Add Painter:</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
    <%
        String FirstName = request.getParameter("FirstName");
        String LastName = request.getParameter("LastName");
        String Address = request.getParameter("Address");
        if (FirstName != null) {
            jb.connect();
            jb.adaugapainter(FirstName, LastName, Address);
            jb.disconnect();
    %>
    <header>
        Data was added.
    </header><%
    } else {
    %>
    <header>
        We are in the Painter table.
    </header>
    <nav>
        <a href="NEW_Painters.jsp">Add new painter</a>
        <a href="index.html" class="home-link">Home</a>
    </nav>
    <section>
        <form action="NEW_Painters.jsp" method="post">
            <table>
                <tr>
                    <td align="right">First Painter Name:</td>
                    <td> <input type="text" name="FirstName" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Last Painter Name:</td>
                    <td> <input type="text" name="LastName" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Address:</td>
                    <td> <input type="text" name="Address" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Add Painter" />
        </form>
    </section>
    <footer>
        &copy; 2024 Art Gallery
    </footer>
    <%
    }
    %>
</body>

</html>
