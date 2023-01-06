<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="com.ute.newspaper.entities.User" />

<div class="header-blue">
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">NEWS</a>
            <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav" id="header-bar">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" href="#">Trang Chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Danh
                            mục</a>
                        <div class="dropdown-menu" role="menu">
                            <a class="dropdown-item" role="presentation" href="#">Thể thao</a>
                            <a class="dropdown-item" role="presentation" href="#">Banner design</a>
                            <a class="dropdown-item" role="presentation" href="#">content writing</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline mr-auto" target="_self">
                    <div class="form-group">
                        <label for="search-field">
                            <i class="fa fa-search text-white"></i>
                        </label>
                        <input class="form-control search-field" type="search" id="search-field" name="search">
                    </div>
                </form>
                <c:choose>
                    <c:when test="${auth}">
                        <form id="frmLogout" method="post" action="${pageContext.request.contextPath}/auth/logout"></form>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownR" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Hi, <b>${authUser.name}!</b>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/Account/Profile">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    Profile
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript: $('#frmLogout').submit()">
                                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                                    Sign Out
                                </a>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <span class="navbar-text">
                                <a class="login" href="${pageContext.request.contextPath}/auth/login">Đăng Nhập</a>
                        </span>
                        <a class="btn btn-light action-button" role="button" href="${pageContext.request.contextPath}/auth/signup">Đăng Ký</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</div>