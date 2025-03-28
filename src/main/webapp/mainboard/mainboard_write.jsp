<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

                <link rel="stylesheet" href="../css/support_qna_write.css"> <!-- css파일 같은거 쓰신듯 해서 일단은 같은 링크로 참조했어요 -->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
    <style>*{font-family: "Poor Story", system-ui;}</style>
    

                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음 주소 API -->
                <script
                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e329318ea424d674ffdf93ab824bc5ba&libraries=services"></script>
            </head>



                <section>
                    <form action="regist.main" class="mb-form" method="post">
                        <div style="display: none;" name="memNum"></div>
                        <ul class="mb-name">
                            <li><input type="text" placeholder="제목" name="title"> </li>

                            <li><button type="button" id="mb-btn">구인하기</button></li>

                        </ul>


                        <ul class="mb-address">

                            <li style="width: 300px;">
                                <input type="text" id="sample5_address" placeholder="주소" style="width: 300px;"
                                    value="${dto.memAddress}" name="address" readonly>
                                <input type="text" style="width: 200px; margin-top: 10px;" placeholder="상세주소" name = "addressDetail">
                            </li>
                            <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="mb-map">
                            <!-- BOARD테이블의 PAY로 넘어갈 FORM -->
                            <li>의뢰금액<input id="pay" type="text" placeholder="금액을 작성 해주세요." name="pay"></li>
                        </ul>
                        <div id="map" style="width:70%;height:300px;margin-top:10px;display:none"></div>


                        <!-- 주소받기 api -->
                        <script>
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                mapOption = {
                                    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                    level: 5 // 지도의 확대 레벨
                                };

                            //지도를 미리 생성
                            var map = new daum.maps.Map(mapContainer, mapOption);
                            //주소-좌표 변환 객체를 생성
                            var geocoder = new daum.maps.services.Geocoder();
                            //마커를 미리 생성
                            var marker = new daum.maps.Marker({
                                position: new daum.maps.LatLng(37.537187, 127.005476),
                                map: map
                            });
                            // 마커에 주소 표시하기기
                            var infowindow = new daum.maps.InfoWindow({
                                content: '<div style="padding:5px; width:100% ">주소를 선택하세요</div>'
                            });


                            function sample5_execDaumPostcode() {
                                new daum.Postcode({
                                    oncomplete: function (data) {
                                        var addr = data.address; // 최종 주소 변수

                                        // 주소 정보를 해당 필드에 넣는다.
                                        document.getElementById("sample5_address").value = addr;
                                        // 주소로 상세 정보를 검색
                                        geocoder.addressSearch(data.address, function (results, status) {
                                            // 정상적으로 검색이 완료됐으면
                                            if (status === daum.maps.services.Status.OK) {

                                                var result = results[0]; //첫번째 결과의 값을 활용

                                                // 해당 주소에 대한 좌표를 받아서
                                                var coords = new daum.maps.LatLng(result.y, result.x);
                                                // 지도를 보여준다.
                                                mapContainer.style.display = "block";
                                                map.relayout();
                                                // 지도 중심을 변경한다.
                                                map.setCenter(coords);
                                                // 마커를 결과값으로 받은 위치로 옮긴다.
                                                marker.setPosition(coords)

                                                //마커에 주소표시하기
                                                infowindow.setContent('<div style="padding:5px; font-size:10px;">' + addr + '</div>');
                                                infowindow.open(map, marker);
                                            }
                                        });
                                    }
                                }).open();
                            }
                        </script>


                        <!-- MEM_NUM 으로 조회된 PET테이블의 
             P                  ET_ISMAIN이 'Y'인 PET_NUM 을 불러온다.   -->
                        <div class="mb-pet">

                            <input id="boardtype" type="text" name="boardType" style="display: none;" value="P">

                            <div class="mb-left">
                                <div class="mb-petpic">
                                    <!-- PET_NUM으로 조회된 PET_PHOTO -->
                                    <img src="../img/intro-petwalkswitch-02.png" alt="사진" width="100%" height="100%">
                                </div>
                            </div>
                            <div class="mb-petinfo">
                                <div class="mb-petname">
                                    <select name="petNum" id="pet-nameselect" value = "null">
                                        <!-- MEM_NUM으로 조회된 PET테이블의
                                            PET_NUM과 PET_NAME을 불러오고,
                                           모든PET_NAME을 띄워준다. -->
                                        <c:forEach var="pet" items="${pet}">
                                            <option value="${pet.petNum}">${pet.petName}</option>
                                        </c:forEach>

                                    </select>

                                </div>
                                <div class="mb-intro">소개</div>
                                <!-- PET_NUM으로 조회된 PET_INTRO를 불러온다. -->
                                <p>${pet[0].petIntro}</p>
                                <ul>
                                    <!-- PET_NUM으로 조회된
                         PET_BREED, PET_GNEDER, PET_AGE, PET_WEIGHT를 불러온다. -->
                                    <li class="pet-category">#${pet[0].petBreed}</li>
                                    <li class="pet-gender">#${pet[0].petGender}아</li>
                                    <li class="pet-age">#${pet[0].petAge}살</li>
                                    <li class="pet-weight">#${pet[0].petWeight}kg</li>
                                </ul>
                            </div>
                        </div>
                        </div>

                        <div class="mb-content">
                            <!-- BOARD테이블의 BOARD_CONTENT로 넘어갈 FORM -->
                            <textarea placeholder="내용" class="mb-intro" name="content"></textarea>
                        </div>
                        <div class="mb-submit">
                            <!-- BOARD_TYPE,BOARD_TITLE,REGDATE,BOARD_CONTENT,PAY,MEMNUM이 등록 -->
                            <input type="submit" value="등록">
                        </div>
                    </form>
                </section>

                <script>

                    var btn = document.getElementById('mb-btn');
                    var pet = document.querySelector('.mb-pet')
                    var submit = document.querySelector('.mb-submit');
                    var addressbtn = document.getElementById('address-btn');
                    var boardtype = document.getElementById('boardtype');
                    var petSelect = document.getElementById('pet-nameselect')



                    //구인/구직
                    btn.onclick = function () {
                        /*
                        버튼을 눌렀을때 사용자의 MEM_TYPE을 받는다.
                        MEM_TYPE이 P면 "등록된 반려동물이 없습니다. ALERT창을 띄운다."
                        MEM_TYPE이 U면 아래 스크립트를 실행한다.
                        */
                        var memType = "${dto.getMemType()}";
                        var pette = "${pet[0].getPetNum()}";

                        if (memType == 'P') {
                            alert('등록된 반려동물이 없습니다.');
                            return;
                        }


                        pet.classList.toggle('active');
                        if (pet.classList.contains('active')) {
                            btn.innerHTML = '구직하기';
                            pet.style.display = 'flex';
                            boardtype.value = "U";
                            petSelect.value = pette;
                        } else {
                            btn.innerHTML = '구인하기';
                            pet.style.display = 'none';
                            boardtype.value = "P";
                            petSelect.value = "null";
                        }
                    }

                    //반려동물 선택
                    petSelect.onchange = function () {
                        var petNum = petSelect.value;
                        var pets = petList.find(pet => pet.petNum == petNum);

                        if (pets) {
                            document.querySelector('.pet-category').textContent = '#${pets.petBreed}';
                            document.querySelector('.pet-gender').textContent = '#${pets.petGender}아';
                            document.querySelector('.pet-age').textContent = '#${pets.petAge}살';
                            document.querySelector('.pet-weight').textContent = '#${pets.petWeight}kg';

                        }

                    }

                    //등록
                    submit.onclick = function () {
                        if (document.querySelector('.mb-name input').value == "") {
                            event.preventDefault();
                            alert('제목을 입력해주세요.');
                            return;
                        }
                        if (document.querySelector('textarea').value == "") {
                            event.preventDefault();
                            alert('내용을 입력해주세요.');
                            return;
                        }
                        if (!/^\d+$/.test(document.querySelector('#pay').value)) {
                            event.preventDefault();
                            alert('숫자만 입력해주세요.');
                            return;
                        }
                        if (event.target.tagName != "INPUT") return;
                        if (confirm('등록하시겠습니까?')) {
                            alert('등록되었습니다.');
                        } else {
                            event.preventDefault();
                        }

                    }



                </script>

<%@ include file="../include/footer.jsp" %>