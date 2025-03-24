<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/mypage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
</head>
<body>

    <div class="Mypage">
        <form action="modify.users" method="post" onsubmit="return validateForm()">
            <div class="box">
                <div class="profile-img">
                        <img src="../img/free-icon-user-847969.png"  alt="프로필이미지">
                        <button type="button" class="addUserImg">이미지 추가</button>
                </div>
                <ul class="list">
                    <li class="listbox">
                        <p class="desc">비밀번호 변경</p>
                        <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" > 
                    </li>
                    <li>
                        <p class="desc">비밀번호 검사</p>
                        <input type="password" id="passwordCheck" class="passwordCheck" placeholder="비밀번호를 입력하세요">
                    </li>
                    <li class="listbox">
                        <p class="desc">닉네임변경</p>
                        <input type="text" class="nickname" name="nickname" value="${UsersDTO.memNick}">        
                    </li>
                    <li>
                        <p class="desc" style="width: 145px;">주소</p>
                            <input type="text" id="sample6_postcode" placeholder="우편번호">
                            <input type="button" onclick="sample6_execDaumPostcode()" value="찾기" style="width: 40px; font-size: 15px;"><br>
                            <input type="text" id="sample6_address" placeholder="주소" style="margin-left: 125px; width:220px; font-size: 12px;"
                                name="sample6_address" value="${UsersDTO.memAddress}"><br>
                            <!--<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="margin-left: 106px;"
                                name="sample6_detailAddress">-->
                    </li>
                    <li>
                        <p class="desc">연락처</p>
                        <input type="text" class="phone" name="phone" value="${UsersDTO.memPhone}">
                    </li>
                    <li class="texta">
                        <textarea name="intro" id="intro" name="intro" value="${UsersDTO.memIntro}"></textarea>
                    </li>
               </ul>
            </div>
            <div class="submitBtn">
                <button type="submit" id="modifyBtn" onsubmit="return validateForm()">정보수정</button>
            </div>
        </form>

        <div class="addbtn">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" 
                style="background-color: #F88257; border: 2px solid #F88257;">
                반려동물 정보 추가하기
            </button>
        </div> 

        
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="exampleModalLabel">반려동물 정보추가</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="modal-body">
                        <form id="addPet" method="post">
                        <p><div class="profile-img2">
                          <img src="../img/dog-seating.png"alt="강아지 프로필이미지">
                          <button type="button" class="addPetImg">이미지 추가</button>
                      </div>
  
                      <ul class="list">
                          <li class="listbox">
                              <p class="desc">반려동물 이름</p>
                              <input type="text" class="petName" name="petName" placeholder="동물이름을 입력하세요" required> 
                          </li>
                          <li>
                              <p class="desc">견종</p>
                              <input type="text" class="petType" name="petType" placeholder="견종을 입력하세요" required>
                          </li>
                          <li>
                              <p class="desc">나이</p>
                              <input type="number" class="petAge" name="petAge" placeholder="나이를 입력하세요" min="0" max="30">
                          </li>
                          <li>
                              <p class="desc">몸무게</p>
                              <input type="number" class="petWeight" name="petWeight" placeholder="몸무게를 입력하세요" min="1" max="50">
                          </li>
                          <li>
                              <p class="desc">성별</p> 
                              <input type="radio" id="male" name="gender" value="M" class="rad gender" checked>
                              <label for="male" class="gen">남</label>
                              <input type="radio" id="female" name="gender" value="F" class="rad gender">
                              <label for="female" class="gen">여</label>
                          </li>
                          <li>
                              <p class="desc">대표동물 여부</p>
                              <input type="radio" id="yes" name="petIsmain" value="Y" class="rad petIsmain" checked>
                              <label for="male" class="yes">네</label>
                              <input type="radio" id="NO" name="petIsmain" value="N" class="rad petIsmain">
                              <label for="female" class="no">아니요</label>
                          </li>
                          <li class="texta">
                                  <textarea class="petIntro" id="petIntro" placeholder="동물소개"></textarea>
                          </li>
                      </ul></p>
                      </form>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-primary addPet" style="background-color: #F88257; border: 1px solid #F88257;"
                    form="addPet">추가하기</button>
                </div>
              </div>
            </div>
        </div>
   
        <form action="delete.users" method="post" onsubmit="return confirm('정말 탈퇴하시겠습니까?');" style="margin-top: 50px;">
            <div class="submitBtn">
            <button type="submit" id="deletBtn">회원탈퇴</button>
            </div>
        </form>
    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
        function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                } else {
                    
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
        }
    </script>

    <script>

        var modal = document.getElementById("exampleModal");
    	var addForm = document.getElementById("addPet");
    	modal.addEventListener('shown.bs.modal', function() {
    		addForm.reset();
    	 	console.log(modal);
    	 	console.log("그만하고싶다");
    	});

        document.addEventListener('DOMContentLoaded', function() {
            var addPet = document.querySelector(".addPet");
            addPet.onclick = function() {
                console.log("mypage2");

                var petName = document.querySelector(".petName").value;
                var petPhoto = "사진을 업로드해주세요";
                var petBreed = document.querySelector(".petType").value;
                var petAge = document.querySelector(".petAge").value;
                var petWeight = document.querySelector(".petWeight").value;
                var petGender = document.querySelector(".gender").value;
                var petIsmain = document.querySelector(".petIsmain").value;
                var petIntro = document.querySelector(".petIntro").value;

                fetch("addPet.pet", {
                    method: "post",
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    body: "petName=" + encodeURIComponent(petName) + "&" +
                            "petPhoto=" + encodeURIComponent(petPhoto) + "&" +
                            "petBreed=" + encodeURIComponent(petBreed) + "&" +
                            "petAge=" + encodeURIComponent(petAge) + "&" +
                            "petWeight=" + encodeURIComponent(petWeight) + "&" +
                            "petGender=" + encodeURIComponent(petGender) + "&" +
                            "petIsmain=" + encodeURIComponent(petIsmain) + "&" +
                            "petIntro=" + encodeURIComponent(petIntro)
                }).then(function(response) {
		            return response.json();  
		        }).then(function(data) {
                    console.log(data);  
                    if(data == 1) {
                        alert("성공적으로 추가되었습니다.");
                    } else {
                        alert("다시 시도해 주세요.");
                        }
		    	})
            }
        });


        function validateForm() {
	        var password = document.getElementById("password").value;
	        var passwordCheck = document.getElementById("passwordCheck").value;
	        var errorMessage = document.getElementById("error-message");
	
	        if (password.length < 3) {
	            errorMessage.innerText = "비밀번호는 최소 4자 이상이어야 합니다.";
	            return false;
	        }
	        
	        if (password !== passwordCheck) {
	            errorMessage.innerText = "비밀번호가 일치하지 않습니다.";
	            return false;
	        }
	
	        return true;
	    };

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
</html>

<%@ include file="../include/footer.jsp" %>