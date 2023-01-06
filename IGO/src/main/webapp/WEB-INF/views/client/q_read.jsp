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

</head>
<body>

<jsp:include page="../include/c_header.jsp"/>


<div class="alert col-lg-4 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd;margin-top: 20px;">
  문의
</div>


<div class="col-lg-6 mx-auto" style="padding: 20px">
	<form action="/client/q_editProcess" method="post">
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="name">이름</label>
	      <input type="text" class="form-control" id="name" name="name" readonly="readonly" value="${ask.name}">
	      <input type="hidden" id="aid" name="aid" value="${ask.aid}">
	    </div>
	    <div class="form-group col-md-4">
	      <label for="phone">전화번호</label>
	      <input type="text" class="form-control" id="phone" name="phone" readonly="readonly" value="${ask.phone}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="ask">문의 내용</label>
	    <textarea id="ask" name="ask" class="form-control" style="height:250px">${ask.ask}</textarea>
	  </div>
	  <button type="submit" class="btn btn-sm btn-primary">문의 수정</button>
	  <a href="/client/q_list" class="btn btn-sm btn-primary">취소</a>
	</form>
</div>

<jsp:include page="../include/footer.jsp"/>

</body>
</html>