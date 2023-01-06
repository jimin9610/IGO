<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

td,th{
	
	height: 60px;
	text-align: center;

}

td{

	font-size: 14px;

}


a{
	
	font-size: 12px;
	
}

button{

	width: 40px;
	height: 20px;

}


/* DatePicker CSS */

.ui-widget-header { border: none !important; background-color: transparent !important; }

.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
    border: 1px solid #fff !important;
    background: #fff !important;
    font-weight: normal !important;
    color: #454545 !important;
    text-align: center !important;
    font-size: 12px;
}

.ui-widget.ui-widget-content {
    width: 250px;
}

.ui-datepicker .ui-datepicker-title {
    font-size: 12px;
}

.ui-datepicker .ui-datepicker-header {
    width: 100%;
}

.ui-datepicker th {
    font-size: 12px;
}

.ui-datepicker-calendar th:first-child {
	color: #ff0000 !important;
}

.ui-datepicker-calendar th:nth-last-child(1) {
	color: #0d47a1 !important;
}

.ui-datepicker-calendar tr td:first-child a {
	color: #ff0000 !important;
}

.ui-datepicker-calendar tr td:nth-last-child(1) a {
	color: #0d47a1 !important;
}

</style>
</head>
<body>

<jsp:include page="../include/c_header.jsp"/>

<script>
	$(document).ready(function(){
		
		if(<%=session.getAttribute("aname")%> == null){
			alert("정보 입력 후 이용하세요.\r입력창으로 이동합니다.");
			location.href = "/client/login?category=q_list";
		}
		
	});
</script>

<script>
	$(function(){
		$("#hopeDate,#hopeDate2").datepicker({
			changeMonth:true,
			changeYear:true,
			dateFormat:"yy-mm-dd",
			prevText:"이전 달",
			nextText:"다음 달",
			monthNames:['1월','2월','3월','4월',
						'5월','6월','7월','8월',
						'9월','10월','11월','12월'
				       ],
			monthNamesShort:['1월','2월','3월','4월',
							'5월','6월','7월','8월',
							'9월','10월','11월','12월'
					       ],
			dayNames:['일','월','화','수','목','금','토'],
			dayNamesShort:['일','월','화','수','목','금','토'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			showMonthAfterYear:true,
			yearSuffix:'년'
		});

	});
	
	$(function() {
	  $("#mypoll_fromDate").datepicker();
	  $("#mypoll_toDate").datepicker();
	  $("#refund_fromDate").datepicker();
	  $("#refund_toDate").datepicker();
	  $("#refund_endSurvey").datepicker();
	} );
	
</script>
<div class="alert col-lg-4 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd;margin-top: 20px;">
  문의 내역
</div>
<div class="col-lg-7 mx-auto" style="padding: 20px">
	<table class="table" style="text-align: center;">
		<tr>
			<th class="align-middle">No.</th>
			<th class="align-middle">이름</th>
			<th class="align-middle">연락처</th>
			<th class="align-middle">문의 내용</th>
			<th class="align-middle">상태</th>
		</tr>
		<c:forEach var="ask" items="${list}">
			<tr>
				<td class="align-middle">
					<c:out value="${ask.rn}"/><br>
				</td>
				<td class="align-middle"><c:out value="${ask.name}"/></td>
				<td class="align-middle"><c:out value="${ask.phone}"/></td>
				<td class="align-middle">
					<a class="move" href='<c:out value="${ask.aid}"/>' style="text-decoration: none;">
						<c:choose>
				           <c:when test="${fn:length(ask.ask) > 14}">
				            	<c:out value="${fn:substring(ask.ask,0,13)}"/>....
				           </c:when>
				           <c:otherwise>
				           		<c:out value="${ask.ask}"/>
				           </c:otherwise> 
			          	</c:choose>
			        </a>
				</td>
				<td class="align-middle">
					<c:if test="${ask.status eq 'N'}">답변 대기</c:if>
					<c:if test="${ask.status eq 'Y'}">
						답변 완료
						<br>
						<a onclick='window.open("${path}/fixer/check_answer?aid=${ask.aid}","resPopup","width=800,height=650, scrollbars=yes, resizable=yes")' class="btn btn-outline-dark btn-sm">답변 보기</a>
					</c:if>					
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="mx-auto">
       <ul class="pagination">
          <c:if test="${pageMaker.prev}">
             <li class="page-item previous">
                <a class="page-link" href="${pageMaker.startPage - 1}">이전</a>
             </li>
          </c:if>
          <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
             <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
                <a class="page-link" href="${num}">${num}</a>
             </li>
          </c:forEach>
          <c:if test="${pageMaker.next}">
             <li class="page-item next">
                <a class="page-link" href="${pageMaker.endPage + 1}">다음</a>
             </li>
          </c:if>
       </ul>
    </div>
    
    <!-- page311 현재페이지번호와 보여지는 행수를 hidden 처리 -->
    <form id="actionForm" action="/client/q_list" method="get">
         <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
         <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
    </form>
    
    <script>
    var actionForm = $("#actionForm");
    
    $(".page-item a").on("click",function(e){
       e.preventDefault();//a태그 원래 처리부분을 막는다.
       
       //pageNum 속성값에 클릭한 현재 페이지번호를 대입
       actionForm.find("input[name='pageNum']").val($(this).attr("href"));
       actionForm.submit();
    });
    
    $(".move").on("click",function(e){
        e.preventDefault();
        
        actionForm.append("<input type='hidden' name='aid' value='"+$(this).attr("href")+"'>");
        actionForm.attr("action","/client/q_read").submit();
        
     });
    </script>
</body>

<jsp:include page="../include/footer.jsp"/>

</html>