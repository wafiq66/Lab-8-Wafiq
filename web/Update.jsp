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
        <title>Update</title>
    </head>
    <body style="background-color:yellow;">
        <!--Connection-->
        <sql:setDataSource driver="org.apache.derby.jdbc.ClientDriver" 
                           url="jdbc:derby://localhost:1527/StudentDB" 
                           user="app" 
                           password="app" 
                           var="conn"/>
        
        <h2>Update Student</h2>
        
        <form method="post" action="">
            ID:-
            <select name="id">
                <sql:query var="result" dataSource="${conn}">
                    SELECT ID FROM STUDENT
                </sql:query>
                <c:forEach var="row" items="${result.rowsByIndex}">
                <c:forEach var="column" items="${row}">
                    <option><c:out value="${column}"/></option>
                </c:forEach>
                </c:forEach>
            </select> <br><br>
            NAME:-<input type="text" name="name" ><br><br>
            BRANCH:-<input type="text" name="branch" > <br><br>
            <input type="submit"><br>
        </form>
        <c:if test="${not empty param.name || not empty param.branch}">
            <c:if test="${not empty param.name}">
            <sql:update var="update" dataSource="${conn}">
                UPDATE STUDENT
                SET NAME = ?
                WHERE ID = ?
                <sql:param value="${param.name}"/>
                <sql:param value="${param.id}"/>
            </sql:update>
            </c:if>
            <c:if test="${not empty param.branch}">
            <sql:update var="update" dataSource="${conn}">
                UPDATE STUDENT
                SET BRANCH = ?
                WHERE ID = ?
                <sql:param value="${param.branch}"/>
                <sql:param value="${param.id}"/>
            </sql:update>
            </c:if>
            <br><p>Successfully Updated!</p>
        </c:if>
        <a href="index.html">Home</a>
    </body>
</html>
