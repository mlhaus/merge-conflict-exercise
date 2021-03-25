<%-- 
    Document   : teach-yourself-sql
    Created on : Mar 24, 2021, 3:22:10 PM
    Author     : k0519415
--%>

<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teach Yourself SQL</title>
        <link href="styles/main.css" rel="stylesheet">
    </head>
    <body>
        <h2>SELECT * FROM products;</h2>
        <sql:query dataSource="${db}" var="result">
            SELECT * FROM products
        </sql:query>

        <table>
            <tr>
                <th>prod_id</th>
                <th>vend_id</th>
                <th>prod_name</th>
                <th>prod_price</th>
                <th>prod_description</th>
            </tr>
        
            
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td> <c:out value="${row.prod_id}"/></td>
                    <td> <c:out value="${row.vend_id}"/></td>
                    <td> <c:out value="${row.prod_name}"/></td>
                    <td> <c:out value="${row.prod_price}"/></td>
                    <td> <c:out value="${row.prod_desc}"/></td>
                </tr>
            </c:forEach>
                
        </table>

    </body>
</html>
