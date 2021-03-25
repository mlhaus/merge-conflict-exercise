<%--@elvariable id="loginFailed" type="java.lang.Boolean"--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
    </head>
    <body>
        <h2>Login</h2>
        <p>You must log in to access the customer support site.</p>
        <c:if test="${loginFailed}">
            <p style="font-weight: bold;">The username and password you entered are not correct. Please try again.</p>
        </c:if>
        <form method="POST" action="<c:url value="/login" />">
            <label for="username">Username</label><br>
            <input type="text" name="username" id="username" /><br><br>
            <label for="password">Password</label><br>
            <input type="password" name="password" id="password" /><br><br>
            <input type="submit" value="Log In" />
        </form>
    </body>
</html>
