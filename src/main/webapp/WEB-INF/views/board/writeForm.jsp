<!DOCTYPE html>

<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>글 작성</title>
    <link href="/css/coreui/css/style.min.css" rel="stylesheet">
    <link href="/css/coreui/css/free.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/m16/css/main.css">
    <link rel="stylesheet" href="/css/m16/css/main2.css">
    <link rel="stylesheet" type="text/css" href="/ckeditor/css/styles.css">
    <style>
        .ck-editor__editable {
            height: 400px;
        }

        .ck-content {
            font-size: 12px;
        }
    </style>

</head>
<body>
<div class="wrapper d-flex flex-column min-vh-100 bg-light">
    <header class="header header-sticky">
        <div class="container-fluid">
            <i class="icon icon-2xl cil-apps"></i>
            <ul class="header-nav d-none d-md-flex">
                <li class="nav-item"><a class="nav-link" href="/">메인 화면</a></li>
                <li class="nav-item"><a class="nav-link" href="/board">게시판</a></li>
            </ul>
            <ul class="header-nav ms-auto">
                <c:if test="${empty pageContext.request.userPrincipal }">
                    <li class="nav-item"><a class="nav-link" href="/login">
                        <i class="icon icon-2xl cil-eco"></i> 로그인</a></li>
                </c:if>
                <li class="nav-item"><a class="nav-link" href="/signup">
                    <i class="icon icon-2xl cil-diamond"></i> 회원가입</a></li>
            </ul>
            <ul class="header-nav ms-3">
                <c:if test="${not empty pageContext.request.userPrincipal }">
                    <li class="nav-item dropdown"><a class="nav-link py-0" data-coreui-toggle="dropdown" href="#"
                                                     role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="icon icon-2xl cil-mood-very-good"></i>
                            ${pageContext.request.userPrincipal.principal.name}
                    </a>
                        <div class="dropdown-menu dropdown-menu-end pt-0">
                            <div class="dropdown-header bg-light py-2">
                                <div class="fw-semibold">계정</div>
                            </div>
                            <a class="dropdown-item" href="/member/mypage">
                                <i class="icon icon-2xl cil-zoom"></i> 마이 페이지</a><a class="dropdown-item" href="">
                            <i class="icon icon-2xl cil-money"></i> 결제 수단</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/logout">
                                <i class="icon icon-2xl cil-power-standby"></i> 로그아웃</a>
                        </div>
                    </li>
                </c:if>
            </ul>
        </div>

    </header>
    <div class="body flex-grow-1 px-3">
        <div class="row">
            <div class="card">
                <div class="card-header">
                    자유 게시판
                </div>
                <div class="card-body">

                    <div class="omdoll_content_wrapper">
                        <div class="xe_bootstrap_board">
                            <form action="/member/write" method="post" enctype="multipart/form-data" class="board_write" editor_sequence="3">
                                <div class="write_header input-group">
                                    <input type="text" name="title" class="form-control" title="제목" placeholder="제목">
                                </div>
                                <input type="hidden" name="writer" value="${user}" disabled>
                                <textarea name="content" id="editor"></textarea>
                                <span><i class="xi-icon xi-file-upload"></i> 사진 및 파일 첨부</span>
                                <input id="xe-fileupload" type="file" class="fileupload-processing " name="file"
                                       data-auto-upload="true" data-editor-sequence="3" multiple="">
                                <div class="btnArea">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-check"
                                                                                    aria-hidden="true"></i>
                                        등록
                                    </button>
                                    <button type="button" onclick="location.href='/board'" class="btn btn-default"><i
                                            class="fa fa-undo"
                                            aria-hidden="true"></i>
                                        취소
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/coreui/coreui.bundle.min.js"></script>
<script src="/js/ckeditor/ckeditor.js"></script>
<script>ClassicEditor
    .create(document.querySelector('#editor'), {
        licenseKey: '',
        toolbar: {
            items: [
                'heading',
                '|',
                'bold',
                'italic',
                'link',
                'bulletedList',
                'numberedList',
                '|',
                'outdent',
                'indent',
                '|',
                'blockQuote',
                'imageUpload',
                'insertTable',
                'mediaEmbed',
                'undo',
                'redo'
            ]
        },
        language: 'ko',
        image: {
            toolbar: [
                'imageTextAlternative',
                'imageStyle:inline',
                'imageStyle:block',
                'imageStyle:side'
            ]
        },
        table: {
            contentToolbar: [
                'tableColumn',
                'tableRow',
                'mergeTableCells'
            ]
        }
    })
    .then(editor => {
        window.editor = editor;
    })
    .catch(error => {
        console.error('Oops, something went wrong!');
        console.error('Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:');
        console.warn('Build id: frec71zatvdq-nohdljl880ze');
        console.error(error);
    });
</script>
</body>
</html>