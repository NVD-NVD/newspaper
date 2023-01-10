<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<t:writer-layout>
    <jsp:attribute name="js">
    <script src="https://cdn.tiny.cloud/1/1mpmusmh4k9anzxq78fae7aql3yzxlmhh25lko3doah4bn74/tinymce/6/tinymce.min.js"
            referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: 'textarea',
            height: 450,
            plugins: 'paste image code link autolink lists table media',
            menubar: false,
            toolbar: [
                'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor | table link image media | code'
            ],
            image_title: true,
            /* enable automatic uploads of images represented by blob or data URIs*/
            automatic_uploads: true,
            /*
              URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
              images_upload_url: 'postAcceptor.php',
              here we add custom filepicker only to Image dialog
            */
            file_picker_types: 'image',
            /* and here's our custom image picker*/
            file_picker_callback: (cb, value, meta) => {
                const input = document.createElement('input');
                input.setAttribute('type', 'file');
                input.setAttribute('accept', 'image/*');

                input.addEventListener('change', (e) => {
                    const file = e.target.files[0];

                    const reader = new FileReader();
                    reader.addEventListener('load', () => {
                        /*
                          Note: Now we need to register the blob in TinyMCEs image blob
                          registry. In the next release this part hopefully won't be
                          necessary, as we are looking to handle it internally.
                        */
                        const id = 'blobid' + (new Date()).getTime();
                        const blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                        const base64 = reader.result.split(',')[1];
                        const blobInfo = blobCache.create(id, file, base64);
                        blobCache.add(blobInfo);

                        /* call the callback and populate the Title field with the file name */
                        cb(blobInfo.blobUri(), { title: file.name });
                    });
                    reader.readAsDataURL(file);
                });

                input.click();
            },
            content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'

        });
    </script>
    </jsp:attribute>
    <jsp:body>

        <form enctype="multipart/form-data" method="post">
            <div class="card">
                <h4 class="card-header">
                    Thêm bài viết mới
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtTitle">Tên bài viết</label>
                        <input type="text" class="form-control" id="txtTitle" name="title" autofocus/>
                    </div>
                    <div class="form-group">
                        <label class="form-check-label">
                            Thuộc danh mục:
                            <select name="categoryID" id="categoryID">
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
                    <div class="form-group">
                        <label for="txtAvatar">Ảnh đại diện</label>
                        <input type="file" class="form-control" id="txtAvatar" name="avatar"/>
                    </div>
                    <div class="form-group">
                        <label for="txtSubDes">Mô tả</label>
                        <textarea id="txtSubDes" name="subDes"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="txtFullDes">Bài viết</label>
                        <textarea id="txtFullDes" name="fullDes"></textarea>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-flex flex-row align-items-center justify-content-between">
                        <a href="${pageContext.request.contextPath}/writer/list">Huỷ</a>
                        <button class="btn btn-primary">
                            <i class="fa fa-check" aria-hidden="true"></i>
                            Lưu
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </jsp:body>

</t:writer-layout>
