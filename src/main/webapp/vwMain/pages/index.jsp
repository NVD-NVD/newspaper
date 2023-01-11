<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="articles" scope="request" type="java.util.List<com.ute.newspaper.entities.Article>"/>
<jsp:useBean id="newest" scope="request" type="java.util.List<com.ute.newspaper.entities.Article>"/>
<jsp:useBean id="outstanding" scope="request" type="java.util.List<com.ute.newspaper.entities.Article>"/>
<jsp:useBean id="mostView" scope="request" type="java.util.List<com.ute.newspaper.entities.Article>"/>
<jsp:useBean id="top" scope="request" type="java.util.List<com.ute.newspaper.entities.Article>"/>
<jsp:useBean id="articleCategories" scope="request" type="java.util.List<com.ute.newspaper.entities.Article_Category>"/>
<jsp:useBean id="comments" scope="request" type="java.util.List<com.ute.newspaper.entities.Comment>"/>

<t:main-layout>
    <jsp:body>
        <div class="main-content container">
            <ul>
                <li>
                        <%--10 bài viết mới nhất--%>
                    <div class="title">
                        <h2>Mới Nhất</h2>
                    </div>
                    <ul>
                        <c:forEach items="${newest}" var="n">
                            <c:set var="nID" value="${n.id}"/>
                            <li>
                                <hr>
                                <div class="d-flex flex-row mb-5">
                                    <img class="avatar-article" src="${pageContext.request.contextPath}/${n.avatar}"
                                         alt="Avatar article">
                                    <div class="d-flex flex-column ml-4">
                                        <div class="d-flex flex-row justify-content-between">
                                            <c:forEach items="${articleCategories}" var="ac">
                                                <c:set var="acAID" value="${ac.article_id}"/>
                                                <c:set var="acCID" value="${ac.category_id}"/>

                                                <c:if test="${ acAID == nID}">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <c:set var="cateID" value="${cate.id}"/>
                                                        <c:if test="${cateID == acCID}">
                                                            <p>${cate.title}</p>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                            <p>${n.createDate}</p>
                                        </div>
                                        <div class="titleNews">
                                            <a href="${pageContext.request.contextPath}/main/view?id=${n.id}">
                                                <h2>${n.title}</h2>
                                            </a>
                                        </div>
                                        <div class="subContent">
                                                ${n.abstract_content}
                                        </div>
                                        <div class="d-flex flex-row justify-content-end">
                                            <div class="mr-2">
                                                <i class="fa-solid fa-eye">
                                                    ${n.view}
                                                </i>
                                            </div>
                                            <div>
                                                <i class="fa-solid fa-comment">
                                                    <c:set var="index" value="0"/>
                                                    <c:forEach items="${comments}" var="comment">
                                                        <c:set var="cmmAID" value="${comment.article_id}"/>
                                                        <c:if test="${ cmmAID == nID}">
                                                            <c:set var="index" value="${index + 1}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    ${index}
                                                </i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <li>
                        <%--3-4 bài viết nổi bật nhất trong tuần qua--%>
                    <div class="title">
                        <h2>Nổi bật nhất trong tuần qua</h2>
                    </div>
                    <ul>
                        <c:forEach items="${outstanding}" var="o">
                            <c:set var="nID" value="${o.id}"/>
                            <li>
                                <hr>
                                <div class="d-flex flex-row mb-5">
                                    <img class="avatar-article" src="${pageContext.request.contextPath}/${o.avatar}"
                                         alt="Avatar article">
<%--                                    <div class="d-flex flex-column ml-4">--%>
<%--                                        <h2>${o.title}</h2>--%>
<%--                                            ${o.abstract_content}--%>
<%--                                    </div>--%>
                                    <div class="d-flex flex-column ml-4">
                                        <div class="d-flex flex-row justify-content-between">
                                            <c:forEach items="${articleCategories}" var="ac">
                                                <c:set var="acAID" value="${ac.article_id}"/>
                                                <c:set var="acCID" value="${ac.category_id}"/>

                                                <c:if test="${ acAID == nID}">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <c:set var="cateID" value="${cate.id}"/>
                                                        <c:if test="${cateID == acCID}">
                                                            <p>${cate.title}</p>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                            <p>${o.createDate}</p>
                                        </div>
                                        <div class="titleNews">
                                            <a href="${pageContext.request.contextPath}/main/view?id=${n.id}">
                                                <h2>${o.title}</h2>
                                            </a>
                                        </div>
                                        <div class="subContent">
                                                ${o.abstract_content}
                                        </div>
                                        <div class="d-flex flex-row justify-content-end">
                                            <div class="mr-2">
                                                <i class="fa-solid fa-eye">
                                                        ${o.view}
                                                </i>
                                            </div>
                                            <div>
                                                <i class="fa-solid fa-comment">
                                                    <c:set var="index" value="0"/>
                                                    <c:forEach items="${comments}" var="comment">
                                                        <c:set var="cmmAID" value="${comment.article_id}"/>
                                                        <c:if test="${ cmmAID == nID}">
                                                            <c:set var="index" value="${index + 1}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                        ${index}
                                                </i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <li>
                        <%--10 bài viết được xem nhiều nhất--%>
                    <div class="title">
                        <h2>Xem nhiều nhất</h2>
                    </div>
                    <ul>
                        <c:forEach items="${mostView}" var="m">
                            <c:set var="nID" value="${m.id}"/>
                            <li>
                                <hr>
                                <div class="d-flex flex-row mb-5">
                                    <img class="avatar-article" src="${pageContext.request.contextPath}/${m.avatar}"
                                         alt="Avatar article">
