<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>main page layout</title>
<style>
h1 {
	background-color: rgba(255, 50, 0, 0.5);
}
</style>
<script src="http://code.jquery.com/jquery-Latest.min.js"></script>
<script src="/resources/js/user.js"></script>
</head>
<body>
	<h1>HTML이란?</h1>
	<h2>HTML의 역사</h2>
	<h3>팀 버너스리에 대해</h3>
	<h4>HTML의 태그</h4>
	<h5>HTML의 태그</h5>
	<a href="/htmltest">페이지 다시 로딩_불러오기</a>
	<img src="/resources/images/summer.jpg" alt="여름이미지">
	<p>
		<strong>아, </strong>졸리다 <br> <b>이것은 </b>문단.
	</p>
	<p>이것은 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp; &lt; &gt; &copy;
		문단문단
	<hr>
	문단문단문단문단문단문단
	</p>
	<ul>
		<li>리스트1</li>
		<li>리스트2</li>
	</ul>
	<ol>
		<li>리스트1</li>
		<li>리스트2</li>
	</ol>
	<div>
		<h2>회원가입 폼</h2>
		<form method="GET" action="/htmltest">
			성별 <select name="gender">
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select> <br>
			<br> <input type="text" name="userid" placeholder="사용자 ID">
			<input type="password" name="password" placeholder="패스워드"> <input
				type="file" name="upload_file"> <br>
			<br> 본인소개 작성 <br>
			<textarea name="contents" cols="100" rows="5"> 여기에 글을 입력 </textarea>
			<br>
			<br> <input type="submit" name="submit" value="회원가입"
				class="login">
		</form>
	</div>
	<br>
	<br>
	<br>
	<table summary="oo학교 xx반 성적표" style="border: 1px solid black">
		<!-- 인라인 스타일 주기 -->
		<caption>학생 성적표</caption>
		<tr>
			<th> &nbsp;이름&nbsp; </th>
			<th> &nbsp;성적&nbsp; </th>
		</tr>
		<tr>
			<td>kkk</td>
			<td>99</td>
		</tr>
		<tr>
			<td colspan="2">AAAAAA</td>
		</tr>
		<tr>
			<td>BBB</td>
			<td>C</td>
		</tr>
	</table>
</body>
</html>









