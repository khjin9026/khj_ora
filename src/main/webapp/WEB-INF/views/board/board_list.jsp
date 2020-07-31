<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<!-- container -->
<div id="container">
	<%@ include file="../include/container_header.jsp"%>

	<!-- bodytext_area -->
	<div class="bodytext_area box_inner">
	<form action="/board/list" class="minisrch_form">
		<fieldset style = "margin-top: 20px;">
			<legend>검색</legend>
			<select name="searchBoard" class="select_common">
			<option value="">게시판 선택</option>
			<option value="notice" <c:out value="${(session_bod_type eq 'notice')?('selected'):('')}"/>>공지사항</option>
			<option value="gallery" <c:out value="${(session_bod_type eq 'gallery')?('selected'):('')}"/>>갤러리</option>
		</select>
			<input name="searchType" type="hidden" value="all">
			<input name="searchKeyword" type="text" class="tbox" title="검색어를 입력해주세요"
				placeholder="검색어를 입력해주세요"> 
				<button type="submit" class="btn_srch">검색</button>
	</fieldset>
	</form>
		<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
			<caption class="hdd">공지사항 목록</caption>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
					<th scope="col">게시판</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="boardVO" varStatus="status">
					<tr>
						<td>${boardVO.rnum}</td>
						<td><a href="/board/view?bno=${boardVO.bno}&page=${pageVO.page}">${boardVO.title}</a></td>
						<td><span class="badge bg-danger">${boardVO.view_count}</span></td>
						<td><span class="tag tag-success">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" />
						<td>${boardVO.bod_type}</td>
						</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- pagination -->
		<div class="pagination">
		<c:if test="${pageVO.prev}">
			<a href="/board/list?page=${pageVO.startPage-1}&searchType=${pageVO.searchType}&searchKeyword=${pageVO.searchKeyword}" class="firstpage  pbtn"><img src="/resources/home/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
		</c:if>
		<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
			<a href="/board/list?page=${idx}&searchType=${pageVO.searchType}&searchKeyword=${pageVO.searchKeyword}"><span class='pagenum <c:out value="${idx == pageVO.page?'currentpage':''}"/>'>${idx}</span></a>
		</c:forEach>
		<c:if test="${pageVO.next}">
			<a href="/board/list?page=${pageVO.endPage+1}&searchType=${pageVO.searchType}&searchKeyword=${pageVO.searchKeyword}" class="nextpage  pbtn"> <img src="/resources/home/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
		</c:if>
		</div>
										
		<!-- //pagination -->
		<p class="btn_line">
			<a href="/board/write" class="btn_baseColor">등록</a>
	</div>
	<!-- //bodytext_area -->

</div>
<!-- //container -->

<%@ include file="../include/footer.jsp"%>