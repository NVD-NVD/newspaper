<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="users" scope="request" type="java.util.List<com.ute.newspaper.entities.User>"/>

<t:admin-layout>
    <jsp:body>
        <h1>Quản lý biên tập viên</h1>
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>#</th>
                <th>Tên</th>
                <th>Email</th>
                <th>Username</th>
                <th>Ngày đăng ký</th>
                <th>Loại tài khoản</th>
                <th>Ngày hết hạn</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${users.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${users}" var="u">
                        <tr>
                            <td>${u.id}</td>
                            <td>${u.name}</td>
                            <td>${u.email}</td>
                            <td>${u.username}</td>
                            <td>${u.createDate}</td>
                            <td>${u.permission}</td>
                            <td>
                                <c:if test="${u.expr != null}">
                                    ${u.expir}
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </jsp:body>
</t:admin-layout>
