<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="tags" scope="request" type="java.util.List<com.ute.newspaper.entities.Tag>"/>

<t:admin-layout>
    <jsp:body>
        <h1>Thêm tag mới</h1>
        <form action="" class="addTag" method="post">

        </form>
    </jsp:body>
</t:admin-layout>
