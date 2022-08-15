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
            <div class="col-lg-8">
                <div class="card-group d-block d-md-flex row">
                    <div class="card col-md-7 p-4 mb-0">
                        <form method="post" action="/login">
                            <div class="card-body">
                                <h1>로그인</h1>
                                <p class="text-medium-emphasis">로그인 해주세요</p>
                                <div class="input-group mb-3"><span class="input-group-text">

                                    <i class="icon icon-2xl cil-av-timer"></i></span>
                                    <input class="form-control" type="text" placeholder="아이디" name="username">
                                </div>
                                <div class="input-group mb-4"><span class="input-group-text">

                                    <i class="icon icon-2xl cil-arrow-circle-right"></i></span>
                                    <input class="form-control" type="password" placeholder="비밀번호" name="password">
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <button class="btn btn-primary px-4" type="submit">로그인</button>
                                    </div>
                                    <div class="col-6">
                                        <button class="btn btn-secondary px-3" type="button" onclick="javascript:history.back();">뒤로가기</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card col-md-5 text-white bg-primary py-5">
                        <div class="card-body text-center">
                            <div>
                                <h2>회원가입</h2>
                                <p>해당 서비스를 이용하시려면 회원가입을 해주세요.</p>
                                <button class="btn btn-lg btn-danger mt-3" type="button" onclick="location.href='/signup'">가입 하기</button>
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