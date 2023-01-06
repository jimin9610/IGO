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
	const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
</head>
<body>

<div style="text-align: center;padding-top: 15px">
	<div class="col-lg-5 mx-auto" style="padding: 20px"><img style="width:70%" src="/resources/images/LOGO.png"></a></div>
</div>

<form action="/fixer/updateFixer" method="post" enctype="multipart/form-data">
	<div class="card mb-3 mx-auto" style="max-width: 500px;margin: 50px;height:220px">
	  <div class="row no-gutters" style="height: 100%">
	    <div class="col-md-4">
			<div class="form-group uploadDiv mx-auto">
				<input type="file" id="file" name="file" style="display: none;" value="${info.profile}" required="required">
				<div id="preview">
					
				</div>
			</div>
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title"><input type="text" class="form-control" name="fname" placeholder="이름" required="required" value="<c:out value="${info.fname}"/>"></h5>
	        <input name="fid" type="hidden" value="${info.fid}">
	        <h5 class="card-title"><input type="password" class="form-control" name="password" placeholder="비밀번호" required="required" value="<c:out value="${info.password}"/>"></h5>
	        <p class="card-text" ><input class="form-control" type="text" name="fphone" oninput="autoHyphen(this)" maxlength="13" required="required" value="<c:out value="${info.fphone}"/>"></p>
	        <input class="btn btn-sm btn-secondary" type="button" id="click" value="사진 선택">
	    	<button type="submit" class="btn btn-sm btn-secondary">수정</button>
	    	<a href="javascript:history.back();" class="btn btn-sm btn-outline-dark">뒤로</a>
	      </div>
	    </div>
	  </div>
	</div>
</form>
<script type="text/javascript">
  $(document).ready(function (e){
	  
	$("#click").click(() => {
		
		$("#file").click();
		
	})
	  
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();
      $('#original').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;">';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=165 height=180 /><input type="hidden" name="profile" value="'+f.name+'">';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
        	alert("이미지 파일만 업로드 하세요!");
            return false;
        }
      });//arr.forEach
    }
  });
</script>
</body>
</html>