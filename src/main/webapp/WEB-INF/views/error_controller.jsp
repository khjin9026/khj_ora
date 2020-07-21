<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="include/header.jsp" %>
<script>
if('${param.msg}' == "fail"){
	alert('로그인에 실패했습니다.! 상세메세지 ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}');
}
</script>
	<!-- container start -->
	<div id="container">
		<!-- location_area -->
		<div class="location_area member">
			<div class="box_inner">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">에러페이지 <span class="path">/</span>${exception.getMessage()}</p>
				<ul class="page_menu clear">
					<li><a href="javascript:;" class="on">에러페이지</a></li>
				</ul>
			</div>
		</div>	
		<!-- //location_area -->

		<!-- bodytext_area -->
		<div class="bodytext_area box_inner">
			<p><a href='<c:out value="${prevPage}"/>'>GO BACK</a>
			<p> 에러 상세내역 </p>
			<ul>
				<c:forEach items="${exception.getStackTrace()}" var="stack">
					<li>${stack.toString()}</li>
				</c:forEach>	
			</ul>
		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->
<%@ include file="include/footer.jsp" %>