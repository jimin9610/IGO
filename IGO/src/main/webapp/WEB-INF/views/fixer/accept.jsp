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

<jsp:include page="../include/f_header.jsp"/>

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
	
	function qOpenPopup(){
        var pop = window.open("${path}/fixer/question","resPopup","width=800,height=650, scrollbars=yes, resizable=yes"); 
        pop.focus();
    }
	
	function sOpenPopup(){
        var pop = window.open("${path}/client/score","resPopup","width=800,height=650, scrollbars=yes, resizable=yes"); 
        pop.focus();
    }
	
	function rOpenPopup(rid){
        var pop = window.open("${path}/fixer/f_read?rid="+rid,"resPopup","width=800,height=650, scrollbars=yes, resizable=yes"); 
        pop.focus();
    }
	
</script>
<div class="alert col-lg-4 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd;margin-top: 20px;">
  의뢰 내역
</div>



<div class="col-lg-7 mx-auto" style="padding: 20px">

	<div class="form-row" style="margin-bottom: 10px">
		<form action="/fixer/accept/" method="get">
	   		<div class="form-row">
	              <input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
	              <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
	              <select name="type" class="custom-select custom-select-sm" style="width: 150px;text-align: center;">
	              	<option value="" selected>==카테고리==</option>
	              	<optgroup label="--소형 가전--">
		        	<option value="phone" <c:if test="${pageMaker.cri.type eq 'phone'}">selected</c:if> >휴대폰</option>
		        	<option value="pc" <c:if test="${pageMaker.cri.type eq 'pc'}">selected</c:if>>PC/노트북</option>
		        	<option value="tab" <c:if test="${pageMaker.cri.type eq 'tab'}">selected</c:if>>태블릿</option>
		        </optgroup>
		        <optgroup label="--일반 가전--">
		        	<option value="refri" <c:if test="${pageMaker.cri.type eq 'refri'}">selected</c:if>>냉장고</option>
		        	<option value="laundry" <c:if test="${pageMaker.cri.type eq 'laundry'}">selected</c:if>>세탁기</option>
		        	<option value="tv" <c:if test="${pageMaker.cri.type eq 'tv'}">selected</c:if>>TV</option>
		        </optgroup>	 
	              </select>
	              &nbsp;
			<button style="height: 30px;" class="btn btn-secondary btn-sm align-middle">조회</button>
	  		</div>
		</form>
	</div>

	<table class="table" style="text-align: center;">
		<tr>
			<th class="align-middle">No.</th>
			<th class="align-middle">등록 일자</th>
			<th class="align-middle">분류</th>
			<th class="align-middle">상세</th>
			<th class="align-middle">희망 일자</th>
			<th class="align-middle">상태</th>
		</tr>
		<c:forEach var="request" items="${list}">
			<form action="/fixer/acceptProcess" method="post">
			<tr>
				<td class="align-middle"><c:out value="${request.rn}"/>
					<input type="hidden" name="rid" value="${request.rid}">
					<input type="hidden" name="fid" value="${fid}">
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
	     			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				</td>
				<td class="align-middle"><c:out value="${request.regDate}"/></td>
				<td class="align-middle">
					<c:if test="${request.category eq 'phone'}">
						휴대폰
					</c:if>
					<c:if test="${request.category eq 'pc'}">
						PC/노트북
					</c:if>
					<c:if test="${request.category eq 'tab'}">
						태블릿
					</c:if>
					<c:if test="${request.category eq 'refri'}">
						냉장고
					</c:if>
					<c:if test="${request.category eq 'laundry'}">
						세탁기
					</c:if>
					<c:if test="${request.category eq 'tv'}">
						TV
					</c:if>
				</td>
				<td class="align-middle">
					<a href="" onclick="rOpenPopup(${request.rid})" style="text-decoration: none;">
						<c:choose>
				           <c:when test="${fn:length(request.content) > 14}">
				            	<c:out value="${fn:substring(request.content,0,13)}"/>....
				           </c:when>
				           <c:otherwise>
				           		<c:out value="${request.content}"/>
				           </c:otherwise> 
			          	</c:choose>
			        </a>
				</td>
				<td class="align-middle">접수일자</td>
				<td class="align-middle">
					<c:if test="${request.status eq 'A'}">
						접수 중...<br><button type="submit" class="btn btn-outline-dark btn-sm">접수</button>
					</c:if>
					<c:if test="${request.status eq 'S'}">
						접수 완료
					</c:if>
					<c:if test="${request.status eq 'D' || request.status eq 'P'}">
						수리 완료
					</c:if>
					<c:if test="${request.status eq 'C'}">
						취소
					</c:if>
				</td>
			</tr>
			</form>
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
    <form id="actionForm" action="/fixer/accept" method="get">
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
        
        actionForm.append("<input type='hidden' name='rid' value='"+$(this).attr("href")+"'>");
        actionForm.attr("action","/fixer/accept").submit();
        
     });
    </script>
</body>

<jsp:include page="../include/footer.jsp"/>

</html>