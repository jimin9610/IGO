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

<script>
	$(document).ready(function(){
		
		var fid = '<%=session.getAttribute("fid")%>';
		
		if(${fid == null}){
			alert("로그인 후 이용하세요.\r로그인 창으로 이동합니다.");
			location.href = "/fixer/login";
		}
		
	});
	
	function logout(){
		
		if(confirm("로그아웃하시겠습니까?")){
			location.href="/fixer/logout.do";
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
			   <li class="nav-item" style="width: 150px;" align=center><a class="btn btn-outline-light" style="padding-top:8px" class="dropdown-item" href="<c:url value="/fixer/accept"/>"><i class="fa-solid fa-list-check" style="color: black;font-size:30px"></i><br><font size="2px">의뢰 접수</font></a></li>
			   <li class="nav-item" style="width: 150px" align=center><a class="btn btn-outline-light" style="padding-top:8px" class="dropdown-item" href="<c:url value="/fixer/q_list"/>"><i class="fa-solid fa-clipboard-question" style="color: black;font-size:30px"></i><br><font size="2px">문의 리스트</font></a></li>
			   <li class="nav-item" style="width: 150px" align=center><a class="btn btn-outline-light" style="padding-top:8px" class="dropdown-item" href="<c:url value="/fixer/mypage"/>"><i class="fa-solid fa-circle-user" style="color: black;font-size:30px"></i><br><font size="2px">기사 정보</font></a></li>
			   <li class="nav-item" style="width: 150px" align=center><a class="btn btn-outline-light" style="padding-top:8px" class="dropdown-item" onclick="javasript:logout()"><i class="fa-solid fa-right-from-bracket" style="color: black;font-size:30px"></i><br><font size="2px">로그아웃</font></a></li>
			</ul>
		  </li>
	   	</ul>
	</div>     	
</nav>