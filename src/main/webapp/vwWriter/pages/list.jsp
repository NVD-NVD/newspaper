<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="articles" scope="request" type="java.util.List<com.ute.newspaper.entities.Article>"/>

<t:writer-layout>
    <jsp:body>
        <div class="list-add d-flex justify-content-between">
            <h1>Danh sách bài viết</h1>
            <a type="button" class="btn btn-primary text-center" id="addTag" href="${pageContext.request.contextPath}/writer/add">Thêm bài viết</a>
        </div>
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Ngày tạo</th>
                <th>Ngày cập nhập</th>
                <th>Chuyên mục</th>
                <th>Thẻ</th>
                <th>Trạng thái</th>
                <th>Hoạt động</th>
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
                    <c:forEach items="${articles}" var="a">
                        <tr>
                            <td>${a.id}</td>
                            <td>${a.title}</td>
                            <td>${a.createDate}</td>
                            <td>${a.updateDate}</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>${a.status}</td>
                            <td>${a.enable}</td>
                            <td>
                                <div class="activities">
                                    <button href="#" type="button" class="btn btn-primary">Change Status</button>
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

</t:writer-layout>
