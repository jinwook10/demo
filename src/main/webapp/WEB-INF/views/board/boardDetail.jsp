<!DOCTYPE html>

<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>자세히 보기</title>
    <link href="/css/coreui/css/style.min.css" rel="stylesheet">
    <link href="/css/coreui/css/free.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/m16/css/main.css">
    <link rel="stylesheet" href="/css/m16/css/main2.css">

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
                            <div class="board_read">
                                <div class="read_header">
                                    <div class="header">
                                        <h1 class="title"> ${board.title}</h1>
                                        <div class="nick_area">
                                            ${board.writer}
                                        </div>
                                    </div>
                                </div>
                                <div class="read_body">
                                    <table class="et_vars">
                                        <caption class="blind">Extra Form</caption>
                                    </table>
                                    <div class="rhymix_content xe_content">
                                        ${board.content}
                                    </div>
                                </div>
                            </div>

                            <div class="feedback" id="comment">
                                <c:if test="${not empty fileno}">
                                    <c:if test="${not empty buycheck}">
                                <div class="fbHeader">
                                    <h2><a href="/filedown?no=${fileno}">첨부파일</a></h2>
                                </div>
                                    </c:if>
                                    <c:if test="${empty buycheck}">
                                        <div class="fbHeader">
                                            <h2><a href="">첨부파일(미구매)</a></h2>
                                        </div>
                                    </c:if>
                                </c:if>
                            </div>
                            <c:if test="${not empty fileno}">
                            <div class="btnArea">
                                <form action="/member/buy" method="post">
                                    <input type="hidden" value="${board.title}" name="title">
                                    <input type="hidden" value="${no}" name="no">
                                <button type="submit" class="btn btn-success"> 구매</button>
                                </form>
                            </div>
                            </c:if>
<%--                    댓글        <div id="write_comment">--%>
<%--                                <form action="" method="post" class="write_comment">--%>
<%--                                    <div class="simple_wrt">--%>
<%--                                        <textarea class="form-control" id="editor_56489792" cols="50"--%>
<%--                                                  rows="4"></textarea>--%>
<%--                                    </div>--%>
<%--                                    <div class="btnArea">--%>
<%--                                        <button type="submit" class="btn btn-success"> 댓글 등록</button>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
                            <div class="btnArea">
                                <span class="goList"><a href="/board"
                                                        class="btn btn-default"> 목록</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/coreui/coreui.bundle.min.js"></script>
</body>
</html>