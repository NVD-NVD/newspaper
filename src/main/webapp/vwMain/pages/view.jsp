<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="article" scope="request" type="com.ute.newspaper.entities.Article"/>
<jsp:useBean id="articleCategories" scope="request" type="java.util.List<com.ute.newspaper.entities.Article_Category>"/>
<jsp:useBean id="hint" scope="request" type="java.util.List<com.ute.newspaper.entities.Article>"/>
<jsp:useBean id="userComments" scope="request" type="java.util.List<com.ute.newspaper.model.UserComment>"/>

<t:main-layout>
    <jsp:body>
        <h1>view</h1>
        <div class="container-fluid">
            <div class="d-flex flex-row">
                <div class="content">
                    <div class="main-content d-flex flex-column ml-5 mr-3">
                        <div class="cate-date d-flex flex-row justify-content-between">
                            <c:set var="acID" value="${article.id}"/>
                            <c:forEach items="${articleCategories}" var="ac">
                                <c:set var="acAID" value="${ac.article_id}"/>
                                <c:set var="acCID" value="${ac.category_id}"/>
                                <c:if test="${ acAID == acID}">
                                    <c:forEach items="${categories}" var="cate">
                                        <c:set var="cateID" value="${cate.id}"/>
                                        <c:if test="${cateID == acCID}">
                                            <p>${cate.title}</p>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                            <p>${article.createDate}</p>
                        </div>
                        <div class="title">
                            <h1>${article.title}</h1>
                        </div>
                        <div class="author">
                            <p>${article.author_id}</p>
                        </div>
                        <div class="avatar">
                            <img class="" src="${pageContext.request.contextPath}/${article.avatar}"
                                 alt="Avatar article">
                        </div>
                        <div class="content">
                                ${article.content}
                        </div>
                        <div class="commentInArticle border-top">
                            <ul>
                                <li>
                                    Bình luận về bài viết
                                </li>
                                <c:choose>
                                    <c:when test="${userComments.size() == 0 || userComments == null}">
                                        <li>&nbsp;</li>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${userComments}" var="cmm">
                                            <li>
                                                <div class="d-flex flex-row justify-content-between">
                                                    <div>
                                                        <p class="mr-3">${cmm.username}</p>
                                                        <p>${cmm.comment.comment}</p>
                                                    </div>
                                                    <p>${cmm.comment.date}</p>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                <li>
                                    them binh luan
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="hint mr-3">
                    <ul>
                        <c:forEach items="${hint}" var="n">
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
                                                <i class="fa-solid fa-eye">${n.view}</i>
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
                </div>
            </div>
        </div>
    </jsp:body>
</t:main-layout>
