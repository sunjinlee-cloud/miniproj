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



<link rel="stylesheet" href="../css/support_qna_view.css">


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
        <p class="qna">문의내역</p>
        <hr class="qna-line">

        <ul class="qna-name">
            <li><div>${qna.qnaTitle}</div></li>
            <li class="qna-fo">작성자</li>
            <li class="qna-li">
                <c:out value="${sessionScope.UsersDTO.memNick}" default="${sessionScope.UsersDTO.memNum}" />
            </li>
            <li class="qna-fo">작성일</li>
            <li class="qna-li">
                <c:out value="${qna.qnaDate}" />
            </li>
          
        </ul>

        <hr>

        <div class="qna-content">
            <p>${qna.qnaContent}</p>
        </div>

        <hr>

        <div class="qna-btn">
            <button type="button" onclick="goToUpdate()">수정</button>
            <button type="button" onclick="goToDelete()">삭제</button>
        </div>
    </div>
</section>

<script>
    const qnaNum = ${qna.qnaNum};

    function goToUpdate() {
        location.href = '${pageContext.request.contextPath}/support/qna_updateForm.qna?qnaNum=' + qnaNum;
    }

    function goToDelete() {
        if (confirm('정말 삭제하시겠습니까?')) {
            location.href = '${pageContext.request.contextPath}/support/qna_delete.qna?qnaNum=' + qnaNum;
        }
    }
</script>

<%@ include file="../include/footer.jsp" %>