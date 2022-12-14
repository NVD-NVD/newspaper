<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">
        <span class="text-white text-center">NEWS</span>
    </a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse"
            data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
    <ul class="navbar-nav px-3">
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
<%--        <li class="nav-item text-nowrap">--%>
<%--            <a class="nav-link" href="${pageContext.request.contextPath}/auth/logout">Sign out</a>--%>
<%--        </li>--%>
    </ul>
</nav>