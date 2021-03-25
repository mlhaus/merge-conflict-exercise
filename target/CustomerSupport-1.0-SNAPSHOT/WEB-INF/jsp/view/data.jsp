<%@ page import="java.util.Map" %>
<%
    @SuppressWarnings("unchecked")
    Map<Integer, String> products = (Map<Integer, String>)request.getAttribute("products");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ul>
        <%
            for(int id : products.keySet())
            {
        %>
                <li><a href="<c:url value="/shop">
                    <c:param name="action" value="addToCart" />
                    <c:param name="productId" value="<%= Integer.toString(id) %>"/>
                </c:url>"><%= products.get(id) %></a></li>
        <%
            }
        %>
        </ul>
        
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" 
                           url = "jdbc:mysql://localhost:3306/product" user = "root" password = "password"/>
        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from products;
        </sql:query>
            
        <table border = "1" width = "100%">
            <tr>
               <th>ID</th>
               <th>Name</th>
               <th>Price</th>
               <th>Best Before</th>
               <th>Version</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
               <tr>
                  <td><c:out value = "${row.id}"/></td>
                  <td><c:out value = "${row.name}"/></td>
                  <td><c:out value = "${row.price}"/></td>
                  <td><c:out value = "${row.best_before}"/></td>
                  <td><c:out value = "${row.version}"/></td>
               </tr>
            </c:forEach>
         </table>
         
        <%
            String databaseName=application.getInitParameter("databaseName");
        %>
        <p>All servlets know: <c:out value = "${databaseName}"/></p>
        <p>All servlets know: <%= databaseName %></p>

        <!--https://www.tutorialspoint.com/jsp/jstl_sql_transaction_tag.htm-->
    </body>
</html>
