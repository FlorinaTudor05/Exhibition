<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add new Exhibition</title>
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

        form {
            width: 50%;
            margin: 20px auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #294C73;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        input[type="submit"] {
            background-color: #4B86B4;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #336699;
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <%
        int idpainter, idpainting;
        String id1, id2, FirstName, LastName, Address, Name, Type, Location;
        BigDecimal Prize;
        id1 = request.getParameter("idpainter");
        id2 = request.getParameter("idpainting");
        FirstName = request.getParameter("FirstName");
        LastName = request.getParameter("LastName");
        Address = request.getParameter("Address");
        Name = request.getParameter("Name");
        Type = request.getParameter("Type");
        Location = request.getParameter("Location");
        String prizeStr = request.getParameter("Prize");
        if (prizeStr == null || prizeStr.isEmpty()) {
            Prize = BigDecimal.ZERO;
        } else {
            Prize = new BigDecimal(prizeStr);
        }
        if (id1 != null) {
            jb.connect();
            jb.adaugaCombined(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), Name, Prize);
            jb.disconnect();
    %>
    <p>The data has been added.</p><%
    } else {
    jb.connect();
    ResultSet rs1 = jb.vedeTabela("painters");
    ResultSet rs2 = jb.vedeTabela("paintings");
    %>
    <h1>We are in the Exhibition table</h1>
    <form action="new_combined.jsp" method="post">
        <table>
            <tr>
                <td><b>IdPainter:</b></td>
                <td>
                    Select the painter:
                    <select name="idpainter">
                        <%
                            while(rs1.next()){
                                idpainter = rs1.getInt("idpainter");
                                FirstName = rs1.getString("FirstName");
                                LastName = rs1.getString("LastName");
                                Address = rs1.getString("Address");
                        %>
                            <option value="<%= idpainter%>"><%= idpainter%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td><b>IdPainting:</b></td>
                <td>
                    Select painting:
                    <select name="idpainting">
                        <%
                            while(rs2.next()){
                                idpainting = rs2.getInt("idpainting");
                                Name = rs2.getString("Name");
                                Type = rs2.getString("Type");
                                Location = rs2.getString("Location");
                        %>
                            <option value="<%= idpainting%>"><%= idpainting%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
          
            <tr>
                <td><b>Name:</b></td>
                <td> <input type="text" name="Name" size="30" /></td>
            </tr>
          
            <tr>
                <td><b>Entrance Fee:</b></td>
                <td> <input type="text" name="Prize" size="30" /></td>
            </tr>
        </table>
        <input type="submit" value="Add Exhibition" />
    </form>
    <%
        }
       
        jb.disconnect();
    %>
    <br/>
    <a href="index.html"><b>Home</b></a>
    <br/>
</body>
</html>
