<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/main_header.jsp" flush="false"/>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      .errmsg, .pwErr {color: #f00;} 
       
      }
      
    </style>
    
    <script>
	$(function(){
		
		//유효성체크 오류시 에러표시 css적용 
		$(".errmsg").each(function(idx){
			if($(this).text().length > 0){
				 $(this).prev().removeClass("is-valid").addClass("is-invalid");
			}
		});	
		
		//비밀번호 확인
		$("#pw,#pwchk").on("keyup",function(){
			if($("#pw").val() != $("#pwchk").val()) {
				console.log($(this).val());
				$(".pwErr").text('비밀번호가 틀립니다!');
				$(this).focus();
			}else{
				$(".pwErr").text('');
			}
		})
		
		// 가입버튼
		$("#joinBtn").on("click",function(e){
			e.preventDefault();	
			$("form").submit();
		});
		
		// 가입초기화버튼
		$("#joinClearBtn").on("click",function(e){
			e.preventDefault();	
			$("form").each(function(){
				this.reset();
			});
		});
		
		// 가입취소버튼
		$("#joinCancelBtn").on("click",function(e){
			e.preventDefault();	
			location.href="/";
		});
		
		// 회원목록버튼
		$("#listBtn").on("click",function(e){
			e.preventDefault();	
			location.href="/member/memberList";
		});		
		
	});
</script>
    <!-- Custom styles for this template -->
    <link href="/resources/ccs/floating-labels.css" rel="stylesheet">

          
	<div class="container">
      <div class="row justify-content-center">
    <div class="col-4">
<form:form  modelAttribute="mdto" action="${pageContext.request.contextPath }/member/memberJoin">
  

  <div class="form-label-group">
    <form:label path="id">아이디</form:label>
    <form:input type="text" path="id" class="form-control" placeholder="아이디를 입력하세요!ex)aaa@bbb.com" autofocus="true" />
    <form:errors path="id" cssClass="errmsg"></form:errors>
  </div>

  <div class="form-label-group">
    <form:label path="pw">비밀번호</form:label>
    <form:input type="password" path="pw" class="form-control" placeholder="비밀번호를 입력하세요!"/>
    <form:errors path="pw" cssClass="errmsg"></form:errors>    
  </div>
  
  <div class="form-label-group">
    <label for="pwchk">비밀번호확인</label>
    <input type="password" id="pwchk" class="form-control" placeholder="비밀번호를 입력하세요!"/>
	<span class="pwErr"></span>
  </div> 
  
  <div class="form-label-group">
    <form:label path="tel">전화번호</form:label>
	<form:input type="tel" path="tel" class="form-control" placeholder="전화번호를 입력하세요 ex)010-1234-5678"/>
	<form:errors path="tel" cssClass="errmsg"></form:errors>
  </div>
  
  <div class="form-label-group">
    <form:label path="nickName" >닉네임</form:label>    
    <form:input type="text" path="nickName" class="form-control" placeholder="별칭을 입력하세요!"/>
	<form:errors path="nickName" cssClass="errmsg"></form:errors>
  </div>
  
  <div class="form-label-group">
    <form:label path="gender" >성 별</form:label><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> 
    <form:radiobuttons items="${gender }" path="gender" itemLabel="label" itemValue="code" />
  </div>
  
  <div class="form-label-group">
    <form:label path="region" >지역</form:label>
    <form:select path="region" class="form-control">
    <option value="" >--지역선택--</option>       	
    <form:options path="region" items="${rCodes }" itemLabel="label" itemValue="code" />
    </form:select>	
  </div>
    
  <div class="form-label-group">
    <form:label path="birth" >생년월일</form:label>
    <form:input type="date" path="birth" class="form-control" placeholder="생년월일을 입력하세요!"/>
	<form:errors path="birth" cssClass="errmsg"></form:errors>
  </div>  	
  
  <div class="form-label-group">
	<button class="btn btn-primary" type="submit" id="joinBtn">가입</button>
	<button class="btn btn-primary" type="submit" id="joinClearBtn">초기화</button>
	<button class="btn btn-primary" type="submit" id="joinCancelBtn">취소</button>
	<button class="btn btn-primary" type="submit" id="listBtn">회원목록</button>
  </div>
  
  <p class="mt-5 mb-3 text-muted text-center">&copy; 2019-2022</p>
</form:form>
</div></div></div>
<jsp:include page="/main_footer.jsp" flush="false" />
