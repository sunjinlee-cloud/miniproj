<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/support_notice_list.css">

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
        <p class="notice-title">공지사항</p>
        <hr class="notice-line">

        <c:if test="${not empty noticeList}">
            <div class="board-header board-row header">
                <div class="column number">번호</div>
                <div class="column subject">제목</div>
                <div class="column date">등록일</div>
            </div>
        </c:if>

        <div class="board-body">
            <c:forEach var="notice" items="${noticeList}">
                <div class="board-row">
                    <div class="column number">${notice.noticeNum}</div>
                    <div class="column subject">
                        <a href="${pageContext.request.contextPath}/support/notice_view.notice?noticeNum=${notice.noticeNum}">
                            ${notice.noticeTitle}
                        </a>
                    </div>
                    <div class="column date">
                        <c:out value="${notice.noticeDate}" />
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty noticeList}">
                <div class="board-row no-data">
                    <div class="column subject" style="text-align:center;">
                        작성된 문의가 없습니다.
                    </div>
                </div>
            </c:if>
        </div>

        <div class="board-bottom">
            <div class="mb-submit">
                <input type="button" value="글쓰기"
                    onclick="location.href='${pageContext.request.contextPath}/support/notice_insertForm.notice'">
            </div>
        </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>
