<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%@ include file="../include/header.jsp" %>



<link rel="stylesheet" href="../css/support_notice_view.css">


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
        <p class="notice">공지사항</p>
        <hr class="notice-line">

        <ul class="notice-name">
            <li><div>${notice.noticeTitle}</div></li>
            <li class="notice-fo">작성자</li>
            <li class="notice-li">
                <c:out value="${sessionScope.UsersDTO.memNick}" default="${sessionScope.UsersDTO.memNum}" />
            </li>
            <li class="notice-fo">작성일</li>
            <li class="notice-li">
                <c:out value="${notice.noticeDate}" />
            </li>
          
        </ul>

        <hr>

        <div class="notice-content">
            <p>${notice.noticeContent}</p>
        </div>

        <hr>

        <div class="notice-btn">
            <button type="button" onclick="goToUpdate()">수정</button>
            <button type="button" onclick="goToDelete()">삭제</button>
        </div>
    </div>
</section>

<script>
    const noticeNum = ${notice.noticeNum};

    function goToUpdate() {
        location.href = '${pageContext.request.contextPath}/support/notice_updateForm.notice?noticeNum=' + noticeNum;
    }

    function goToDelete() {
        if (confirm('정말 삭제하시겠습니까?')) {
            location.href = '${pageContext.request.contextPath}/support/notice_delete.notice?noticeNum=' + noticeNum;
        }
    }
</script>

<%@ include file="../include/footer.jsp" %>