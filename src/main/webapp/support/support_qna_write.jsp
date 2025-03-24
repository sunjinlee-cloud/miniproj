<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%@ include file="../include/header.jsp" %>



<link rel="stylesheet" href="../css/support_qna_write.css">


<body>
<section>

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

            <div class="mb-submit">
                <c:choose>
                    <c:when test="${not empty qna}">
                        <input type="submit" value="수정">
                    </c:when>
                    <c:otherwise>
                        <input type="submit" value="등록">
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