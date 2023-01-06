<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
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

<script>
$(function() {
  $("#btn_close").on('click', function() {
    self.close();
  });
});
</script>

<!-- 아이콘 표시 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

<%-- datepicker 관련 설정 --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<div class="card mb-3 mx-auto" style="max-width: 500px;margin: 50px;height:200px">
<c:forEach items="${info}" var="info">
	<c:if test="${info.fid eq fid}">
	  <div class="row no-gutters" style="height: 100%">
	    <div class="col-md-4" style="overflow: hidden;background-image:url(/resources/images/${info.profile});background-repeat: no-repeat;background-position: center;background-size:cover;">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	       	<h5 class="card-title"><small class="text-muted">성명 : </small><c:out value="${info.fname}"/></h5>
	        <p class="card-text"><small class="text-muted">연락처 : </small><c:out value="${info.fphone}"/></p>
	        <p class="card-text"><small style="color: blue;">평점 : <a style="color: red;font-weight: bold;">${score}</a>점</small></p>
	      </div>
	      <button id="btn_close" style="margin-left: 12px" class="btn btn-sm btn-outline-primary align-right">닫기</button>
	    </div>
	  </div>
   </c:if>
</c:forEach>
</div>

</body>
</html>