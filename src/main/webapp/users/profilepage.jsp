<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile :: 모르는개산책</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <style>
        *{margin: 0; padding: 0;box-sizing: border-box; font-family: "Poor Story", system-ui; font-weight: 300;}
        /*body{ width: 1000px;margin: 0 auto;}*/
        ul{list-style: none;}
        li{display: inline-block;}
        a{color: black; text-decoration: none;}
        
        body {}
        .mainBoard {width: 1000px; margin: 0 auto; margin-bottom: 500px; text-align: center; background-color: white; }
        .mainBoard .section {width: 80%; margin: 0 auto; text-align: center; }
        .mainBoard .section .profile {text-align: center;  padding: 40px;}
        .mainBoard .section .profile .profilePhoto{width: 100%; text-align: center;}
        .mainBoard .section .profile .profilePhoto > img {width: 200px; height: auto;}
        .mainBoard .section .profile .nicknameCard {display: inline-block; font-size: 20px;}
        .mainBoard .section .profile .nickname {display: inline-block; font-size: 35px;}
        
        .mainBoard .section .profile .profileUnder{overflow: hidden; padding: 40px;}
        .mainBoard .section .profile .profileUnder .num{float: left; width: 33.3%; padding: 5px; 
            position: relative; font-size: 30px;}
        .mainBoard .section .profile .profileUnder .avgScore{float: left; width: 33.3%; padding: 5px;
            position: relative; font-size: 30px;}
        .mainBoard .section .profile .profileUnder .avgPay{float: left; width: 33.3%; padding: 5px;
            position: relative; font-size: 30px;}
        .top {position: absolute; top: -15px; left: 20px; font-size: 12px; opacity: 0; }
        .bii {position: absolute; top: -10px; left: 0px; font-size: 20px; }
        
        .mainBoard .section .profile .introduction { margin: 20px; font-size: 15px;}
        
        
        .mainBoard .section .jobsTaken {width: 45%; height: 300px; text-align: center; position: relative; margin: 20px 2.5%;
             padding: 20px; box-sizing: border-box; float: left; border: 1px solid #F88257; border-radius: 10%;
             box-shadow: 0 0 10px 0 rgba(0,0,0,0.4);}
        .mainBoard .section .jobsTaken .jobsTakenTitle{width: 100%; padding: 30px; }
        .mainBoard .section .jobsTaken .jobsTakenTitle .title {float: left; font-size: 20px; border-bottom: 2px solid #F88257;
            font-weight: 700;}
        .mainBoard .section .jobsTaken .jobsTakenTitle .takenListMore{float: right; font-size: 20px;}
        .mainBoard .section .jobsTaken .jobsTakenBoard{width: 100%; overflow: hidden; position: relative;
            padding: 20px; height: 70%;}
        .mainBoard .section .jobsTaken .jobsTakenBoard .jobsTakenList{width: 100%; height: 33.3%; float: left;
            margin: 0.3em; font-size: 15px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;}
        

        .mainBoard .section .jobsGiven {width:45%; height: 300px; text-align: center; position: relative; margin: 20px 2.5%;
            padding: 20px; box-sizing: border-box; float: left; border: 1px solid #F88257; border-radius: 10%;
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.4);}
        .mainBoard .section .jobsGiven .jobsGivenTitle{width: 100%; padding: 30px; font-size: 20px;}
        .mainBoard .section .jobsGiven .jobsGivenTitle .title {float: left; font-size: 20px; border-bottom: 1px solid #F88257;
            font-weight: 700;}
        .mainBoard .section .jobsGiven .jobsGivenTitle .givenListMore{float: right;}
        .mainBoard .section .jobsGiven .jobsGivenBoard {width: 100%; overflow: hidden; position: relative;
            padding: 20px; height: 70%;}
        .mainBoard .section .jobsGiven .jobsGivenBoard .jobsGivenList{width: 100%; height: 33.3%; float: left;
            margin: 0.3em; font-size: 15px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;}
        
        
        

    </style>
</head>
<body> <!-- 선진 -->

    <div class="mainBoard">
        <div class="section">
            <div class="profile"> <!-- 프로필카드영역-->
                <div class="profilePhoto"><img src="../img/person.png" alt="프로필사진"></div>
                <div class="nicknameCard">
                    <div class="nickname">${requestScope.usersProfileDTO.memNick}</div>
                    님
                </div>

                <div class="profileUnder" style="border-top: 3px solid #F88257;">
                    <div class="num">
                        <img src="../icon/walking.png" alt="일한건수" class="img bi" style="width: 30px; height: 30px;"><div class="top">맡은 건 수</div>
                        ${requestScope.profileDTO.count} 건</div>
                    <div class="avgScore">
                        <i class="bi bi-star"></i><div class="top">평균 평점</div>
                        ${requestScope.profileDTO.avgReviewScore} 점</div>
                    <div class="avgPay">
                        <i class="bi bi-coin"></i><div class="top">평균 의뢰금액</div>
                        ${requestScope.profileDTO.avgPay} 원</div>
                </div>
                <div class="introduction">
                    ${requestScope.UsersProfileDTO.memIntro}
                </div>
            </div>
            <div class="jobsTaken"> <!-- 맡은 건 내역 -->
                <div class="jobsTakenTitle">
                    <div class="title">맡은 건 내역</div>
                    <div class="takenListMore"><a href="../mainboard/mainboard_list.jsp?jobtaker=${requestScope.memNick}"><i class="bi bi-three-dots"></i></a></div>
                </div>
                <div class="jobsTakenBoard">
                	<c:forEach var="boardTitle" items="${requestScope.workList}">
						<div class="jobsTakenList">
							<a href="getContent.board?boardTitle=${boardTitle}"><i class="bi bi-chevron-right"></i>${boardTitle}</a>
						</div>
					</c:forEach>                    
                 </div>
                
            </div>
            <div class="jobsGiven"> <!-- 글 쓴 내역-->
                <div class="jobsGivenTitle">
                    <div class="title">작성 글 내역</div>
                    <div class="givenListMore"><a href="../mainboard/mainboard_list.jsp?memnum=${requestScope.UsersProfileDTO.memNick}"><i class="bi bi-three-dots"></a></i></div>
                </div>
                <div class="jobsGivenBoard">
                	<c:forEach var="boardTitle" items="${writeList}">
						<div class="jobsGivenList">
							<a href="getContent.board?boardTitle=${boardTitle}"><i class="bi bi-chevron-right"></i>${boardTitle}</a>
						</div>
					</c:forEach>
                </div>
            </div>
        </div>
    </div>

 
    <script>
        var profileUnder = document.querySelector(".profileUnder");
        var top = document.querySelectorAll(".top");
        profileUnder.onmouseover = function() {
            if (!event.target.classList.contains("bi")) return;
            event.target.nextElementSibling.style.opacity = 1;
        };
        profileUnder.onmouseout = function() {
            if (!event.target.classList.contains("bi")) return;
            event.target.nextElementSibling.style.opacity = 0;
        };
        
        var asd = workList;
        console.log(asd);
     </script>

</body>
</html>

<%@ include file="../include/footer.jsp" %>	