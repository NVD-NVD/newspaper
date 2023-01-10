<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.ute.newspaper.entities.Category>"/>
<jsp:useBean id="editor" scope="request" type="java.util.List<com.ute.newspaper.entities.User>"/>
<jsp:useBean id="editorCategory" scope="request" type="java.util.List<com.ute.newspaper.entities.Editor_Category>"/>
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
        <h1>Quản lý chủ đề</h1>
        <div class="sub-header d-flex justify-content-around">
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse"
                    data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <input class="form-control form-control-dark w-100 border rounded" type="text" placeholder="Search"
                   aria-label="Search">
            <div class="add-cat">
                <button href="#" type="button" class="btn btn-primary" onclick="addTag()">Thêm</button>
            </div>
        </div>
        <br>
        <div class="add">
                <%--            <form action="${pageContext.request.contextPath}/admin/tag/add" _lpchecked="1" id="mainForm" class="d-none" name="mainForm" method="post">--%>
            <form _lpchecked="1" id="mainForm" class="d-none" name="mainForm" method="post">
                <div class="d-flex flex-row justify-content-end">
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="text" class="form-check-input account-check" name="title"
                                   placeholder="Nhập tên tag mới">
                        </label>
                        <label class="form-check-label">
                            <select name="parentID" id="parentID">
                                <c:choose>
                                    <c:when test="${categories.size() == 0}">
                                        <option value="-1">Không có danh mục để chọn</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="-1" selected>None</option>
                                        <c:forEach items="${categories}" var="c">

                                            <option value="${c.id}">${c.title}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </select>
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
                <th>Danh mục cha</th>
                <th>Phụ trách</th>
                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${categories.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${categories}" var="c" varStatus="loop">
                        <tr>
                            <td>${loop.count}</td>
                            <td>${c.title}</td>
                            <td>${c.createDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${c.parentID == null}">
                                        &nbsp;
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="pID" value="${c.parentID}"/>
                                        <c:forEach items="${categories}" var="cate">
                                            <c:set var="cateID" value="${cate.id}"/>
                                            <c:if test="${pID == cateID}">
                                                ${cate.title}
                                            </c:if>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:set var="cID" value="${c.id}"/>
                                <c:forEach items="${editorCategory}" var="ec">
                                    <c:set var="ecCID" value="${ec.category_id}"/>
                                    <c:if test="${cID == ecCID}">
                                        <c:set var="ecEID" value="${ec.user_id}"/>
                                        <c:forEach items="${editor}" var="e">
                                            <c:set var="eID" value="${e.id}"/>
                                            <c:if test="${ecEID == eID}">
                                                ${e.username}
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </td>
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
