<%--@elvariable id="ticketId" type="java.lang.String"--%>
<%--@elvariable id="ticket" type="edu.kirkwood.Ticket"--%>
<%
    Ticket ticket = (Ticket)request.getAttribute("ticket");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
    </head>
    <body>
        <a href="<c:url value="/login?logout=true" />">Logout</a>
        <h2>Ticket #${ticketId}: <c:out value="${ticket.subject}" /></h2>
        <p><strong>Customer Name</strong><br>
            <c:out value="${ticket.customerName}" /></p>
        <p><strong>Subject</strong><br>
            <c:out value="${ticket.subject}" /></p>
        <p><strong>Message</strong><br>
            <c:out value="${ticket.body}" /></p>
        <c:if test="${ticket.numberOfAttachments > 0}"><p><strong>Attachments</strong>
            <c:forEach items="${ticket.attachments}" var="attachment">
                <br><c:out value="${attachment.name}" />&nbsp;<a href="<c:url value="/tickets">
                    <c:param name="action" value="download" />
                    <c:param name="ticketId" value="${ticketId}" />
                    <c:param name="attachment" value="${attachment.name}" />
                </c:url>">Download</a>
            </c:forEach>
        </p></c:if>
        <a href="<c:url value="/tickets" />">Return to list tickets</a>
    </body>
</html>