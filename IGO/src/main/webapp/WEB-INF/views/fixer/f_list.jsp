<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<div class="col-lg-7 mx-auto" style="padding: 20px">

	<div class="form-row" style="margin-bottom: 10px">
		<form action="/fixer/mypage/" method="get">
	    	<div class="form-row">
                <input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
                <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                <select name="type" class="custom-select custom-select-sm" style="width: 150px;text-align: center;">
                	<option value="" selected>==카테고리==</option>
                	<optgroup label="--소형 가전--">
			        	<option value="phone" <c:if test="${pageMaker.cri.type eq 'phone'}">selected</c:if> >휴대폰</option>
			        	<option value="pc" <c:if test="${pageMaker.cri.type eq 'pc'}">selected</c:if>>PC/노트북</option>
			        	<option value="tab" <c:if test="${pageMaker.cri.type eq 'tab'}">selected</c:if>>태블릿</option>
			        </optgroup>
			        <optgroup label="--일반 가전--">
			        	<option value="refri" <c:if test="${pageMaker.cri.type eq 'refri'}">selected</c:if>>냉장고</option>
			        	<option value="laundry" <c:if test="${pageMaker.cri.type eq 'laundry'}">selected</c:if>>세탁기</option>
			        	<option value="tv" <c:if test="${pageMaker.cri.type eq 'tv'}">selected</c:if>>TV</option>
			        </optgroup>	 
                </select>
                &nbsp;
				<button style="height: 30px;" class="btn btn-secondary btn-sm align-middle">조회</button>
	   		</div>
   		</form>
   	</div>

	<table class="table" style="text-align: center;">
		<tr>
			<th class="align-middle">No.</th>
			<th class="align-middle">분류</th>
			<th class="align-middle">상세</th>
			<th class="align-middle">희망 일자</th>
			<th class="align-middle">상태</th>
		</tr>
		<c:forEach var="request" items="${list}">
			<tr>
				<td class="align-middle"><c:out value="${request.rn}"/>
					<input type="hidden" name="rid" value="${request.rid}">
					<input type="hidden" name="fid" value="${fid}">
				</td>
				<td class="align-middle">
					<c:if test="${request.category eq 'phone'}">
						휴대폰
					</c:if>
					<c:if test="${request.category eq 'pc'}">
						PC/노트북
					</c:if>
					<c:if test="${request.category eq 'tab'}">
						태블릿
					</c:if>
					<c:if test="${request.category eq 'refri'}">
						냉장고
					</c:if>
					<c:if test="${request.category eq 'laundry'}">
						세탁기
					</c:if>
					<c:if test="${request.category eq 'tv'}">
						TV
					</c:if>
				</td>
				<td class="align-middle">
					<a href="" onclick='window.open("${path}/fixer/f_read?rid=${request.rid}","resPopup","width=800,height=650, scrollbars=yes, resizable=yes")' style="text-decoration: none;">
						<c:choose>
				           <c:when test="${fn:length(request.content) > 14}">
				            	<c:out value="${fn:substring(request.content,0,13)}"/>....
				           </c:when>
				           <c:otherwise>
				           		<c:out value="${request.content}"/>
				           </c:otherwise> 
			          	</c:choose>
			        </a>
				</td>
				<td class="align-middle">${request.acceptDate}</td>
				<td class="align-middle">
					<c:if test="${request.status eq 'S'}">
						접수 완료<br><a onclick='window.open("${path}/fixer/fixList?rid=${request.rid}","resPopup","width=800,height=650, scrollbars=yes, resizable=yes")' class="btn btn-outline-dark btn-sm">내역 등록</a>
					</c:if>
					<c:if test="${request.status eq 'D'}">
						수리 완료<br><a onclick='window.open("${path}/fixer/fixList?rid=${request.rid}","resPopup","width=800,height=650, scrollbars=yes, resizable=yes")' class="btn btn-outline-dark btn-sm">내역 등록</a>
					</c:if>
					<c:if test="${request.status eq 'P'}">
						결제 완료<br><a onclick='window.open("${path}/fixer/fixList?rid=${request.rid}","resPopup","width=800,height=650, scrollbars=yes, resizable=yes")' class="btn btn-outline-dark btn-sm">내역 보기</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="mx-auto">
       <ul class="pagination">
          <c:if test="${pageMaker.prev}">
             <li class="page-item previous">
                <a class="page-link" href="${pageMaker.startPage - 1}">이전</a>
             </li>
          </c:if>
          <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
             <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
                <a class="page-link" href="${num}">${num}</a>
             </li>
          </c:forEach>
          <c:if test="${pageMaker.next}">
             <li class="page-item next">
                <a class="page-link" href="${pageMaker.endPage + 1}">다음</a>
             </li>
          </c:if>
       </ul>
    </div>
    
    <!-- page311 현재페이지번호와 보여지는 행수를 hidden 처리 -->
    <form id="actionForm" action="/fixer/mypage/" method="get">
         <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
         <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
         <input type="hidden" name="type" value="${pageMaker.cri.type}">
    </form>
    
    <script>
    var actionForm = $("#actionForm");
    
    $(".page-item a").on("click",function(e){
       e.preventDefault();//a태그 원래 처리부분을 막는다.
       
       //pageNum 속성값에 클릭한 현재 페이지번호를 대입
       actionForm.find("input[name='pageNum']").val($(this).attr("href"));
       actionForm.submit();
    });
    
    $(".move").on("click",function(e){
        e.preventDefault();
        
        actionForm.append("<input type='hidden' name='rid' value='"+$(this).attr("href")+"'>");
        actionForm.attr("action","/fixer/mypage/").submit();
        
     });
    </script>
</body>


</html>