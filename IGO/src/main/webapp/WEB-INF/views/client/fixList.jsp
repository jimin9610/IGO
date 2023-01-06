<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//정상적인 로그인 사용자인 경우 세션 정보를 가져온다
	String sessionId = (String) session.getAttribute("session_id");
%>


<!DOCTYPE html>
<html>
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
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

</head>
<body>

<jsp:include page="../include/c_header.jsp"/>

<div class="alert col-sm-4 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd;margin-top: 20px">
  수리 내역
</div>

<div class="container">
	<div class="col-lg-7 mx-auto" style="padding: 20px">
	  <c:forEach var="info" items="${info}">
	  	<c:if test="${info.fid eq fid}">
		  <div class="form-row">
		    <div class="form-group col-md-4">
		      <label for="name">기사명</label>
		      <input type="text" class="form-control" name="name" readonly="readonly" value="${info.fname}">
		      <input type="hidden" class="form-control" name="rid" value="${rid}">
		      <input type="hidden" class="form-control" name="fid" value="${fid}">
		    </div>
		    <div class="form-group col-md-4">
		      <label for="phone">기사 전화번호</label>
		      <input type="text" class="form-control" name="phone" readonly="readonly" value="${info.fphone}">
		    </div>
		  </div>
		</c:if>
	  </c:forEach>
	</div>
	<table class="table col-lg-7 mx-auto">
		<thead>
			<tr>
				<th scope="col">부품명</th>
				<th scope="col">가격</th>
			</tr>
		</thead>
		<tbody>
			<c:set value="0" var="total"/>
			<c:forEach var="done" items="${done}">
				<tr>
					<td>${done.cname}</td>
					<td><fmt:formatNumber value="${done.cprice}" pattern="#,###원" /></td>
					<td style="display: none;">
						<input type="hidden" value="${done.flid}" name="flid">
						<input type="hidden" value="${done.rid}" name="rid">
					</td>
				</tr>
			<c:set var= "total" value="${total + done.cprice}"/>
			</c:forEach>
			<tr>
				<td style="text-align: center;font-weight: bold;">총계 : </td>
				<td style="font-weight: bold;"><fmt:formatNumber value="${total}" pattern="#,###원" /></td>
			</tr>
		</tbody>
	</table>
	<form id="pay" action="/client/payment" method="post">
		<div class="table col-lg-7 mx-auto row">
			<select name="score">
				<option value="0" selected="selected">====서비스 평점====</option>
				<option value="5">★★★★★</option>
				<option value="4">★★★★</option>
				<option value="3">★★★</option>
				<option value="2">★★</option>
				<option value="1">★</option>
			</select>
			<input type="hidden" class="form-control" name="rid" value="${rid}">
			&nbsp;&nbsp;
			<button id="payment" class="btn btn-sm btn-outline-success">결제</button>
		</div>
	</form>
</div>

<script>
$(document).ready(function(){
	$("#payment").click(function(){
		var score = $("select[name='score']").val();
		
		if(score == "0"){
			alert("평점을 입력해주세요!\r향후 서비스의 향상에 도움이 됩니다.");
			return false;
		}else{
			document.getElementById('pay').submit();
		}
		
	});
});
</script>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>