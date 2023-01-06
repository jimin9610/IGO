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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- 아이콘 표시 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

<%-- datepicker 관련 설정 --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() {
  $("#btn_close").on('click', function() {
    self.close();
  });
});
</script>
</script>
</head>
<body>

<div style="text-align: center;padding-top: 15px">
	<div class="col-lg-5 mx-auto" style="padding: 20px"><img style="width:70%" src="/resources/images/LOGO.png"></a></div>
</div>
</head>
<body>


<div class="col-lg-6 mx-auto" style="padding: 20px">
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="name">이름</label>
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
		    <input readonly="readonly" required="required" type="text" class="form-control" name="addr" id="addr" value="<c:out value='${request.addr}'/>">
		  </div>
		  <div class="form-group col-lg-3">
		    <label for="addr">상세 주소</label>
		    <input readonly="readonly" required="required" type="text" class="form-control" name="addr2" id="addr2" value="<c:out value='${request.addr2}'/>">
		  </div>
	  </div>
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="category">고장 분류</label>
	      <select id="category" name="category" class="form-control" required="required" readonly="readonly" >
	        <option selected>===선택===</option>
	        <optgroup label="소형 가전">
	        	<option value="phone" <c:out value='${request.category eq "phone" ? "selected" : ""}'/>>휴대폰</option>
	        	<option value="pc" <c:out value='${request.category eq "pc" ? "selected" : ""}'/>>PC/노트북</option>
	        	<option value="tab" <c:out value='${request.category eq "tab" ? "selected" : ""}'/>>태블릿</option>
	        </optgroup>
	        <optgroup label="일반 가전">
	        	<option value="refir" <c:out value='${request.category eq "refri" ? "selected" : ""}'/>>냉장고</option>
	        	<option value="laundry" <c:out value='${request.category eq "laundry" ? "selected" : ""}'/>>세탁기</option>
	        	<option value="etc" <c:out value='${request.category eq "etc" ? "selected" : ""}'/>>기타 가전</option>
	        </optgroup>	        
	      </select>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputAddress2">고장 내용</label>
	    <textarea readonly="readonly" required="required" class="form-control" name="content" style="height:250px"><c:out value="${request.content}"/></textarea>
	  </div>
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="form-control">희망 방문 일자</label>
	      <input readonly="readonly" required="required" type="date" id="hopeDate" name="hopeDate" class="form-control" value="<c:out value='${request.hopeDate}'/>">
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
		  </div>
	    </div>
	  </div>
	  <button id="btn_close" class="btn btn-sm btn-primary">닫기</button>
</div>
</body>
</html>