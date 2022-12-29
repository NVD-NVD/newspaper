<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vwAdmin/css/index.css">
<%--    <link rel="stylesheet" href="<c:url value='/vwAdmin/css/index.css'/>" />--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <jsp:invoke fragment="css" />
</head>
<body>
<div class="main">
    <div class="main-menu">
        <h1>Logo</h1>
        <div class="menu-content">
            <ul>
                <li>
                    <a href="#" class="text-light">
                        <i class="fa fa-home" aria-hidden="true">
                            <span class="ml-2">Quản lý chuyên mục</span>
                        </i>
                    </a>
                </li>
                <li>
                    <a href="#" class="text-light">
                        <i class="fa fa-home" aria-hidden="true">
                            <span class="ml-2">Quản lý nhãn</span>
                        </i>
                    </a>
                </li>
                <li>
                    <a href="#" class="text-light">
                        <i class="fa fa-home" aria-hidden="true">
                            <span class="ml-2">Quản lý bài viết</span>
                        </i>
                    </a>
                </li>
                <li>
                    <a href="#" class="text-light">
                        <i class="fa fa-home" aria-hidden="true">
                            <span class="ml-2">Quản lý người dùng</span>
                        </i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-left">
        <div id="header">
            <div class="main-left-header">
                <div class="header-content"></div>
                <div class="header-content header-search">
                    <div class="input-group input-group-sm mb-3">
                        <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroup-sizing-sm"
                  >Small</span
                  >
                        </div>
                        <input
                                type="text"
                                class="form-control"
                                aria-label="Small"
                                aria-describedby="inputGroup-sizing-sm"
                        />
                    </div>
                </div>
                <div class="header-content header-account">Account</div>
            </div>
            <hr class="main-left-hr" />
        </div>

        <div class="main-content">
            <jsp:doBody/>
        </div>
    </div>
</div>
    <jsp:invoke fragment="js" />
</body>
</html>