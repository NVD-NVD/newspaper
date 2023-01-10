<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="tags" scope="request" type="java.util.List<com.ute.newspaper.entities.Tag>"/>

<t:admin-layout>
    <jsp:attribute name="js">
    <script>
        function addTag() {
            document.getElementById("mainForm").classList.remove("d-none")
        }

        function callOff() {
            document.getElementById("mainForm").classList.add("d-none")
        }

    </script>
  </jsp:attribute>
    <jsp:body>
        <h1>Quản lý thẻ</h1>
        <div class="sub-header d-flex justify-content-around">
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse"
                    data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <input class="form-control form-control-dark w-100 border" type="text" placeholder="Search"
                   aria-label="Search">
            <div class="add-cat">
                <button type="button" class="btn btn-primary" id="addTag" onclick="addTag()">Thêm</button>
            </div>
        </div>
        <br>
        <div class="add">
<%--            <form action="${pageContext.request.contextPath}/admin/tag/add" _lpchecked="1" id="mainForm" class="d-none" name="mainForm" method="post">--%>
            <form _lpchecked="1" id="mainForm" class="d-none" name="mainForm" method="post">
                <div class="d-flex flex-row justify-content-end">
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="text" class="form-check-input account-check" name="title" placeholder="Nhập tên tag mới">
                        </label>
                    </div>
                    <div class="mybtn">
                        <input type="button" class="btn btn-dark mr-3" onclick="callOff()" value="Huỷ">
                        <button class="btn btn-primary">Lưu</button>
                    </div>
                </div>
            </form>
        </div>
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Ngày tạo</th>
                <th>Ngày cập nhập</th>
                <th>Số lượng bài viết</th>
                <th>Trạng thái</th>
                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${tags.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${tags}" var="t" varStatus="loop">
                        <tr>
                            <td>${loop.count}</td>
                            <td>${t.title}</td>
                            <td>${t.createDate}</td>
                            <td>${t.updateDate}</td>
                            <td>&nbsp;</td>
                            <td>${t.enable}</td>
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
</t:admin-layout>
