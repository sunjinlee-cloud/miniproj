<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>	

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입 :: 모르는개산책</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
    <style>
        *{margin: 0; padding: 0;box-sizing: border-box; font-family: "Poor Story", system-ui; font-weight: 300;}
        body{ width: 1000px;margin: 0 auto;}
        ul{list-style: none;}
        li{display: inline-block;}
        a{color: black; text-decoration: none;}
        


        .box {text-align: center; margin-bottom: 100px;}
        .box .title {margin: 30px;}
        .box .card {padding: 10px; text-align: left; width: 50%; margin: 0 auto;}
        h2 {font-weight: 600;}
        .desc {display: inline-block; width: 120px; font-weight: 500;}
        
        .littlebox {overflow: hidden;}
        .littlebox .isMultiple.id {float: right;}
        .list li {display: block; padding: 10px;}
        input {width: 150px;}
        .id {width: 100px;} .mail{width: 50px;}
        .idCheck {width: 60px; height: 21px;}
        .phoneCheck {width: 60px; height: 21px;}
        .mailSelect {width: 50px;}
        .mailDomain {width: 70px;}
        .notSame {display: inline-block; color: red; opacity: 0; margin-left: 150px;}
        .rad {width: 10px;}
        .gen {margin-right: 30px; width: 10px;}
        .texta {height: 100px;}
        #intro {width: 100%; height: 100%; margin: 0 auto; resize: none;}
        .submitBtn {border: 2px solid #F88257; background-color: #F88257; color: aliceblue; border-radius: 5%;
        	width: 50px; margin-left:44%;}
    </style>
</head>
<body> <!-- 선진 -->

    <section class="box">
        <div class="title"><h2>모르는 강아지와 산책하기</h2></div>
        <div class="card">
            <form action="joinForm.users" method="post" onsubmit="return requiredCheck()">
                <ul class="list">
                    <li class="littlebox">
                        <p class="desc">ID(EMAIL)</p><input type="text" class="id" placeholder="이메일을 입력하세요" name="id">@
                        <input type="text" class="mailDomain" placeholder="이메일을 입력하세요" name="mailDomain">
                        <select name="mailSelect" id="mailSelect">
                            <option value="selfWritten">직접 입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="nate.com">nate.com</option>
                        </select>
                        <button type="button" class="idCheck">중복 확인</button>
                    </li>
                    <li>
                        <p class="desc">비밀번호</p><input type="password" class="pw" placeholder="비밀번호를 입력하세요" name="memPw">
                    </li>
                    <li >
                        <p class="desc">재입력</p><input type="password" class="pw2" placeholder="비밀번호를 한번 더 입력하세요"> 
                        <div class="notSame">비밀번호가 일치하지 않습니다.</div>
                    </li>
                    <li class="littlebox">
                        <p class="desc">닉네임</p><input type="text" class="nickname" placeholder="닉네임을 입력하세요" name="memNick"> 
                    </li>
                    <li>
                        <p class="desc">주소</p><input type="text" id="sample6_postcode" placeholder="우편번호">
                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 70px;"><br>
                        <input type="text" id="sample6_address" placeholder="주소" style="margin-left: 120px;"
                        	name="sample6_address"><br>
                        <!--<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="margin-left: 120px;"
                        	name="sample6_detailAddress">-->
                        <!--<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="margin-left: 120px;
                            display: block;">-->
                    </li>
                    <li>
                        <p class="desc">연락처</p><input type="text" class="phone" placeholder="전화번호를 입력하세요" name="memPhone">
                        <button type="button" class="phoneCheck">중복 확인</button>
                    </li>
                    <li>
                        <p class="desc">성별</p> 
                        <input type="radio" id="male" name="gender" value="M" class="rad" checked><label for="male" class="gen">남</label>
                        <input type="radio" id="female" name="gender" value="F" class="rad"><label for="female" class="gen">여</label>
                    </li>
                    <li class="texta">
                        <textarea name="intro" id="intro" placeholder="자기소개(선택)" name="memIntro"></textarea>
                    </li>
                </ul>
                <div class="under"><button type="submit" class="submitBtn">가입하기</button></div>
            </form>
        </div>
        
    </section>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
        function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    //if(extraAddr !== ''){
                    //    extraAddr = ' (' + extraAddr + ')';
                    //}
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    } </script>
    
    <script>
    
        var pw = document.querySelector(".pw");
        var pw2 = document.querySelector(".pw2");
        var notSame = document.querySelector(".notSame");

        var mailPrev = document.querySelector(".id");
        var mailDomain = document.querySelector(".mailDomain");
        var mailSelect = document.getElementById("mailSelect");

        mailSelect.onchange = function() { //메일 도메인 주소 직접입력 혹은 지정된 값 입력
            if (mailSelect.value == "selfWritten") {
                mailDomain.value = "";
            } else {
                mailDomain.value = mailSelect.value;
            }
        }
		
        
        var idCheck = document.querySelector(".idCheck");
        var phoneCheck = document.querySelector(".phoneCheck");
        var phone = document.querySelector(".phone");
        var isIdChecked = false;
        var isPhoneChecked = false;
        
        idCheck.onclick = function () {
        	mailPrev = document.querySelector(".id");
        	mailDomain = document.querySelector(".mailDomain");
        	var wholeMail = mailPrev.value+"@"+mailDomain.value;
        	fetch("idCheck.users", {
        		method:"post",
        		headers: {
        			'Content-type': 'application/x-www-form-urlencoded'
        		},
        		body:"id="+wholeMail
        	}).then(function(response) {
				return response.json();
			})
			.then(function(data) {
				console.log(data);
				
				if(data == 1) {
					alert("이미 사용중인 아이디입니다.");
					mailPrev.value="";
				} else {
					isIdChecked = true;
					alert("사용 가능한 아이디입니다.");
					
				}
			})
			
			
        };
        
        phoneCheck.onclick = function () {
        	if(phone.value=="") {
        		alert("전화번호를 입력해 주세요");
        		return;
        	}
        	fetch("phoneCheck.users", {
        		method:"post",
        		headers: {
        			'Content-type': 'application/x-www-form-urlencoded'
        		},
        		body:"phone="+phone.value
        		}).then(function(response) {
        			return response.json();
        		}).then(function(data) {
        			console.log(data);
        			
        			if(data == 1) {
    					alert("이미 사용중인 전화번호입니다.");
    					phone.value="";
    				} else {
    					isPhoneChecked = true;
    					alert("사용 가능한 전화번호입니다.");
    				}
        	})
        };

               
 
        	
        pw2.onblur = function () { //비밀번호 입력받는 칸 2개 값이 서로 다를때 <비밀번호가 일치하지 않습니다> 출력
            if (pw2.value != pw.value) {
                pw2.value = "";
                notSame.style.opacity = 1;
            } else {
                notSame.style.opacity = 0;
            }
        }

         //핸드폰번호에서 '-'제거
        phone.onblur = function() {
            var checked = phone.value.replace(/-/g ,"");
            phone.value = checked;
        }
	
        
        function requiredCheck() {
        	if (!isIdChecked) {
        		alert("아이디 중복 체크를 해 주세요.");
        		return false;
        	} else if (pw2 == null) {
        		alert("비밀번호를 알맞게 재입력해 주세요.");
        		return false;
        	} else if(!isPhoneChecked) {
        		alert("연락처 중복 체크를 해 주세요.")
        		return false;
        	}
        }
        
    </script>
   
</body>
</html>

<%@ include file="../include/footer.jsp" %>	