<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function postSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }                
                } 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>

<div class="alert col-lg-4 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd;margin-top: 20px;">
  접수 세부 내용
</div>

<div class="col-lg-6 mx-auto" style="padding: 20px">
	<form action="/client/editProcess?rid=${request.rid}" method="post">
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="name">이름</label>
	      <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
	      <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
	      <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
	      <input type="text" class="form-control" id="name" readonly="readonly" name="name" value="<c:out value='${request.name}'/>">
	    </div>
	    <div class="form-group col-md-4">
	      <label for="phone">전화번호</label>
	      <input type="text" class="form-control" id="phone" readonly="readonly" name="phone" value="<c:out value='${request.phone}'/>">
	    </div>
	  </div>
	  <div class="form-row">
		  <div class="form-group col-lg-8">
		    <label for="addr">주소</label>&nbsp;&nbsp;&raquo;&nbsp;<a><i class="fa fa-location-arrow" onclick="postSearch()" style="font-size: 20px;color: black"></i></a>&nbsp;&laquo;
		    <input required="required" type="text" class="form-control" name="addr" id="addr" value="<c:out value='${request.addr}'/>">
		  </div>
		  <div class="form-group col-lg-3">
		    <label for="addr">상세 주소</label>
		    <input required="required" type="text" class="form-control" name="addr2" id="addr2" value="<c:out value='${request.addr2}'/>">
		  </div>
	  </div>
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="category">고장 분류</label>
	      <select id="category" name="category" class="form-control" required="required">
	        <option selected>===선택===</option>
	        <optgroup label="소형 가전">
	        	<option value="phone" <c:out value='${request.category eq "phone" ? "selected" : ""}'/>>휴대폰</option>
	        	<option value="pc" <c:out value='${request.category eq "pc" ? "selected" : ""}'/>>PC/노트북</option>
	        	<option value="tab" <c:out value='${request.category eq "tab" ? "selected" : ""}'/>>태블릿</option>
	        </optgroup>
	        <optgroup label="일반 가전">
	        	<option value="refri" <c:out value='${request.category eq "refri" ? "selected" : ""}'/>>냉장고</option>
	        	<option value="laundry" <c:out value='${request.category eq "laundry" ? "selected" : ""}'/>>세탁기</option>
	        	<option value="etc" <c:out value='${request.category eq "etc" ? "selected" : ""}'/>>기타 가전</option>
	        </optgroup>	        
	      </select>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputAddress2">고장 내용</label>
	    <textarea required="required" class="form-control" name="content" style="height:250px"><c:out value="${request.content}"/></textarea>
	  </div>
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="form-control">희망 방문 일자</label>
	      <input required="required" type="date" id="hopeDate" name="hopeDate" class="form-control" value="<c:out value='${request.hopeDate}'/>">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="form-control">상태</label>
	      <div class="form-control" style="background-color:black;color:white;">
	      	<c:if test="${request.status eq 'A'}">
				접수 중...
			</c:if>
			<c:if test="${request.status eq 'S'}">
				접수 완료
			</c:if>
			<c:if test="${request.status eq 'D'}">
				수리 완료
			</c:if>
			<c:if test="${request.status eq 'C'}">
				취소
			</c:if>
			<c:if test="${request.status eq 'P'}">
				결제완료
			</c:if>
		  </div>
	    </div>
	  </div>
	  <c:if test="${request.status eq 'A'}">
	  	<button type="submit" class="btn btn-sm btn-primary">수정</button>
	  </c:if>
	  	<a href="/client/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}" class="btn btn-sm btn-primary">목록으로</a>
	  </form>
	
</div>
</body>
</html>