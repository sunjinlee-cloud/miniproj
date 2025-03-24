<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<%@ include file="../include/header.jsp" %>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/support_notice_list.css">

<body>
<div class="nav">
    <a href="${pageContext.request.contextPath}/support/support_notice_list.jsp" class="navmenu">공지사항</a>
    <a href="${pageContext.request.contextPath}/support/support_faq.jsp" class="navmenu">FAQ</a>
    <a href="${pageContext.request.contextPath}/support/support_qna_list.jsp" class="navmenu">1대1 문의</a>
</div>
    <article class="main-section">
        <div class="main-title">모르는개산책 회원님, 도움이 필요하신가요?</div>
    </article>

  

    <div class="faq">
        <span class="faq-lo">FAQ</span><br>
    </div>

    <div id="faq-dropdown">
        <c:forEach var="faq" items="${faqList}">
            <div class="announce faqcontent">
                <div class="faqcontent-left">
                    Q. ${faq.question}
                    <p>A. ${faq.answer}</p>
                </div>
                <a href="#" class="faqcontent-right"></a>
            </div>
        </c:forEach>
        
        
        <div id="faq-dropdown">
        <div class="announce faqcontent">
            <div class="faqcontent-left">
                Q. 예약한 산책 일정을 변경하거나 취소할 수 있나요?
                <p>
                    A. 네, 예약한 산책 일정을 변경하거나 취소할 수 있습니다. 마이 페이지에서 예약 변경 및 취소가 가능하며 취소 기한은 산책 예정 시간 12시간 전까지 가능하고 이후 수수료 발생 될 수 있습니다.
                </p>
            </div>
            <a href="" class="faqcontent-right">o
            </a>
        </div>
        <div class="announce faqcontent">
            <div class="faqcontent-left">
                Q. 산책 중 사고가 발생하면 어떻게 대처하나요?
                <p>
                    A. 산책 중 사고가 발생하면 상황에따라 병원 및 고객센터로 즉시 연락하여 주세요. 필요시 보험 이 적용되어 적절한 보상이 이루어집니다. 고객님의 안전은 최우선으로 여기겠습니다.
                </p>
            </div>
            <a href="" class="faqcontent-right">o
            </a>
        </div>
        <div class="announce faqcontent">
            <div class="faqcontent-left">
                Q. 돌보미와 직접 연락할 수 있나요?
                <P>
                    A. 네, 돌보미와연락 할 수 있습니다. 매칭 시 주고 받은 정보들을 통해 실시간으로 돌보미와 연락이 가능합니다. 필요한 경우 언제든지 소통할 수 있어요! 추가로 궁금하신 점이 있으시다면 고객센터로 연락주시기 바랍니다.
                </P>
            </div>
            <a href="" class="faqcontent-right">o
            </a>
        </div>
        <div class="announce faqcontent">
            <div class="faqcontent-left">
                Q. 우리 지역에서도 이용할 수 있나요?
                <P>
                    A. 현재는 출시 초기라 수도권에서만 서비스를 운영하고 있습니다. 앞으로 서비스 영역을 지속적으로 확장할 계획이 있으니  자세한 내용은 공지사항을 통해 확인해 주세요!
                </P>
            </div>
            <a href="" class="faqcontent-right">o
            </a>
        </div>
    </div>
    </div>

    <script>
        var drop = document.getElementById('faq-dropdown');

        drop.onclick = function (event) {
            if (event.target.tagName != 'A') {
                return;
            }
            event.preventDefault();
            var e = event.target;
            var pre = document.querySelector('.active');

            if (pre) {
                pre.classList.add('fade-out');
                pre.classList.remove('active');
                setTimeout(function () {
                    pre.classList.remove('fade-out');
                }, 300);
            }

            if (pre !== e.parentElement) {
                e.parentElement.classList.add('active');
            }
        }
    </script>

    <%@ include file="../include/footer.jsp" %>