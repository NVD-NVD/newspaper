<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vwAuth/auth.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="auth.css">
</head>
<body>
<div class="container-fluid d-flex flex-row justify-content-center h-auto mt-lg-5">
    <div class="signup-logo w-auto">
        <img src="${pageContext.request.contextPath}/public/images/logo.png" alt="">
    </div>
    <div class="w-50 ">
        <div class="card w-75">
            <h2 class="card-title text-center">Đăng Nhập</h2>
            <div class="card-body py-md-4">
                <c:if test="${hasError}">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Login failed!</strong> ${errorMessage}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:if>
                <form _lpchecked="1" id="mainForm" name="mainForm" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="username" name="username"  placeholder="Tên Đăng Nhập">
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control" id="password" name="password"  placeholder="Mật Khẩu">
                    </div>
                    <div class="form-group">
                        <div class="form-check-inline">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" name="stayinhere" value="male">Duy trì đăng nhập
                            </label>
                        </div>
                    </div>

                    <div class="d-flex flex-row align-items-center justify-content-between">
                        <p>Bạn chưa có tài khoản? <br><a href="/auth/signup">Đăng ký tại đây</a></p>
                        <button class="btn btn-primary">Đăng nhập</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
</body>
</html>
