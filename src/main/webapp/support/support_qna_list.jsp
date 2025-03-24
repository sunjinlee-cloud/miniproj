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


<link rel="stylesheet" href="../css/support_qna_list.css">

<body>
<section>
<div class="nav">
    <a href="${pageContext.request.contextPath}/support/support_notice_list.jsp" class="navmenu">공지사항</a>
    <a href="${pageContext.request.contextPath}/support/support_faq.jsp" class="navmenu">FAQ</a>
    <a href="${pageContext.request.contextPath}/support/support_qna_list.jsp" class="navmenu">1대1 문의</a>
</div>
	<div class="support-banner">
    <img src="${pageContext.request.contextPath}/img/support_banner.jpg" alt="고객지원 배너">
</div>

    <div class="container">
        <p class="qna">1대1 문의</p>
        <hr class="qna-line">

        <c:if test="${not empty qnaList}">
            <div class="board-header board-row header">
                <div class="column number">번호</div>
                <div class="column subject">제목</div>
                <div class="column date">등록일</div>
            </div>
        </c:if>

        <div class="board-body">
            <c:forEach var="qna" items="${qnaList}">
                <div class="board-row">
                    <div class="column number">${qna.qnaNum}</div>
                    <div class="column subject">
                        <a href="${pageContext.request.contextPath}/support/qna_view.qna?qnaNum=${qna.qnaNum}">
                            ${qna.qnaTitle}
                        </a>
                    </div>
                    <div class="column date">
                        <c:out value="${qna.qnaDate}" />
                    </div>
                    
                </div>
            </c:forEach>

            <c:if test="${empty qnaList}">
                <div class="board-row">
                    <div class="column subject" style="text-align:center;">
                        작성된 문의가 없습니다.
                    </div>
                </div>
            </c:if>
        </div>

        <div class="board-bottom">
    <div class="mb-submit">
        <input type="button" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/support/qna_insertForm.qna'">
    </div>
</div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>