<%-- 
    Document   : demo4
    Created on : 20 Oct, 2021, 12:24:44 PM
    Author     : Utsav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${param.name!=null}">
            <sql:update dataSource="${db}">
                <c:forEach items="${paramValues.c1}" var="c">
                    <c:set var="h" value="${h}${c},"/> 
                </c:forEach>
                <c:if test="${fn:endsWith(h,',')}">
                    <c:set var="h1" value="${fn:substring(h,0,h.length()-1)}"/>
                </c:if>
                update  exam set name='${param.name}',gender='${param.g1}',hobby='${h1}',city='${param.city}',address='${param.address}',contact='${param.contact}' where id=${param.id};
            </sql:update>
            <c:redirect url="/demo2.jsp"></c:redirect>
        </c:if>
        <sql:query dataSource="${db}" var="info">
            select * from exam where id=${param.id};
        </sql:query>
           <form action="" method="post">
               <input type='hidden' value="${info.rows[0].id}" name="id">
               Enter Name :-<input name="name" value="${info.rows[0].name}"><br><br>
               <c:if test="${info.rows[0].gender.equals('Male')}">
                   <c:set var="m" value="checked"/>
               </c:if>
               <c:if test="${info.rows[0].gender.equals('Female')}">
                   <c:set var="f" value="checked"/>
               </c:if>
               Select Gender :- <input type="radio" name="g1" value="Male" <c:out value="${m}"/>>Male &nbsp;&nbsp;&nbsp;<input type="radio" name="g1" value="Female" <c:out value="${f}"/>>Female <br><br><br>
               <c:set var="h" value="${fn:split(info.rows[0].hobby,',')}"/>
               <c:forEach items="${h}" var="h1">
                   <c:if test="${h1.equals('Dancing')}">
                       <c:set value="checked" var="d"/>
                   </c:if>
                   <c:if test="${h1.equals('Singing')}">
                       <c:set value="checked" var="s"/>
                   </c:if>
                   <c:if test="${h1.equals('Reading')}">
                       <c:set value="checked" var="r"/>
                   </c:if>
               </c:forEach>
               Select Hobby :- <input type="checkbox" name="c1" value="Singing" <c:out value="${s}"/>>Singing &nbsp;&nbsp;&nbsp;<input type="checkbox" name="c1" value="Reading" <c:out value="${r}"/>>Reading &nbsp;&nbsp;&nbsp;<input type="checkbox" name="c1" value="Dancing" <c:out value="${d}"/>>Dancing <br><br><br>
               <c:if test="${info.rows[0].city.equals('rajkot')}">
                   <c:set var="r" value="selected"/>
               </c:if>
               <c:if test="${info.rows[0].city.equals('baroda')}">
                   <c:set var="b" value="selected"/>
               </c:if>
               <c:if test="${info.rows[0].city.equals('jamnagar')}">
                   <c:set var="j" value="selected"/>
               </c:if>
               <c:if test="${info.rows[0].city.equals('dwarka')}">
                   <c:set var="d" value="selected"/>
               </c:if>
               Select City : -
            <select name="city">
                <option value="rajkot" <c:out value="${r}"/>>Rajkot</option>
                <option value="baroda" <c:out value="${b}"/>>Baroda</option>
                <option value="jamnagar" <c:out value="${j}"/>>Jamnagar</option>
                <option value="dwarka" <c:out value="${d}"/>>Dwarka</option>
            </select><br><br>
               Enter Address : -<textarea rows="5" cols="50" name="address">${info.rows[0].address}</textarea><br><br>
               Enter Contact : -<input name="contact" value="${info.rows[0].contact}"><br><br>
               <input type="submit">
           </form>
    </body>
</html>
