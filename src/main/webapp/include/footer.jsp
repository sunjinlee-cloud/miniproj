<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{margin: 0; padding: 0;box-sizing: border-box;}
        body{ width: 1000px;margin: 0 auto;}
        ul{list-style: none;}
        li{display: inline-block;}
        a{color: black; text-decoration: none;}

        footer{
            height: 120px;
            border-top: 1px solid #F88257;
            font-weight: 100;
            font-size: 10px;
            text-align: center;
            padding-top: 25px;
        }
        .underminimenu{
            margin-bottom: 10px;
        }
        .underminimenu ul{
            font-size: small; 
            margin-bottom: 5px;
        }
    </style>
</head>
<body>

    <footer>
        <div class="underminimenu">
            <ul style="">
                <li><a href="">소개|</a></li>
                <li><a href="">메인서비스|</a></li>
                <li><a href="">고객지원|</a></li>
                <li><a href="../foot/terms.jsp">이용약관|</a></li>
                <li><a href="../foot/privacypolicy.jsp">개인정보처리방침</a></li>
            </ul>
            <p>(주)펫모시깽이 | 대표 박인욱 | 서울 강남구 테헤란로7길 7 (역삼동) 5층 | 대표 전화번호 : 010-1234-1234<br>
                사업자 등록 번호 : 123-45-67890 | 동물자유연대 | 농림축산검역본부</p>
        </div>
        <div class="infoarea">
            <p>Copyright 2025 Pet © All rights reserved.</p>
        </div>
    </footer>
</body>
</html>