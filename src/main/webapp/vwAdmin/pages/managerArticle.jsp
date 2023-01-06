<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="articles" scope="request" type="java.util.List<com.ute.newspaper.entities.Article>"/>

<t:admin-layout>
    <jsp:body>
        <h1>Quản lý bài viết</h1>
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Ngày tạo</th>
                <th>Ngày cập nhập</th>
                <th>Tác giả</th>
                <th>Loại</th>
                <th>Trạng thái</th>
                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${articles.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${articles}" var="w">
                        <tr>
                            <td>${w.id}</td>
                            <td>${w.title}</td>
                            <td>${w.createDate}</td>
                            <td>${w.updateDate}</td>
                            <td>${w.author_id}</td>
                            <td>${w.type}</td>
                            <td>${w.enable}</td>
                            <td>
                                <div class="activities">
                                    <button href="#" type="button" class="btn btn-primary">Edit</button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </jsp:body>
</t:admin-layout>
