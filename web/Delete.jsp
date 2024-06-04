<%-- 
    Document   : Update
    Created on : Jun 1, 2024, 11:40:39 PM
    Author     : user
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>Delete</title>
    </head>
    <body style="background-color:yellow;">
        <!--Connection-->
        
        
        <h2>Delete Student</h2>
        
         <sql:setDataSource driver="org.apache.derby.jdbc.ClientDriver" 
                           url="jdbc:derby://localhost:1527/StudentDB" 
                           user="app" 
                           password="app" 
                           var="conn"/>
         
         <c:if test="${not empty param.id}">
            
            <sql:update var="update" dataSource="${conn}">
                DELETE FROM STUDENT
                WHERE ID = ?
                <sql:param value="${param.id}"/>
            </sql:update>
            
            
        </c:if>
         
         
        <sql:query var="result" dataSource="${conn}">
                    SELECT ID FROM STUDENT
        </sql:query>
        
        <form method="post" action="">
            ID:-
            <select name="id">
                
                <c:forEach var="row" items="${result.rowsByIndex}">
                <c:forEach var="column" items="${row}">
                    <option><c:out value="${column}"/></option>
                </c:forEach>
                </c:forEach>
            </select> <br><br>
            <input type="submit" value="Delete"><br>
        </form>
                    
        <c:if test="${not empty param.id}">
            <p>Successfully Deleted!</p>
        </c:if>          
        <a href="index.html">Home</a>
    </body>
</html>