<%--                                    <div class="d-flex flex-column ml-4">--%>
<%--                                        <h2>${m.title}</h2>--%>
<%--                                            ${m.abstract_content}--%>
<%--                                    </div>--%>
                                    <div class="d-flex flex-column ml-4">
                                        <div class="d-flex flex-row justify-content-between">
                                            <c:forEach items="${articleCategories}" var="ac">
                                                <c:set var="acAID" value="${ac.article_id}"/>
                                                <c:set var="acCID" value="${ac.category_id}"/>

                                                <c:if test="${ acAID == nID}">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <c:set var="cateID" value="${cate.id}"/>
                                                        <c:if test="${cateID == acCID}">
                                                            <p>${cate.title}</p>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                            <p>${m.createDate}</p>
                                        </div>
                                        <div class="titleNews">
                                            <a href="${pageContext.request.contextPath}/main/view?id=${n.id}">
                                                <h2>${m.title}</h2>
                                            </a>
                                        </div>
                                        <div class="subContent">
                                                ${m.abstract_content}
                                        </div>
                                        <div class="d-flex flex-row justify-content-end">
                                            <div class="mr-2">
                                                <i class="fa-solid fa-eye">
                                                        ${m.view}
                                                </i>
                                            </div>
                                            <div>
                                                <i class="fa-solid fa-comment">
                                                    <c:set var="index" value="0"/>
                                                    <c:forEach items="${comments}" var="comment">
                                                        <c:set var="cmmAID" value="${comment.article_id}"/>
                                                        <c:if test="${ cmmAID == nID}">
                                                            <c:set var="index" value="${index + 1}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                        ${index}
                                                </i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <li>
                        <%--top 10 chuyên mục, mỗi chuyên mục 1 bài mới nhất--%>
                    <div class="title">
                        <h2>Top 10 chuyên mục</h2>
                    </div>
                    <ul>
                        <c:forEach items="${top}" var="t">
                            <c:set var="nID" value="${t.id}"/>
                            <li>
                                <hr>
                                <div class="d-flex flex-row mb-5">
                                    <img class="avatar-article" src="${pageContext.request.contextPath}/${t.avatar}"
                                         alt="Avatar article">
<%--                                    <div class="d-flex flex-column ml-4">--%>
<%--                                        <h2>${t.title}</h2>--%>
<%--                                            ${t.abstract_content}--%>
<%--                                    </div>--%>
                                    <div class="d-flex flex-column ml-4">
                                        <div class="d-flex flex-row justify-content-between">
                                            <c:forEach items="${articleCategories}" var="ac">
                                                <c:set var="acAID" value="${ac.article_id}"/>
                                                <c:set var="acCID" value="${ac.category_id}"/>

                                                <c:if test="${ acAID == nID}">
                                                    <c:forEach items="${categories}" var="cate">
                                                        <c:set var="cateID" value="${cate.id}"/>
                                                        <c:if test="${cateID == acCID}">
                                                            <p>${cate.title}</p>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                            <p>${t.createDate}</p>
                                        </div>
                                        <div class="titleNews">
                                            <a href="${pageContext.request.contextPath}/main/view?id=${n.id}">
                                                <h2>${t.title}</h2>
                                            </a>
                                        </div>
                                        <div class="subContent">
                                                ${t.abstract_content}
                                        </div>
                                        <div class="d-flex flex-row justify-content-end">
                                            <div class="mr-2">
                                                <i class="fa-solid fa-eye">
                                                        ${t.view}
                                                </i>
                                            </div>
                                            <div>
                                                <i class="fa-solid fa-comment">
                                                    <c:set var="index" value="0"/>
                                                    <c:forEach items="${comments}" var="comment">
                                                        <c:set var="cmmAID" value="${comment.article_id}"/>
                                                        <c:if test="${ cmmAID == nID}">
                                                            <c:set var="index" value="${index + 1}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                        ${index}
                                                </i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
        </div>
        <%--        <c:choose>--%>
        <%--            <c:when test="${articles.size() == 0}">--%>
        <%--                <div class="card-body">--%>
        <%--                    <p class="card-text">Không có dữ liệu.</p>--%>
        <%--                </div>--%>
        <%--            </c:when>--%>
        <%--            <c:otherwise>--%>
        <%--                <c:forEach items="${articles}" var="a">--%>
        <%--                    ${a.title}--%>
        <%--                    <br>--%>
        <%--                    <div>--%>
        <%--                            ${a.abstract_content}--%>
        <%--                    </div>--%>
        <%--                    <br>--%>
        <%--                    ${a.content}--%>
        <%--                    <br>--%>
        <%--                    <img src="${a.avatar}" alt="">--%>
        <%--                </c:forEach>--%>
        <%--            </c:otherwise>--%>
        <%--        </c:choose>--%>

    </jsp:body>
</t:main-layout>
