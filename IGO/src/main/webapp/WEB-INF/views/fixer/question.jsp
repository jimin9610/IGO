<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

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
  문의
</div>


<div class="col-lg-6 mx-auto" style="padding: 20px">
	<form>
	  <div class="form-row">
	    <div class="form-group col-md-2">
	      <label for="name">이름</label>
	      <input type="text" class="form-control" id="name" readonly="readonly" value="${list.name}">
	    </div>
	    <div class="form-group col-md-3">
	      <label for="phone">연락처</label>
	      <input type="text" class="form-control" id="phone" readonly="readonly" value="${list.phone}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="content" style="font-weight: bold;font-size: 18px">문의 내용</label>
	    <textarea readonly="readonly" required="required" class="form-control" name="content" style="height:250px">${list.ask}</textarea>
	  </div>
	  <button id="btn_close" type="button" class="btn btn-primary">취소</button>
	</form>
</div>
</body>
</html>