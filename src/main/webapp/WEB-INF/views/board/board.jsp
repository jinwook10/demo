<!DOCTYPE html>

<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>게시판</title>
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
                            <table id="board_list" class="board_list">
                                <thead>

                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col" class="title">제목</th>
                                    <th scope="col">글쓴이</th>
                                    <th scope="col">날짜</th>
                                    <th scope="col">조회수</th>
                                </tr>

                                </thead>
                                <tbody>
                                <c:forEach var="list" items="${board}" varStatus="vs">
                                <tr class="notice">
                                    <td class="notice">
                                        <span>${vs.count}</span></td>
                                    <td class="title">
                                        <a href="<%=request.getContextPath() %>/view?no=${list.id}">
                                            <span>${list.title}</span> </a>
<%--                                        [댓글숫자자리]--%>
                                    </td>
                                    <td class="author">${list.writer}</td>
                                    <td class="time">${list.write_time}</td>
                                    <td class="readNum">${list.read_cnt}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="btnArea">
                                <a href="/member/write"
                                   class="btn btn-danger"><i class="cil-brush"></i> 쓰기</a>
                            </div>
                            <nav class="page_list">
                                <ul class="pagination pagination-sm">
                                    <li class="disabled"><a href="https://m16.me/Free"><span
                                            aria-hidden="true">«</span></a></li>
                                    <li class="disabled"><a href="https://m16.me/Free?page=1" class="prevEnd"><span
                                            aria-hidden="true">‹</span></a></li>
                                    <li class="active"><a>1</a></li>
                                    <li></li>
                                    <li><a href="https://m16.me/Free?page=2">2</a></li>
                                    <li><a href="https://m16.me/Free?page=3">3</a></li>
                                    <li><a href="https://m16.me/Free?page=4">4</a></li>
                                    <li><a href="https://m16.me/Free?page=5">5</a></li>
                                    <li><a href="https://m16.me/Free?page=6">6</a></li>
                                    <li><a href="https://m16.me/Free?page=7">7</a></li>
                                    <li><a href="https://m16.me/Free?page=8">8</a></li>
                                    <li><a href="https://m16.me/Free?page=9">9</a></li>
                                    <li><a href="https://m16.me/Free?page=10">10</a></li>
                                    <li><a href="https://m16.me/Free?page=2"><span aria-hidden="true">›</span></a>
                                    </li>
                                    <li><a href="https://m16.me/Free?page=678" class="nextEnd"><span
                                            aria-hidden="true">»</span></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/js/coreui/coreui.bundle.min.js"></script>
</div>
</body>
</html>