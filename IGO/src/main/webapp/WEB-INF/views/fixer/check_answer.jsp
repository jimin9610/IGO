<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
<%
	//정상적인 로그인 사용자인 경우 세션 정보를 가져온다
	String sessionId = (String) session.getAttribute("session_id");
%>

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
	<div class="col-lg-5 mx-auto" style="padding: 20px"><img style="width:70%" src="/resources/images/LOGO.png"></a></div>
</div>

<div class="alert col-lg-4 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd;margin-top: 20px;">
  답변
</div>


<div class="col-lg-6 mx-auto" style="padding: 20px">
	<c:forEach var="fix" items="${fixer}">
	<c:if test="${fix.fid eq ans.fid}">
	<div class="form-row">
	  <div class="form-group col-md-4">
	    <label for="name">기사명</label>
	    <input type="text" class="form-control" id="fname" readonly="readonly" value="${fix.fname}">
	  </div>
	  <div class="form-group col-md-4">
	   <label for="phone">전화번호</label>
	   <input type="text" class="form-control" id="fphone" readonly="readonly" value="${fix.fphone}">
	  </div>
	 </div>
	 </c:if>
	</c:forEach>
	<div class="form-group">
	  <label for="content">답변 내용</label>
	  <textarea name="answer" id="content" class="form-control" style="height:250px" disabled="disabled"><c:out value="${ans.answer}"/></textarea>
	</div>
	<button id="btn_close" type="button" class="btn btn-primary">취소</button>
</div>
</body>
</html>