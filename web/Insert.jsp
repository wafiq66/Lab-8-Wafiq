<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Insert
    Created on : May 31, 2024, 10:36:42 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!--CONNECTION SECTION-THIS SECTION MUST EXIST TO CONNECT THE DATABASE. ALSO USE TO CHECK THE CONNECTION-->
<% //Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%
                                                    //database url,username,password
    /*Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentDB","app","app");
    String message; 
    if (conn != null && !conn.isClosed()) {
            message = "Connection to the database was successful!";
        } else {
            message = "Failed to connect to the database.";
        }*/
%>
<!--SECTION FINISH HERE-->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
    </head>
    <h2>Register Student</h2>
    <body style="background-color:yellow;">
        
        <sql:setDataSource driver="org.apache.derby.jdbc.ClientDriver" 
                           url="jdbc:derby://localhost:1527/StudentDB" 
                           user="app" 
                           password="app" 
                           var="conn"/>
        <c:if test="${not empty conn}">
            <p>Connection Successful</p>
        </c:if>
         
        
        <form method="post" action="">
            ID:-<input type="text" name="id" required><br><br>
            NAME:-<input type="text" name="name" required><br><br>
            BRANCH:-<input type="text" name="branch" required> <br><br>
            <input type="submit"><br>
        </form>
            <!--To Make Sure All Form Are Filled-->
        <c:if test="${not empty param.name && not empty param.id && not empty param.branch}">
            
            <sql:update dataSource="${conn}">
                INSERT INTO STUDENT (ID, NAME,BRANCH)
                VALUES (?,?,?)
                <sql:param value="${param.id}" />
                <sql:param value="${param.name}" />
                <sql:param value="${param.branch}" />
            </sql:update>    
             <p>Student has successfully registered.</p>
<!--SQL STATEMENT SECTION-->
<%
    /*String id = request.getParameter("id"); //to read value inside form
    String name = request.getParameter("name"); //to read value inside form
    String branch = request.getParameter("branch"); //to read value inside form
    PreparedStatement preparedStatement = null;
    String sqlLine = "INSERT INTO STUDENT (ID,NAME,BRANCH) VALUES (?,?,?)";
    preparedStatement = conn.prepareStatement(sqlLine);
    preparedStatement.setString(1,id);
    preparedStatement.setString(2,name);
    preparedStatement.setString(3,branch);
    
    int rowsInserted = preparedStatement.executeUpdate(); //line of code to insert the data

            if (rowsInserted > 0) {
                message = "Data successfully inserted!";
            } else {
                message = "Data insertion failed!";
            }*/
    
%>
<!--SECTION END HERE-->
   
        </c:if>
<a href="index.html">Home</a>
    </body>
</html>
