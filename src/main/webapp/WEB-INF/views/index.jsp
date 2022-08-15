<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>메인 페이지</title>
    <link href="/css/coreui/css/style.min.css" rel="stylesheet">
    <link href="/css/coreui/css/free.min.css" rel="stylesheet">

</head>
<body>
<div class="wrapper d-flex flex-column min-vh-100 bg-light">
    <header class="header header-sticky mb-4">
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
        <div class="header-divider"></div>
        <div class="container-fluid">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb my-0 ms-2">
                    <li class="breadcrumb-item">
                        <span>메인 화면</span>
                    </li>
                </ol>
            </nav>
        </div>
    </header>
    <div class="body flex-grow-1 px-3">

    </div>
</div>

<script src="/js/coreui/coreui.bundle.min.js"></script>
</body>
</html>