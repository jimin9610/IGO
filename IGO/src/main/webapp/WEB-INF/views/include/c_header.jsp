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
	function logout(){
		
		if(confirm("로그아웃하시겠습니까?")){
			location.href="/client/logout.do";
		}else{
			return false;
		}
		
	}
</script>
</head>
<body>

<div style="text-align: center;padding-top: 15px">
	<div class="col-lg-5 mx-auto" style="padding: 20px"><a href="/"><img style="width:70%" src="/resources/images/LOGO.png"></a></div>
</div>

<nav class="navbar navbar-expand-md navbar-light bg-light mx-auto">
  <!-- 메뉴를 반응형으로 해상도에 따라 표시 -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
      <!-- 메뉴 설정 -->
      <ul class="navbar-nav">
          <%-- 대메뉴를 클릭시 서브메뉴를 작성 --%>
	      <li class="nav-item dropdown">
		   	 <ul class="navbar-nav mr-auto">
			      <li class="nav-item" style="width: 150px;" align=center><a class="btn btn-outline-light" style="padding-top:8px" class="dropdown-item" href="<c:url value="/client/submit"/>"><i class="fa-solid fa-file-contract" style="color: black;font-size:30px"></i><br><font size="2px">수리 접수</font></a></li>
			      <li class="nav-item" style="width: 150px" align=center><a class="btn btn-outline-light" style="padding-top:8px" class="dropdown-item" href="<c:url value="/client/list"/>"><i class="fa-solid fa-list-ul" style="color: black;font-size:30px"></i><br><font size="2px">예약 내역</font></a></li>
			      <li class="nav-item" style="width: 150px" align=center><a class="btn btn-outline-light" style="padding-top:8px" class="dropdown-item" href="<c:url value="/client/question"/>"><i class="fa-solid fa-circle-question" style="color: black;font-size:30px"></i><br><font size="2px">문의</font></a></li>
			      <li class="nav-item" style="width: 150px" align=center><a class="btn btn-outline-light" style="padding-top:8px" class="dropdown-item" href="<c:url value="/client/q_list"/>"><i class="fa-solid fa-clipboard-question" style="color: black;font-size:30px"></i><br><font size="2px">문의 내역</font></a></li>
			      <li class="nav-item" style="width: 150px" align=center><a class="btn btn-outline-light" style="padding-top:8px" class="dropdown-item" onclick="javasript:logout()"><i class="fa-solid fa-house" style="color: black;font-size:30px"></i><br><font size="2px">홈으로</font></a></li>
			  </ul>
		  </li>
	   	</ul>
	</div>     	
</nav>