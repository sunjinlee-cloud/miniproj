<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/support_qna_write.css"> <!-- css파일 같은거 쓰신듯 해서 일단은 같은 링크로 참조했어요 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음 주소 API -->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
    <style>*{font-family: "Poor Story", system-ui;}</style>
                <script
                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e329318ea424d674ffdf93ab824bc5ba&libraries=services"></script>

                <section>
                    <form action="update.main" class="mb-form" method="post">
                       	<input type="hidden" name="boardNum" value= "${dto.boardNum}" >
                        <ul class="mb-name">
                            <li><input type="text" placeholder="제목" name="title" value = "${dto.boardTitle}"> </li>
                        </ul>
                        <ul class="mb-address">

                            <li style="width: 300px;">
                                <input type="text" id="sample5_address" placeholder="주소" style="width: 300px;"
                                    value = "${dto.boardAddress}" name="address" readonly>
                                <input type="text" style="width: 200px; margin-top: 10px;" placeholder="상세주소" name = "addressDetail" >
                            </li>
                            <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="mb-map">
                            <!-- BOARD테이블의 PAY로 넘어갈 FORM -->
                            <li>의뢰금액<input id="pay" type="text" placeholder="금액을 작성 해주세요." name="pay" value = "${dto.pay}"></li>
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
                        <div class="mb-content">
                            <!-- BOARD테이블의 BOARD_CONTENT로 넘어갈 FORM -->
                            
                            <textarea  class="mb-intro" name="content"><c:out value="${dto.boardContent}" /></textarea>
                        </div>
                        <div class="mb-submit">
                            <!-- BOARD_TYPE,BOARD_TITLE,REGDATE,BOARD_CONTENT,PAY,MEMNUM이 등록 -->
                            <input type="submit" value="수정">
                        </div>
                    </form>
                </section>

                <script>
                var submit = document.querySelector('.mb-submit');
                
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
                        if (confirm('수정하시겠습니까?')) {
                            alert('수정되었습니다.');
                        } else {
                            event.preventDefault();
                        }

                    }



                </script>

<%@ include file="../include/footer.jsp" %>               