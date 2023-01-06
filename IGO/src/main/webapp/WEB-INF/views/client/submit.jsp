<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

label {

	font-weight: bold;

}

</style>
</head>
<body>

<jsp:include page="../include/c_header.jsp"/>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function postSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }                
                } 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>

<script>
	const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
<div class="alert col-lg-4 mx-auto" style="text-align: center;font-size: 18px;background-color: #bdbdbd;margin-top: 20px;">
  접수 내역
</div>
<div class="col-lg-6 mx-auto" style="padding: 20px">
	<form id="sub" action="/client/submitProcess" method="post">
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="name">이름</label>
	      <input type="text" class="form-control" id="name" name="name" required>
	    </div>
	    <div class="form-group col-md-4">
	      <label for="phone">전화번호</label>
	      <input class="form-control" type="text" name="phone" oninput="autoHyphen(this)" maxlength="13" required>
	    </div>
	  </div>
	  <div class="form-row">
		  <div class="form-group col-lg-8">
		    <label for="addr">주소</label>&nbsp;&nbsp;&raquo;&nbsp;<a><i class="fa fa-location-arrow" onclick="postSearch()" style="font-size: 20px;color: black"></i></a>&nbsp;&laquo;
		    <input type="text" class="form-control"  name="addr" id="addr" required>
		  </div>
		  <div class="form-group col-lg-3">
		    <label for="addr2">상세 주소</label>
		    <input type="text" class="form-control" name="addr2" id="addr2" required>
		  </div>
	  </div>
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="category">고장 분류</label>
	      <select id="category" name="category" class="form-control" required>
	      	<option value="">==선택==</option>
	        <optgroup label="소형 가전">
	        	<option value="phone">휴대폰</option>
	        	<option value="pc">PC/노트북</option>
	        	<option value="tab">태블릿</option>
	        </optgroup>
	        <optgroup label="일반 가전">
	        	<option value="refri">냉장고</option>
	        	<option value="laundry">세탁기</option>
	        	<option value="tv">TV</option>
	        </optgroup>	        
	      </select>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputAddress2">고장 내용</label>
	    <textarea required class="form-control" name="content" style="height:250px" placeholder="상세하게 작성해주세요. 최대 3천자까지 작성가능 합니다."></textarea>
	  </div>
	  <div class="form-row">
	    <div class="form-group col-md-4">
	      <label for="form-control">희망 방문 일자</label>
	      <input required type="date" id="hopeDate" name="hopeDate" class="form-control" placeholder="희망 일자 선택" >
	    </div>
	  </div>
	  <button id="submit" type="submit" class="btn btn-primary">접수</button>
	</form>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>