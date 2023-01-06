<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	//정상적인 로그인 사용자인 경우 세션 정보를 가져온다
	String sessionId = (String) session.getAttribute("session_id");
%>

</head>
<body>

<jsp:include page="../include/f_header.jsp"/>

<div class="alert col-lg-4 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd;margin-top: 20px;">
  답변
</div>


<form action="/fixer/a_insert" method="post" >
	<div class="col-lg-6 mx-auto" style="padding: 20px">
		<c:forEach var="info" items="${info}">
			<c:if test="${info.fid eq fid}">
			  <div class="form-row">
			    <div class="form-group col-md-4">
			      <label for="name">기사명</label>
			      <input type="hidden" name="fid" value="${fid}">
			      <input type="hidden" name="aid" value="${aid}">
			      <input type="text" class="form-control" name="fname" readonly="readonly" value="${info.fname}">
			    </div>
			    <div class="form-group col-md-4">
			      <label for="phone">전화번호</label>
			      <input type="text" class="form-control" name="fphone" readonly="readonly" value="${info.fphone}">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="content">답변</label>
			    <textarea name="answer" class="form-control" style="height:250px" placeholder="최대 3천자까지 작성가능합니다." required="required"></textarea>
			  </div>
		  	<button type="submit" class="btn btn-primary">답변 작성</button>
		  	<a href="/fixer/q_list" class="btn btn-primary">취소</a>
		</c:if>
	 </c:forEach>
	</div>
</form>
</body>
</html>