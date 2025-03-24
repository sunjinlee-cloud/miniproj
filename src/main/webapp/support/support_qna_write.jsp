<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    if (session.getAttribute("UsersDTO") == null) {
%>
<script>
    alert('로그인이 필요한 서비스입니다');
    location.href='<%= request.getContextPath() %>/users/login.jsp';
</script>
<%
        return;
    }
%>

<%@ include file="../include/header.jsp" %>



<link rel="stylesheet" href="../css/support_qna_write.css">


<body>
<section>
<div class="nav">
    <a href="${pageContext.request.contextPath}/support/support_notice_list.jsp" class="navmenu">공지사항</a>
    <a href="${pageContext.request.contextPath}/support/support_faq.jsp" class="navmenu">FAQ</a>
    <a href="${pageContext.request.contextPath}/support/qna_list.qna" class="navmenu">1대1 문의</a>
</div>
<div class="support-banner">
    <img src="${pageContext.request.contextPath}/img/support_banner.jpg" alt="고객지원 배너">
</div>
    <div class="container">
        <p class="qna">문의하기</p>
        <hr style="margin-bottom: 30px;">

        <c:choose>
            <c:when test="${not empty qna}">
                <form action="${pageContext.request.contextPath}/support/qna_update.qna" method="post" id="qnaForm">
                    <input type="hidden" name="qnaNum" value="${qna.qnaNum}">
                    <input type="hidden" name="memNum" value="${qna.memNum}">
            </c:when>
            <c:otherwise>
                <form action="${pageContext.request.contextPath}/support/qna_insert.qna" method="post" id="qnaForm">
                    <input type="hidden" name="memNum" value="${sessionScope.UsersDTO.memNum}">
            </c:otherwise>
        </c:choose>

            <ul class="mb-name">
                <li>
                    <c:choose>
                        <c:when test="${not empty qna}">
                            <input type="text" name="qnaTitle" value="${qna.qnaTitle}">
                        </c:when>
                        <c:otherwise>
                            <input type="text" name="qnaTitle" placeholder="제목">
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>

            <div class="mb-content">
                <c:choose>
                    <c:when test="${not empty qna}">
                        <textarea name="qnaContent">${qna.qnaContent}</textarea>
                    </c:when>
                    <c:otherwise>
                        <textarea name="qnaContent" class="mb-intro" placeholder="글내용"></textarea>
                    </c:otherwise>
                </c:choose>
            </div>

			<div class="qna-submit-wrap">
    <c:choose>
        <c:when test="${not empty qna}">
            <button type="submit" class="qna-submit-btn">수정</button>
        </c:when>
        <c:otherwise>
            <button type="submit" class="qna-submit-btn">등록</button>
        </c:otherwise>
    </c:choose>
</div>
			
            
        </form>
    </div>
</section>

<script>
    document.getElementById('qnaForm').addEventListener("submit", function(e) {
        if (!confirm('저장하시겠습니까?')) {
            e.preventDefault();
        }
    });
</script>

<%@ include file="../include/footer.jsp" %>