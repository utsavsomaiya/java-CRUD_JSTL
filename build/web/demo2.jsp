<%-- 
    Document   : demo2
    Created on : 20 Oct, 2021, 11:02:59 AM
    Author     : Utsav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Hobby</th>
                <th>City</th>
                <th>Address</th>
                <th>Contact</th>
                <th></th>
                <th></th>
            </tr>
            <sql:setDataSource dataSource="${db}" var="db"/>
            <sql:query dataSource="${db}" var="s">
                select * from exam;
            </sql:query>
            <c:forEach items="${s.rows}" var="tab">
                <tr>
                    <td><c:out value="${tab.id}"/></td>
                    <td><c:out value="${tab.name}"/></td>
                    <td><c:out value="${tab.gender}"/></td>
                    <td><c:out value="${tab.hobby}"/></td>
                    <td><c:out value="${tab.city}"/></td>
                    <td><c:out value="${tab.address}"/></td>
                    <td><c:out value="${tab.contact}"/></td>
                    <td><a href="demo3.jsp?id=${tab.id}">Delete</a></td>
                    <td><a href="demo4.jsp?id=${tab.id}">Edit</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
