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
    </style>
</head>
<body>

    <header>
        <ul class = "menu">
            <!--  <li style="float: left;"><a href="${pageContext.request.contextPath}/mainboard/mainboard_list.jsp"><img src="../img/mainlogo.png" alt="logo" width="100px"></a></li> -->
            <c:choose>
					<c:when test="${sessionScope.UsersDTO == null}">
					<li style="float: left;"><a href="${pageContext.request.contextPath}/introduction.jsp"><img src="../img/mainlogo.png" alt="logo" width="100px"></a></li>
						<li><a href="${pageContext.request.contextPath}/users/login.jsp">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/users/join.jsp">회원가입</a></li>
					</c:when>
					<c:otherwise> 
					<li style="float: left;"><a href="${pageContext.request.contextPath}/mainboard/mainboard_list.jsp"><img src="../img/mainlogo.png" alt="logo" width="100px"></a></li>
						<li><a href="#" class="logout">로그아웃</a></li>
						<li><a href="${pageContext.request.contextPath}/users/mypage.jsp">마이페이지</a></li>
						<li><a href="${pageContext.request.contextPath}/support/support_notice_list.html">고객지원</a></li>
					</c:otherwise>
			</c:choose>
        </ul>
    </header>

    <script>
        var logout = document.querySelector(".logout");

        logout.onclick = function() {
            event.preventDefault();
            if (confirm("로그아웃 하시겠습니까?")) {
            	
                //fetch("/users/logout.users");
            	location.href="logout.users";
            }
        }

    </script>

</body>
</html>