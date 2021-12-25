<%-- 
    Document   : demo3
    Created on : 20 Oct, 2021, 11:54:45 AM
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
        <sql:setDataSource dataSource="${db}"/>
        <sql:update dataSource="${db}" var="d">
            delete from exam where id="${param.id}";
        </sql:update>
        <c:if test="${d==1}">
            <c:redirect url="/demo2.jsp"/>
        </c:if>
    </body>
</html>
