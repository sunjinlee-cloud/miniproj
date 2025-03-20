<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/mypage.css" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">

    
</head>
<body>
    
    <header>
        <ul class = "menu">
            <li style="float: left;"><a href=""><img src="../img/mainlogo.png" alt="logo" width="100px"></a></li>
            <li><a href="">로그아웃</a></li>
            <li><a href="">고객지원</a></li>
        </ul>
    </header>

    <section>
    	<form method="post">
	        <div class="Mypage">
	            <div class="box">
                    <div class="profile-img">
                        <img src="../img/free-icon-user-847969.png"  alt="프로필이미지">
                        <button type="button">이미지 추가</button>

                    </div>
    
                    <ul class="list">
    
                        <li class="listbox">
                            <p class="desc">비밀번호 변경</p>
                            <input type="password" id="password" placeholder="비밀번호를 입력하세요" > 
                        
                        </li>
                        <li>
                            <p class="desc">비밀번호 검사</p>
                            <input type="password" class="passwordCheck" placeholder="비밀번호를 입력하세요">
                        </li>
                        <li class="listbox">
                            <p class="desc">닉네임변경</p>
                            <input type="text" class="nickname" placeholder="ID를 입력하세요">        
                        </li>
                        <li>
                            <p class="desc">주소</p>
                            <input type="text" class="address" placeholder="주소를 입력하세요">
                        </li>
                        <li>
                            <p class="desc">연락처</p>
                            <input type="text" class="phone" placeholder="전화번호를 입력하세요">
                        </li>
                        <li class="texta">
                            <textarea name="intro" id="intro" placeholder="자기소개"></textarea>
                        </li>
                    </ul>  
            </div>

            <div class="addbtn">
                <button type="button">반려동물 정보추가</button>
            </div>   
       </div>

       

       <div class="Mypage2">
        <div class="line">
            <hr>
       </div>  
        <div class="box2">
                <div class="profile-img2">
                    <img src="../img/dog-seating.png"alt="강아지 프로필이미지">
                    <button type="button">이미지 추가</button>
                </div>

                <ul class="list">
                	<li class="listbox">
                        <p class="desc">반려동물 이름</p>
                        <input type="text" class="name" placeholder="동물이름을 입력하세요"> 
                    </li>
                    <li>
                        <p class="desc">견종</p>
                        <input type="password" class="patType" placeholder="견종을 입력하세요">
                    </li>
                    
                    <li>
                        <p class="desc">나이</p>
                        <input type="text" class="age" placeholder="나이를 입력하세요">
                    </li>
                    <li>
                        <p class="desc">몸무게</p>
                        <input type="text" class="weight" placeholder="전화번호를 입력하세요">
                    </li>
                    <li>
                        <p class="desc">성별</p> 
                        <input type="radio" id="male" name="gender" value="M" class="rad">
                        <label for="male" class="gen">남</label>
                        <input type="radio" id="female" name="gender" value="F" class="rad">
                        <label for="female" class="gen">여</label>
                    </li>
                    <li>
                        <p class="desc">대표동물 여부</p>
                        <input type="radio" id="yes" name="animal" value="Y" class="rad">
                        <label for="male" class="yes">네</label>
                        <input type="radio" id="NO" name="animal" value="N" class="rad">
                        <label for="female" class="no">아니요</label>   
                    </li>
                    <li class="texta">
                            <textarea name="intro" id="intro" placeholder="동물소개"></textarea>
                    </li>
                </ul>
                <div class="submitBtn">
			    	<button type="submit" id="btn1" onclick="javascript:form.action='users/delete.users'">회원탈퇴</button>
			    	<button type="submit" id="btn2" onclick="javascript:form.action='users/modify.users'">정보수정</button> 
			    </div>
        	</div>
   		</div>
    	</form> 
    </section>

    


    <footer>
        <div class="underminimenu">
            <ul style="">
                <li><a href="">소개</a></li>|
                <li><a href="">메인서비스</a></li>|
                <li><a href="">고객지원</a></li>|
                <li><a href="">이용약관</a></li>|
                <li><a href="">개인정보처리방침</a></li>
            </ul>
            <p>(주)모르는개산책 | 대표 박인욱 | 서울 강남구 테헤란로7길 7 (역삼동) 5층 | 대표 전화번호 : 010-1234-1234

                소개 / 메인게시판 / 고객지원 / 이용약관 / 개인정보처리방침
                
                사업자 등록 번호 : 123-45-67890 | 동물자유연대 | 농림축산검역본부
                
                </p>
        </div>
        <div class="infoarea">
            <p>Copyright 2025 Pet © All rights reserved.</p>
        </div>
    </footer>


    <script>
        var addbtn = document.querySelector(".addbtn button")
        var pet = document.querySelector(".Mypage2");
        var btn1 = document.getElementById("btn1")
        var btn2 = document.getElementById("btn2");

        addbtn.onclick = function(){
            pet.classList.toggle('active');
            
            if(pet.classList.contains('active')){
                addbtn.innerHTML = "취소";
                
            }else{
                addbtn.innerHTML = "반려동물 정보추가";
                
            }
        }
        btn1.onclick = function() {
            if (confirm('정말 회원을 탈퇴하시겠습니까?')) {
                alert('회원 탈퇴가 완료되었습니다.');
            }
        }
        btn2.onclick = function() {
           if(confirm('정보를 수정하시겠습니까?')) {
            alert('정보가 수정 되었습니다')
           }
                
        }

        function validateForm() {
    var password = document.getElementById("password").value;
    var passwordCheck = document.getElementById("passwordCheck").value;
    var errorMessage = document.getElementById("error-message");

    if (password.length < 6) {
        errorMessage.innerText = "비밀번호는 최소 6자 이상이어야 합니다.";
        return false;
    }
    
    if (password !== passwordCheck) {
        errorMessage.innerText = "비밀번호가 일치하지 않습니다.";
        return false;
    }

    alert("입력 검사가 완료되었습니다!");
    return true;
}

       
    

    </script>








    
</body>
</html>