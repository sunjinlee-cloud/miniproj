<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%@ include file="../include/header.jsp" %>



<link rel="stylesheet" href="../css/support_notice_write.css">


<body>
<section>
<div class="nav">
    <a href="${pageContext.request.contextPath}/support/support_notice_list.jsp" class="navmenu">공지사항</a>
    <a href="${pageContext.request.contextPath}/support/support_faq.jsp" class="navmenu">FAQ</a>
    <a href="${pageContext.request.contextPath}/support/notice_list.notice" class="navmenu">1대1 문의</a>
</div>
<div class="support-banner">
    <img src="${pageContext.request.contextPath}/img/support_banner.jpg" alt="고객지원 배너">
</div>
    <div class="container">
        <p class="notice">공지작성</p>
        <hr style="margin-bottom: 30px;">

        <c:choose>
            <c:when test="${not empty notice}">
                <form action="${pageContext.request.contextPath}/support/notice_update.notice" method="post" id="noticeForm">
                    <input type="hidden" name="noticeNum" value="${notice.noticeNum}">
                    <input type="hidden" name="memNum" value="${notice.memNum}">
            </c:when>
            <c:otherwise>
                <form action="${pageContext.request.contextPath}/support/notice_insert.notice" method="post" id="noticeForm">
                    <input type="hidden" name="memNum" value="${sessionScope.UsersDTO.memNum}">
            </c:otherwise>
        </c:choose>

            <ul class="mb-name">
                <li>
                    <c:choose>
                        <c:when test="${not empty notice}">
                            <input type="text" name="noticeTitle" value="${notice.noticeTitle}">
                        </c:when>
                        <c:otherwise>
                            <input type="text" name="noticeTitle" placeholder="제목">
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>

            <div class="mb-content">
                <c:choose>
                    <c:when test="${not empty notice}">
                        <textarea name="noticeContent">${notice.noticeContent}</textarea>
                    </c:when>
                    <c:otherwise>
                        <textarea name="noticeContent" class="mb-intro" placeholder="글내용"></textarea>
                    </c:otherwise>
                </c:choose>
            </div>

			<div class="notice-submit-wrap">
    <c:choose>
        <c:when test="${not empty notice}">
            <button type="submit" class="notice-submit-btn">수정</button>
        </c:when>
        <c:otherwise>
            <button type="submit" class="notice-submit-btn">등록</button>
        </c:otherwise>
    </c:choose>
</div>
			
            
        </form>
    </div>
</section>

<script>
    document.getElementById('noticeForm').addEventListener("submit", function(e) {
        if (!confirm('저장하시겠습니까?')) {
            e.preventDefault();
        }
    });
</script>

<%@ include file="../include/footer.jsp" %>