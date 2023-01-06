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

<script>
$(function() {
  $("#btn_close").on('click', function() {
    self.close();
  });
});
</script>

</head>
<body>

<div style="text-align: center;padding-top: 15px">
	<div class="col-lg-5 mx-auto" style="padding: 20px"><img style="width:60%" src="/resources/images/LOGO.png"></div>
</div>

<div class="alert col-lg-2 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd">
  수리 내역
</div>

<div class="container">
	<div class="col-lg-6 mx-auto" style="padding: 20px">
		<form action="/fixer/fixadd" method="post">
		  <c:forEach var="info" items="${info}">
		  	<c:if test="${info.fid eq fid}">
			  <div class="form-row">
			    <div class="form-group col-md-4">
			      <label for="name">이름</label>
			      <input type="text" class="form-control" name="name" readonly="readonly" value="${info.fname}">
			      <input type="hidden" class="form-control" name="rid" value="${rid}">
			      <input type="hidden" class="form-control" name="fid" value="${fid}">
			    </div>
			    <div class="form-group col-md-4">
			      <label for="phone">전화번호</label>
			      <input type="text" class="form-control" name="phone" readonly="readonly" value="${info.fphone}">
			    </div>
			  </div>
			</c:if>
		  </c:forEach>
		  <c:if test="${request.status eq 'S' || request.status eq 'D'}">
			  <div class="form-group">
			    <label for="content" style="font-weight: bold;font-size: 18px">수리 내역</label>
			    <br>
				<select calss="custom-select" name="fixList" required>
					<option value="" selected="selected">====선택====</option>
					<c:forEach var="cat" items="${category}">
						<option value="${cat.largeCode}-${cat.middleCode}">${cat.cname}</option>
					</c:forEach>
				</select>
				<button type="submit" id="btnAdd" class="btn btn-sm btn-dark">내역 추가</button>
			  </div>
		  </c:if>
		</form>
	</div>
	<table class="table col-lg-6 mx-auto">
		<thead>
			<tr>
				<th scope="col">부품명</th>
				<th scope="col">가격</th>
				<c:if test="${request.status ne 'P'}">
					<th scope="col">삭제</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<form action="/fixer/list_delete" method="post">
				<c:forEach var="done" items="${done}">
					<tr>
						<td>${done.cname}</td>
						<td><fmt:formatNumber value="${done.cprice}" pattern="#,###원" /></td>
						<td>
							<input type="hidden" value="${done.flid}" name="flid">
							<input type="hidden" value="${done.rid}" name="rid">
							<c:if test="${request.status ne 'P'}">
								<button class="btn btn-sm btn-outline-dark" type="submit">삭제</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</form>
		</tbody>
	</table>
	<button id="btn_close" type="button" class="btn btn-primary">닫기</button>
	<br><br><br>
</div>
</body>
</html>