<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vwAuth/auth.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="auth.css">
</head>
<body>
<div class="container-fluid d-flex flex-row justify-content-center h-auto signup-page">
    <%--    <div class="signup-logo w-auto">--%>
    <%--        <img src="${pageContext.request.contextPath}/public/images/logo.png" alt="">--%>
    <%--    </div>--%>
    <div class="card w-50 mt-5">
        <h2 class="card-title text-center">Đăng Ký Tài khoản</h2>
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
                    <input type="text" class="form-control" id="name" name="name" placeholder="Họ và Tên">
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Địa Chỉ Email">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Tên Đăng Nhập">
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Mật Khẩu">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="confirm_password" name="confirm_password"
                           placeholder="Nhập lạị mật khẩu">
                </div>
                <div class="form-group">
                    <legend class="col-form-label col-sm-2 float-sm-left pt-0">Giới tính:</legend>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="gender" value="male">Male
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="gender" value="female">Female
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="gender" value="other" checked>Other
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <h4>Date of Birth</h4>
                    <div class="input-group">
                        <div class="col-third">
                            <input type="text" name="birthdayDD" placeholder="Ngày">
                        </div>
                        <div class="col-third">
                            <input type="text" name="birthdayMM" placeholder="Tháng">
                        </div>
                        <div class="col-third">
                            <input type="text" name="birthdayYYYY" placeholder="Năm">
                        </div>
                    </div>
                </div>
                <div class="form-group">f
                    <legend class="col-form-label col-sm-2 float-sm-left pt-0">Loại tài khoản:</legend>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input account-check" name="accountType" value="reader"
                                   checked>Người đọc báo
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input account-check" name="accountType" value="writer"
                                   id="acc-type-writer">Phóng viên (Người Viết báo)
                        </label>
                    </div>
                </div>
                <div class="form-group" id="penname-input">
                    <input type="text" class="form-control d-none" id="penname" name="penname" placeholder="Bút danh">
                </div>
                <div class="d-flex flex-row align-items-center justify-content-between">
                    <a href="${pageContext.request.contextPath}/auth/login">Đăng nhập</a>
                    <button class="btn btn-primary">Tạo tài khoản</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
    document.mainForm.onclick = function () {
        var typeChecked = document.mainForm.accountType.value;
        if (typeChecked === "reader") {
            console.log("reader")
            document.getElementById("penname").classList.add("d-none")
        } else {
            console.log("writer")
            document.getElementById("penname").classList.remove("d-none")
        }
    }
    $('#mainForm').on('submit', function (e) {
        e.preventDefault();

        const username = $('#username').val();
        if (username.length === 0) {
            alert('username không thể để trống.');
            return;
        }
    });

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
</body>
</html>
