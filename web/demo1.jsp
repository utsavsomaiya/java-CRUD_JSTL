<%-- 
    Document   : demo1
    Created on : 20 Oct, 2021, 10:08:13 AM
    Author     : avani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
            Enter Name : -<input name="nm"><br><br><br>
            Select Gender :-<input type="radio" name="g1" value="Male">Male &nbsp;&nbsp;&nbsp;<input type="radio" name="g1" value="Female">Female <br><br><br>
            Select Hobby :-<input type="checkbox" name="c1" value="Singing">Singing &nbsp;&nbsp;&nbsp;<input type="checkbox" name="c1" value="Reading">Reading &nbsp;&nbsp;&nbsp;<input type="checkbox" name="c1" value="Dancing">Dancing <br><br><br>
            Select City : -
            <select name="city">
                <option value="rajkot">Rajkot</option>
                <option value="baroda">Baroda</option>
                <option value="jamnagar">Jamnagar</option>
                <option value="dwarka">Dwarka</option>
            </select><br><br>
            Enter Address : -<textarea rows="5" cols="50" name="t1"></textarea><br><br>
            Enter Contact :- <input name="n1" maxlength="10"><br><br>
            <input type="submit" value="INSERT" name="s1">&nbsp;&nbsp;
            <input type="submit" value="VIEW" name="s1">
        </form>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///test" user="root" password="" var="db" scope="application"/>
        <c:set var="h" value=""/>
        <c:if test="${param.s1.equals('INSERT')}">
            <sql:update dataSource="${db}" var="i">
                <c:forEach items="${paramValues.c1}" var="c">
                    <c:set var="h" value="${h}${c},"/> 
                </c:forEach>
                <c:if test="${fn:endsWith(h,',')}">
                    <c:set var="h1" value="${fn:substring(h,0,h.length()-1)}"/>
                </c:if>
                insert into exam(name,gender,hobby,city,address,contact) values("${param.nm}","${param.g1}","${h1}","${param.city}","${param.t1}","${param.n1}");
            </sql:update>
            <c:if test="${i==1}">
                <h3><c:out value="Record Inserted"/></h3>
            </c:if>     
        </c:if>
        <c:if test="${param.s1.equals('VIEW')}">
            <c:redirect url="/demo2.jsp"></c:redirect>
        </c:if>
    </body>
</html>
