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
                    
                    
                    
        <h2>SELECT * FROM customers;</h2>
        <sql:query dataSource="${db}" var="result">
            SELECT * FROM customers;
        </sql:query>

        <table>
            <tr>
                <th>cust_id</th>
                <th>cust_name</th>
                <th>cust_address</th>
                <th>cust_city</th>
                <th>cust_state</th>
                <th>cust_zip</th>
                <th>cust_country</th>
                <th>cust_contact</th>
                <th>cust_email</th>
            </tr>
        
            
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td> <c:out value="${row.cust_id}"/></td>
                    <td> <c:out value="${row.cust_name}"/></td>
                    <td> <c:out value="${row.cust_address}"/></td>
                    <td> <c:out value="${row.cust_city}"/></td>
                    <td> <c:out value="${row.cust_state}"/></td>
                    <td> <c:out value="${row.cust_zip}"/></td>
                    <td> <c:out value="${row.cust_country}"/></td>
                    <td> <c:out value="${row.cust_contact}"/></td>
                    <td> <c:out value="${row.cust_email}"/></td>
                </tr>
            </c:forEach>
                
        </table>
            
            
        <h2>SELECT vend_name, prod_name, prod_price<br>
            FROM vendors, products<br>
            WHERE vendors.vend_id = products.vend_id;</h2>
        <sql:query dataSource="${db}" var="result">
            SELECT vend_name, prod_name, prod_price
            FROM vendors, products
            WHERE vendors.vend_id = products.vend_id;
        </sql:query>

        <table>
            <tr>
                <th>vend_name</th>
                <th>prod_name</th>
                <th>prod_price</th>
            </tr>

            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td> <c:out value="${row.vend_name}"/></td>
                    <td> <c:out value="${row.prod_name}"/></td>
                    <td> <c:out value="${row.prod_price}"/></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
