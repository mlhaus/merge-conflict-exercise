<%--@elvariable id="ticketDatabase" type="java.util.Map<Integer, edu.kirkwood.Ticket>"--%>
<%@ page import="java.util.Map" %>
<%
    @SuppressWarnings("unchecked")
    Map<Integer, Ticket> ticketDatabase =
            (Map<Integer, Ticket>)request.getAttribute("ticketDatabase");
    int numTickets = ticketDatabase.size();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>List Customer Support Tickets</title>
    </head>
    <body>
        <a href="<c:url value="/login?logout=true" />">Logout</a>
        <h2>Tickets</h2>
        <p><a href="<c:url value="/tickets"><c:param name="action" value="create" /></c:url>">Create Ticket</a></p>
        
        <c:choose>
            <c:when test="${fn:length(ticketDatabase) == 1}">
                <p style="font-style:italic;">There is 1 ticket in the system.</p>
            </c:when>
            <c:otherwise>
                <p style="font-style:italic;">There are ${fn:length(ticketDatabase)} tickets in the system.</p>
            </c:otherwise>
        </c:choose>

        <c:if test="${fn:length(ticketDatabase) > 0}">
            <c:forEach items="${ticketDatabase}" var="entry">
                Ticket ${entry.key}: <a href="<c:url value="/tickets">
                    <c:param name="action" value="view" />
                    <c:param name="ticketId" value="${entry.key}" />
                </c:url>"><c:out value="${entry.value.subject}" /></a>
                (customer: <c:out value="${entry.value.customerName}" />)<br />
            </c:forEach>
        </c:if>
    </body>
</html>