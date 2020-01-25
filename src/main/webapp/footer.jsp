<%@page isELIgnored="false" %>
<%
    Object visitCount = application.getAttribute("visitCount");
    Object yourVisitCount = session.getAttribute("visitCount");
%>
<div class="footer">
    <div style="float: left;">
        Powered by: DAC 2020 (C)
    </div>
    <div style="float:right; width: 35%;">
        your visit: <%=yourVisitCount%>
        visit count: <%=visitCount%>
    </div>
</div>
