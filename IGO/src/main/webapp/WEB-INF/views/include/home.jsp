<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>Home</title>
</head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- 아이콘 표시 -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 

<%-- datepicker 관련 설정 --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<body>
<div style="height: 340px;text-align: center;">
	<div style="height: 50px;"></div>
	<div class="col-lg-5 mx-auto" style="padding: 20px"><a href="/"><img style="width:70%" src="/resources/images/LOGO.png"></a></div>
	<div style="height: 50px;"></div>
</div>
<div class="container row mx-auto">
	<div class="col-lg-10 mx-auto row" style="border-collapse: collapse; border: 1px;">
		<div class="card mb-3 mx-auto" style="max-width: 350px;border: 0px;padding-top: 15px">
		  <div class="row no-gutters">
		    <div class="card-body col-md-5 mx-auto">
		      <img style="width: 100%;" src="/resources/images/customer-service.png">
		    </div>
		    <div class="col-md-7">
		      <div class="card-body" style="text-align: center;">
		        <h5 class="card-title" style="font-size: 30px">고객</h5>
		        <p class="card-text"></p>
		        <p class="card-text"><a href="/client/submit" style="text-decoration: none;">&raquo; 수리 접수</a></p>
		        <p class="card-text"><a href="/client/login?category=list" style="text-decoration: none;">&raquo; 예약 내역 확인</a></p>
		        <p class="card-text"><a href="/client/question" style="text-decoration: none;">&raquo; 문의</a></p>
		        <p class="card-text"><a href="/client/login?category=q_list" style="text-decoration: none;">&raquo; 문의 내역 확인</a></p>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="card mb-3 mx-auto" style="max-width: 350px;border: 0px;padding-top: 15px">
		  <div class="row no-gutters">
		    <div class="card-body col-md-5 align-middle">
		      <img style="width: 100%;" src="/resources/images/mechanic.png">
		    </div>
		    <div class="col-md-7">
		      <div class="card-body" style="text-align: center;">
		        <h5 class="card-title" style="font-size: 30px">
		        	기사
		        	<a class="align-top btn-sm btn-secondary" style="text-align:center;border-radius: 12px;" href="/fixer/add">+</a>
		        </h5>
		        <p class="card-text"></p>
		        <p class="card-text"><a href="/fixer/login" class="btn btn-sm btn-outline-primary">&raquo; 로그인 </a>	</p>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
