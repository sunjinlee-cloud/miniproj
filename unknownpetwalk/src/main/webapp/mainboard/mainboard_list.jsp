<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 :: 모르는개산책</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <!-- 글꼴 참조링크 체크 부탁드립니다ㅠㅠ -->
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
    <style>
        *{margin: 0; padding: 0;box-sizing: border-box; font-family: "Poor Story", system-ui; font-weight: 300;}
        body{ width: 1000px;margin: 0 auto;}
        ul{list-style: none;}
        li{display: inline-block;}
        a{color: black; text-decoration: none;}
        
        /* 헤더 영역 */
        header{
            border-bottom: 1px solid #F88257;
            width: 1000px;
            height: 90px;
            margin: 0 auto;
        }
        .menu{
            overflow: hidden;
        }
        .menu > li{

            width: 100px;
            height: 90px;
            float: right;
            line-height: 90px;
        }

        /* 푸터 영역 */
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

        .mainBoard {width: 1000px; margin: 0 auto; padding: 20px 40px; font-family: "Noto Serif KR", serif;}
        .section {width: 100%; height: 20px; overflow: hidden;}
        .section .leftBox{float: left; margin-left: 46px;}
        .section .rightBox{float: right; margin-right: 46px;}
        .article {width: 100%;}
        .card {margin: 5% auto; padding: 10px; width: 90%; height: 150px; overflow: hidden; 
            border: 1px solid #F88257; border-bottom: 2px solid #F88257; position: relative; animation: ease-in-out;}
        .card .cardLeft {height: 100%; width: 25%; display: block; float: left; }
        .card .cardLeft .a {height: 90%; width: 90%; margin: 5% auto; display: block; background-image: url("img/dog.jpg"); 
            background-repeat: no-repeat; background-size: cover; background-position: center;}
        .card .cardMiddle {height: 100%; width: 50%; float: left; margin: 0 auto; 
            }
        .card .cardMiddle .cardMiddleUpper {height: 50%; width: 100%; }
        .card .cardMiddle .cardMiddleUpper h4 {margin-left: 10px; padding-top: 25px; line-height: 100%; font-weight: 800;}
        .card .cardMiddle .tagBox {height: 50%; width: 100%; overflow: hidden; padding: 10px;}
        .card .cardMiddle .tagBox .tag {display: inline-block; margin: 0 10px; color: #F88257;}
        .card .cardRight {display: block; width: 25%; float: right; margin: 20px auto;
            overflow: hidden; }
        .card .cardRight .location {float: left; width: 100%; height: 50%; text-align: center; line-height: 100%; 
            padding: 10px auto; margin-bottom: 22px;}
        .card .cardRight .price {float: left; width: 100%; height: 50%; text-align: center; line-height: 100%; 
            padding: 10px auto; margin-top: 20px;}
        .doneOrNot {position: absolute; top: 0px; left: 0px; z-index: 100; }


    </style>
</head>
<body> <!-- 선진 -->

    <header>
        <ul class = "menu">
            <li style="float: left;"><a href=""><img src="img/mainlogo.png" alt="logo" width="100px"></a></li>
            <li><a href="">로그아웃</a></li>
            <li><a href="">마이페이지</a></li>
            <li><a href="">고객지원</a></li>
        </ul>
    </header>
    
    <div class="mainBoard">
        <div class="section">
            <div class="leftBox">
                <button type="button" class="jobFinding">산책 일 찾아요</button>
                <button type="button" class="workerFinding">돌보미 찾아요</button>
            </div>
            <div class="rightBox">
                <form action="" method="get">
                    <select name="searchType" id="searchType">
                        <option value="MEM_NICK">닉네임</option> <!-- 받기는 닉네임으로 받되 멤버테이블에서 아이디 가져와서 
                            그걸로 게시판테이블에서 회원아이디가 일치하는 걸로 검색해야함-->
                        <option value="BOARD_TITLE">제목</option>
                        <option value="BOARD_CONTENT">내용</option>
                    </select>
                    <input type="text" id="searchContent" placeholder="검색할 내용을 입력해 주세요" style="width: 150px;">
                    <button type="button" class="searchBtn">검색</button>
                </form>
            </div>
        </div>
        <div class="article">
                <div class="card">
                    <div class="cardLeft">
                        <a class="a" href="유저프로필"></a>
                    </div>
                    <div class="cardMiddle">
                        <div class="cardMiddleUpper"><h4>3살 말 잘 듣는 비숑아가 산책시켜주실 분 구해요</h4></div>
                        <div class="tagBox">
                            <div class="tag tags1">#순딩이</div>
                            <div class="tag tags2">#1시간정도 원해요</div>
                            <div class="tag tags3">#주 2회 좋아요</div>
                        </div>
                    </div>
                    <div class="cardRight">
                        <div class="location">역삼동</div>
                        <div class="price">15,000원</div>
                    </div>
                    <div class="doneOrNot">
                        구인 중
                    </div>
                </div>
                <div class="card">
                    <div class="cardLeft">
                        <a class="a" href="유저프로필"></a>
                    </div>
                    <div class="cardMiddle">
                        <div class="cardMiddleUpper"><h4>3살 말 잘 듣는 비숑아가 산책시켜주실 분 구해요</h4></div>
                        <div class="tagBox">
                            <div class="tag tags1">#순딩이</div>
                            <div class="tag tags2">#1시간정도 원해요</div>
                            <div class="tag tags3">#주 2회 좋아요</div>
                        </div>
                    </div>
                    <div class="cardRight">
                        <div class="location">역삼동</div>
                        <div class="price">15,000원</div>
                    </div>
                    <div class="doneOrNot">
                        구인 중
                    </div>
                </div>
                <div class="card">
                    <div class="cardLeft">
                        <a class="a" href="유저프로필"></a>
                    </div>
                    <div class="cardMiddle">
                        <div class="cardMiddleUpper"><h4>3살 말 잘 듣는 비숑아가 산책시켜주실 분 구해요</h4></div>
                        <div class="tagBox">
                            <div class="tag tags1">#순딩이</div>
                            <div class="tag tags2">#1시간정도 원해요</div>
                            <div class="tag tags3">#주 2회 좋아요</div>
                        </div>
                    </div>
                    <div class="cardRight">
                        <div class="location">역삼동</div>
                        <div class="price">15,000원</div>
                    </div>
                    <div class="doneOrNot">
                        구인 중
                    </div>
                </div>
                <div class="card">
                    <div class="cardLeft">
                        <a class="a" href="유저프로필"></a>
                    </div>
                    <div class="cardMiddle">
                        <div class="cardMiddleUpper"><h4>3살 말 잘 듣는 비숑아가 산책시켜주실 분 구해요</h4></div>
                        <div class="tagBox">
                            <div class="tag tags1">#순딩이</div>
                            <div class="tag tags2">#1시간정도 원해요</div>
                            <div class="tag tags3">#주 2회 좋아요</div>
                        </div>
                    </div>
                    <div class="cardRight">
                        <div class="location">역삼동</div>
                        <div class="price">15,000원</div>
                    </div>
                    <div class="doneOrNot N">
                        구인 중
                    </div>
                </div>
                <div class="card">
                    <div class="cardLeft">
                        <a class="a" href="유저프로필"></a>
                    </div>
                    <div class="cardMiddle">
                        <div class="cardMiddleUpper"><h4>3살 말 잘 듣는 비숑아가 산책시켜주실 분 구해요</h4></div>
                        <div class="tagBox">
                            <div class="tag tags1">#순딩이</div>
                            <div class="tag tags2">#1시간정도 원해요</div>
                            <div class="tag tags3">#주 2회 좋아요</div>
                        </div>
                    </div>
                    <div class="cardRight">
                        <div class="location">역삼동</div>
                        <div class="price">15,000원</div>
                    </div>
                    <div class="doneOrNot Y">
                        구인 완료
                    </div>
                </div>    
        </div>
    </div>

    <footer>
        <div class="underminimenu">
            <ul style="">
                <li><a href="">소개</a></li>|
                <li><a href="">메인서비스</a></li>|
                <li><a href="">고객지원</a></li>|
                <li><a href="">이용약관</a></li>|
                <li><a href="">개인정보처리방침</a></li>
            </ul>
            <p>(주)펫모시깽이 | 대표 박인욱 | 서울 강남구 테헤란로7길 7 (역삼동) 5층 | 대표 전화번호 : 010-1234-1234<br>
                사업자 등록 번호 : 123-45-67890 | 어쩌고저쩌고 | 있어보이는 텍스트 (p 태그 )</p>
        </div>
        <div class="infoarea">
            <p>Copyright 2025 Pet © All rights reserved.</p>
        </div>
    </footer>
    
    <script>
        var cards = document.querySelectorAll(".card");
        var keyframes = [
            {opacity: 0,transform: "translate(0, 100px)" },
            {opacity: 0.5},
            {opacity: 1}
        ]
        var options = {
            duration: 1000,
            easing: "ease-in"
        }
        for(let i = 0; i<5; i++) {
            cards[i].animate(keyframes, options);
        }

        var doneOrNot = document.querySelectorAll(".doneOrNot");
        for(let j = 0; j<5; j++) {
            if (doneOrNot[j].classList.contains("Y")) {
                doneOrNot[j].parentElement.style.filter = "grayscale(90%)";
                console.log(123);
                
            }
        }        
        //구인완료인 경우 회색으로 보이게 하기
    </script>

</body>
</html>