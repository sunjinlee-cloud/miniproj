<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <%@ include file="../include/header.jsp" %>
                <link rel="stylesheet" href="../css/support_qna_write.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
                <style>
                    * {
                        font-family: "Poor Story", system-ui;
                    }
                </style>
                <section>


                    <ul class="qna-name notice-name">
                        <li style="width: 50%;">
                            <div>${board.boardTitle}</div>
                        </li>
                        <li class="qna-fo">작성자</li>
                        <li class="qna-li">${mem.memNick}</li>
                        <li class="qna-fo">작성일</li>
                        <li class="qna-li">
                            <fmt:parseDate var="time" value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${time}" pattern="yyyy년MM월dd일" />
                        </li>

                    </ul>


                    <div class="mb-pet" style="display: flex;">
                        <div class="mb-left">
                            <div class="mb-petpic">
                                <!-- PET_NUM으로 조회된 PET_PHOTO -->
                                <img src="../img/intro-petwalkswitch-02.png" alt="사진" width="100%" height="100%">
                            </div>
                        </div>
                        <div class="mb-petinfo">
                            <div class="mb-petname">
                                <div id='pet-nameselect' style="border: none;">${pet.petName}</div>
                            </div>
                            <div class="mb-intro">소개</div>
                            <p style="border: none; background-color: white;">${pet.petIntro}</p>
                            <ul>
                                <!-- PET_NUM으로 조회된
                     PET_BREED, PET_GNEDER, PET_AGE, PET_WEIGHT를 불러온다. -->
                                <div style="font-size: 15px;">만날장소: ${board.boardAddress}</div>
                                <li class="pet-category">#${pet.petBreed}</li>
                                <li class="pet-gender">#${pet.petGender}아</li>
                                <li class="pet-age">#${pet.petAge}살</li>
                                <li class="pet-weight">#${pet.petWeight}kg</li>

                            </ul>
                        </div>
                    </div>


                    <div class="qna-content">
                        <p>${board.boardContent}
                        </p>

                    </div>
                    <hr>
                    <c:if test="${lo.memNum == board.memNum}">
                        <form action="delete.main" method="post" style="float:right; width: 100px;">
                            <input type="hidden" name="boardNum" value=${board.boardNum}>
                            <div class="mb-submit">
                                <input type="submit" value="삭제" style="width: 80%;">
                            </div>
                        </form>
                        <form action="modify.main" method="post" style="float:right; width: 100px;">
                            <input type="hidden" name="boardNum" value=${board.boardNum}>
                            <div class="mb-submit">
                                <input type="submit" value="수정" style="width: 80%;">
                            </div>
                        </form>


                        </div>
                    </c:if>

                    <div>
                        <c:forEach var="apply" items="${apply}">
                            <div class="qna-box">
                                <div class="qna-left">
                                    <div class="qna-pfimg">
                                    </div>
                                </div>
                                <div class="qna-right">
                                    <ul class="qna-top">
                                        <li>${apply.memNum}</li>
                                        <li>${apply.applyDate}</li>
                                    </ul>
                                    <p>${apply.applyContent}</p>
                                    <div class="qna-btn">
                                        <c:if test="${lo.memNum == apply.memNum}">

                                            <div>
                                                <!-- <button type="button">수정</button> -->
                                                <form action="applydelete.main">
                                                    <input type="hidden" name="applyNum"
                                                        value="${apply.applyNum}"></input>
                                                    <input type="submit" class="applyDelBtn" value="삭제"
                                                        style="cursor: pointer; color: white ;padding: 5px 10px; border-radius: 10px; background-color: rgb(248, 130, 87) ;"></button>
                                                </form>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <form action="boardregist.main" method="post">
                        <input type="hidden" name="boardNum" value="${board.boardNum}">
                        <textarea name="applyContent" id="qna-reply" placeholder="댓글달기"></textarea>
                        <div class="mb-submit">
                            <input type="submit" value="등록">
                        </div>
                    </form>
                    </div>

                </section>

                <ul class="near_list mt20">
                    <li>
                        <h4 class="prev">다음글</h4><a href="">안녕하세요!</a>
                    </li>
                    <li>
                        <h4 class="next">이전글</h4><a href="">이전글입니다!</a>
                    </li>
                </ul>

                <script>
                    var petGender = document.querySelector('.pet-gender');
                    var petAge = document.querySelector('.pet-age');
                    var petWeight = document.querySelector('.pet-weight');
                    var submit = document.querySelector('.mb-submit');
                    var reply = document.querySelector('.qna-reply');

                    //태그 숨기기기
                    (function () {


                        if (petGender.innerHTML == "#아") {

                            petGender.style.display = "none";
                        }
                        if (petAge.innerHTML == "#0살") {
                            petAge.style.display = "none";
                        }
                        if (petWeight.innerHTML == "#0kg") {
                            petWeight.style.display = "none";
                        }
                    })();

                    
                    //댓글 삭제
                    submit.onclick = function () {
                        console.log(event.target.tagName);
                        if (event.target.tagName != "INPUT") return;
                        if (confirm('게시글을 삭제 하시겠습니까?')) {
                            alert('삭제 되었습니다.');
                        } else {
                            event.preventDefault();
                        }

                    }
                    reply.onclick = function () {
                        console.log(event.target.tagName);
                        if (event.target.tagName != "INPUT") return;
                        if (confirm('삭제 하시겠습니까?')) {
                            alert('삭제 되었습니다.');
                        } else {
                            event.preventDefault();
                        }

                    }


                </script>

                <%@ include file="../include/footer.jsp" %>