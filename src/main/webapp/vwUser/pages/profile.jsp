<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="authUser" scope="session" type="com.ute.newspaper.entities.User"/>

<t:user-layout>
    <jsp:body>
        <div class="container d-flex flex-row">
            <img class="" src="${pageContext.request.contextPath}/${authUser.avatar}" alt="avatar">
            <p>${authUser.username}</p>
            <p>${authUser.email}</p>
            <p>${authUser.email}</p>
            <p>${authUser.username}</p>
            <p>${authUser.username}</p>

        </div>
        <%--        <div class="d-flex flex-row">--%>
        <%--            <div class="left d-flex flex-column">--%>
        <%--                <img class="" src="${pageContext.request.contextPath}/${authUser.avatar}" alt="avatar">--%>
        <%--                <p>${authUser.username}</p>--%>
        <%--            </div>--%>
        <%--            <div class="right">--%>
        <%--                --%>
        <%--            </div>--%>
        <%--        </div>--%>
    </jsp:body>

</t:user-layout>
