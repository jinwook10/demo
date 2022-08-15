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
<div class="bg-light min-vh-100 d-flex flex-row align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card mb-4 mx-4">
                    <form method="post" action="/signup">
                        <div class="card-body p-4">
                            <h1>회원가입</h1>
                            <p class="text-medium-emphasis">정보를 입력해 주세요</p>
                            <div class="input-group mb-3"><span class="input-group-text">
                    <i class="icon icon-2xl cil-av-timer"></i></span>
                                <input class="form-control" type="text" placeholder="아이디" name="username">
                            </div>

                            <div class="input-group mb-3"><span class="input-group-text">
                                <i class="icon icon-2xl cil-arrow-circle-right"></i>
                    </span>
                                <input class="form-control" type="password" placeholder="비밀번호" name="password">
                            </div>

                            <button class="btn btn-block btn-success" type="submit">가입하기</button>
                            <button class="btn btn-block btn-secondary" type="button" onclick="javascript:history.back();">뒤로가기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/coreui/coreui.bundle.min.js"></script>

</body>
</html>