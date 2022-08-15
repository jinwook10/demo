<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>마이 페이지</title>
    <link href="/css/coreui/css/style.min.css" rel="stylesheet">
    <link href="/css/coreui/css/free.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"/>

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
        <div class="row">
            <div class="card">
                <div class="card-header">
                    구매 목록
                </div>
                <div class="card-body">
                    <table id="buy-datatable" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th scope="col">상품</th>
                            <th scope="col">구매 날짜</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <button class="btn btn-block btn-secondary" type="button" onclick="javascript:history.back();">뒤로가기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/coreui/coreui.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready( function () {
        $('#buy-datatable').DataTable({
            ajax:{
                url:"/getbuylist",
                dataSrc:'buy',
                type:'get'
            },
            columns:[
                {data:"board_title"}
                ,{data:"buy_date"}
            ]
            ,order: [ [ 1, "asc" ] ]
            ,columnDefs: [
                { targets: [0], width: 100 }
            ]
            ,language: {
                emptyTable: "데이터가 없습니다.",
                lengthMenu: "페이지당 _MENU_ 개씩 보기",
                info: "현재 _START_ - _END_ / _TOTAL_건",
                infoEmpty: "데이터 없음",
                infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
                search: "",
                zeroRecords: "일치하는 데이터가 없습니다.",
                loadingRecords: "로딩중...",
                processing: "잠시만 기다려 주세요.",
                paginate: {
                    next: "다음",
                    previous: "이전",
                },
            }
        })
    } );
</script>
</body>
</html>