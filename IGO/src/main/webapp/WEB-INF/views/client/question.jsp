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
<script>
	const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
<jsp:include page="../include/c_header.jsp"/>


<div class="alert col-lg-4 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd;margin-top: 20px;">
  문의
</div>


<div class="col-lg-6 mx-auto" style="padding: 20px">
	<form action="/client/askProcess" method="post">
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="name">이름</label>
	      <input type="text" class="form-control" id="name" name="name" required="required">
	    </div>
	    <div class="form-group col-md-4">
	      <label for="phone">전화번호</label>
	      <input class="form-control" type="text" name="phone" oninput="autoHyphen(this)" maxlength="13" required="required">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="ask">문의 내용</label>
	    <textarea id="ask" name="ask" class="form-control" style="height:250px" placeholder="상세하게 작성해주세요. 최대 3천자까지 작성가능 합니다." required="required"></textarea>
	  </div>
	  <button type="submit" class="btn btn-primary">문의 작성</button>
	  <button id="btn_close" type="button" class="btn btn-primary">취소</button>
	</form>
</div>

<jsp:include page="../include/footer.jsp"/>

</body>
</html>