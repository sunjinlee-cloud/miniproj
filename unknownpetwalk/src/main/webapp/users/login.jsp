<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 :: 모르는개산책</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
    <style>
        *{margin: 0; padding: 0;box-sizing: border-box; font-family: "Poor Story", system-ui; font-weight: 300; }
        body{ width: 1000px;margin: 0 auto;}
        ul{list-style: none;}
        li{display: inline-block;}
        a{color: black; text-decoration: none;}

        
        .mainBoard {text-align: center; width: 1000px; margin: 0 auto 100px auto;}
        .mainBoard .card {width: 500px; margin: 0 auto; text-align: center;}
        .mainBoard .card .photo {margin: 50px auto; width: 300px; height: auto;}
        .img {width: 100%; height: auto;}
        .mainBoard .card .idBox {margin: 10px auto; font-size: 30px; width: 300px; height: 30px;}
        .mainBoard .card .pwBox {margin: 10px auto; font-size: 30px; width: 300px; height: 30px;}
        input {width: 90%; height: 90%; background-color: #fbebe5;}
        .mainBoard .card .loginBtn .login {background-color: #F88257; border: 2px solid #F88257;
            border-radius: 8%; margin-top: 40px; font-size: 15px; color: aliceblue;}

    </style>
</head>
<body> <!-- 선진 -->

    
    <section class="mainBoard">
        <div class="card">
            <form action="loginForm.users" method="post">
                <div class="photo"><img src="../logo/logo04.png" alt="산책이미지" class="img"></div>
                <div class="idBox"><input type="text" id="id" placeholder="ID를 입력하세요" name="email"></div>
                <div class="pwBox"><input type="password" id="pw" placeholder="비밀번호를 입력하세요" name="pw"></div>
                <div class="loginBtn"><button type="submit" class="login">로그인</button></div>
             </form>
        </div>
    </section>

    <script>
        var loginBtn = document.querySelector(".loginBtn");
        var id = document.getElementById("id");
        var pw = document.getElementById("pw");

        loginBtn.addEventListener("click", function() {
            var regId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                if (id.value == "" || pw.value == "") {
                    alert('아이디와 비밀번호를 모두 입력하세요.')
                } else if (!regId.test(id.value)) {
                    alert('아이디를 이메일 형식으로 입력해 주세요.'+id.value)
                    return;
                } 

        })


        pwBox.onkeyup = function () {
            if (window.event.keyCode == 13 && id.value != "" && pw.value != "") {
                var regId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                if (!regId.test(id.value)) {
                    alert('아이디를 이메일 형식으로 입력해 주세요.55')
                    return;
                }
                alert("?") //엔터치고 로그인 기능 
            }
        }



    </script>

</body>
</html>

<%@ include file="../include/footer.jsp" %>	