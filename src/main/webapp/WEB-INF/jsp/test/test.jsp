<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../base.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:forEach items="${data}" var="user">
        <div class="row">
            <div class="col-4" style="text-align: center">
                <span>${user.id}</span>
            </div>
            <div class="col-4" style="text-align: center">
                <span>${user.tel}</span>
            </div>
            <div class="col-4" style="text-align: center">
                <span>${user.name}</span>
            </div>
        </div>
    </c:forEach>


</body>
</html>
