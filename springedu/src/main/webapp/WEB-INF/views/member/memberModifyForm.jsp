<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/main_header.jsp" flush="false" />

<style>
.errmsg, .pwErr {
	color: #f00;
}
</style>

<link rel="stylesheet"
	href="/webjars/bootstrap/4.2.1/css/bootstrap.min.css" />

<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="/webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.2.1/js/bootstrap.min.js"></script>


<script>
	$(function() {

		//유효성체크 오류시 에러표시 css적용 
		$(".errmsg").each(function(idx) {
			if ($(this).text().length > 0) {
				$(this).prev().removeClass("is-valid").addClass("is-invalid");
			}
		});

		$("#pw,#pwchk").on("keyup", function() {
			if ($("#pw").val() != $("#pwchk").val()) {
				console.log($(this).val());
				$(".pwErr").text('비밀번호가 틀립니다!');
				$(this).focus();
			} else {
				$(".pwErr").text('');
			}
		})

		// 수정버튼
		$("#modifyBtn").on("click", function(e) {
			e.preventDefault();
			$("form").submit();
		});

		// 수정취소버튼
		$("#modifyCancelBtn").on("click", function(e) {
			e.preventDefault();
			location.href = "/";
		});
		
		$("#delBtn").on("click",function(){
			console.log("del");
			$(location).attr("href",$(this).attr("data-memurl"));
		});

	});
</script>
<div class="container">
	<div class="row">
		<div class="col offset-3">
			<form:form modelAttribute="mdto" action="${pageContext.request.contextPath }/member/memberModify">
				<div class="form-group row">
					<form:label path="id" class="col-sm-2 col-form-label col-form-label-sm">아이디</form:label>
					<form:input type="text" path="id" class="col-sm-3 form-control form-control-sm is-valid"
						placeholder="아이디를 입력하세요!" required="required" readonly="true" />
					<form:errors path="id" cssClass="col-sm-2 errmsg"></form:errors>
				</div>
				<div class="form-group row ">
					<form:label path="pw" class="col-sm-2 col-form-label col-form-label-sm">비밀번호</form:label>
					<form:input type="password" path="pw" class="col-sm-3 form-control form-control-sm is-valid"
						placeholder="비밀번호를 입력하세요!" required="required" />
					<form:errors path="pw" cssClass="col-sm-2 errmsg"></form:errors>
				</div>
				<div class="form-group row">
					<label for="pwchk" class="col-sm-2 col-form-label col-form-label-sm">비밀번호확인</label>
					<input type="password" id="pwchk" class="col-sm-3 form-control form-control-sm is-valid"
						placeholder="비밀번호를 입력하세요!" required /> 
						<span class="col-sm-2 pwErr"></span>
					<form:errors path="pw" cssClass="col-sm-2 errmsg"></form:errors>
				</div>
				<div class="form-group row">
					<form:label path="tel" class="col-sm-2 col-form-label col-form-label-sm">전화번호</form:label>
					<form:input type="tel" path="tel" class="col-sm-3 form-control form-control-sm is-valid"
						placeholder="전화번호를 입력하세요 ex)010-1234-5678" required="true" />
					<form:errors path="tel" cssClass="col-sm-2 errmsg"></form:errors>
				</div>
				<div class="form-group row">
					<form:label path="nickName" class="col-sm-2 col-form-label col-form-label-sm">닉네임</form:label>
					<form:input type="text" path="nickName" class="col-sm-3 form-control form-control-sm is-valid"
						placeholder="별칭을 입력하세요!" required="true" />
					<form:errors path="nickName" cssClass="col-sm-2 errmsg"></form:errors>
				</div>
				<div class="form-group row">
					<form:label path="gender" class="col-sm-2 col-form-label col-form-label-sm">성 별</form:label>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<form:radiobuttons items="${gender }" path="gender" itemLabel="label" itemValue="code" />
				</div>
				<div class="form-group row">
					<form:label path="region"
						class="col-sm-2 col-form-label col-form-label-sm">지역</form:label>
					<form:select path="region" class="col-sm-3 form-control form-control-sm is-valid">
						<option value="">--지역선택--</option>
						<form:options path="region" items="${rCodes }" itemLabel="label" itemValue="code" />
					</form:select>
				</div>
				<div class="form-group row">
					<form:label path="birth" class="col-sm-2 col-form-label col-form-label-sm">생년월일</form:label>
					<form:input type="date" path="birth" class="col-sm-3 form-control form-control-sm is-valid"
						placeholder="생년월일을 입력하세요!" required="true" />
					<form:errors path="birth" cssClass=" col-sm-2 errmsg"></form:errors>
				</div>
				<div class="form-group row">
					<div class="col-md-7 mb-3 justify-content-center">
						<button class="btn btn-primary btn-sm" type="submit" id="modifyBtn">수정</button>
						<button class="btn btn-primary btn-sm" type="submit" id="modifyCancelBtn">취소</button>
						<button class="btn btn-primary btn-sm" type="submit" id="delBtn" data-memurl="/member/memberDelete/${mdto.id }">회원탈퇴</button>
						<div></div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
<jsp:include page="/main_footer.jsp" flush="false" />