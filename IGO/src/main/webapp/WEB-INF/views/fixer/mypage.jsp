<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

td,th{

	height: 60px;
	text-align: center;

}

td{

	font-size: 14px;

}


</style>
</head>
<body>

<jsp:include page="../include/f_header.jsp"/>

<div class="container" style="margin-top: 20px">
  <c:forEach var="fixer" items="${info}">
	<c:if test="${fixer.fid eq fid}">
	<div class="col-lg-6 mx-auto">
	  <div class="row" style="height: 100%">
	    <div class="col-lg-4">
	    	<img src="\resources\images\<c:out value='${fixer.profile}'/>" style="width:180px;height:200px">
	    </div>
	    <div class="col-lg-8">
	      <div class="card-body">
	        <h5 class="card-title"><small class="text-muted">성명 : </small><c:out value="${fixer.fname}"/></h5>
	        <p class="card-text"><small class="text-muted">연락처 : </small><c:out value="${fixer.fphone}"/></p>
	        <p class="card-text"><small style="color: blue;">평점 : <a style="color: red;font-weight: bold;">${score}</a>점</small></p>
	      </div>
	      <div class="justify-content-end">
	      	<a class="btn btn-light btn-sm" style="margin-left: 20px" href="/fixer/edit?fid=${fixer.fid}">수정</a>
	      </div>
	      </c:if>
	  </c:forEach>
	    </div>
	  </div>
	</div>
</div>

<jsp:include page="f_list.jsp"/>

<jsp:include page="../include/footer.jsp"/>

</html>