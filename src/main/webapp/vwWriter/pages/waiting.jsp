<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<t:writer-layout>
      <jsp:attribute name="js">
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '#txtFullDes',
            height: 450,
            plugins: 'paste image link autolink lists table media',
            menubar: false,
            toolbar: [
                'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor | table link image media'
            ],
            // entity_encoding: 'raw'
        });
    </script>
  </jsp:attribute>
    <jsp:body>
        <div class="list-add d-flex justify-content-between">
            <h1>Các bài viết chờ duyệt</h1>
            <button type="button" class="btn btn-primary" id="addTag" href="${pageContext.request.contextPath}/writer/add">Thêm bài viết</button>
        </div>

        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    WYSIWYG HTML Editor
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtTinyDes">Description</label>
                        <input type="text" class="form-control" id="txtTinyDes" name="TinyDes" autofocus />
                    </div>
                    <div class="form-group">
                        <label for="txtFullDes">Full Description</label>
                        <textarea id="txtFullDes" name="FullDes"></textarea>
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>

</t:writer-layout>
