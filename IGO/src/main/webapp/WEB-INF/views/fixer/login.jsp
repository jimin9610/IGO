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

<%-- datepicker 관련 설정 --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>
<body>


<div style="text-align: center;padding-top: 15px">
	<div class="col-lg-5 mx-auto" style="padding: 20px"><a href="/"><img style="width:70%" src="/resources/images/LOGO.png"></a></div>
</div>


<div class="col-lg-4 mx-auto" style="padding: 20px">
	<form action="/fixer/loginProcess" method="post">
	  <div class="form-group">
	    <label for="id">기사 이름</label>
	    <input class="form-control" name="fname" aria-describedby="emailHelp">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">비밀번호</label>
	    <input type="password" class="form-control" name="password">
	  </div>
	  <c:if test="${msg eq 'error'}">
	  <div class="form-group">
	  	<p style="font-size: 12px;color: red;">아이디 혹은 비밀번호 오류입니다. 다시 확인하세요.
	  </div>
	  </c:if>
	  <button type="submit" class="btn btn-primary">로그인</button>
	</form>
</div>
<jsp:include page="../include/footer.jsp"/>

</body>
</html>