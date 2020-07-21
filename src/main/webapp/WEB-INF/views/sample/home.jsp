<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scaleable=no">
<title>HOME</title>
<link rel="shortcut icon" href="/images/favicon/favicon.ico">
<link rel="apple-touch-icon-precomposed"
	href="/images/favicon/home-touch-icon.png">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/user.css">
<style>
.go_top {
	position: fixed;
	padding: 20px;
	opacity: 0.8;
	right: 20px;
	bottom: 112px;
	text-align: center;
	background: blue;
	z-index: 100;
	color: white !important;
}
</style>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/common.js"></script>

<!-- 사용자 스크립트 -->
<script>
	
</script>

<!-- 부트스트랩 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 더미 데이터:CSS작업전 내용 -->
	<!-- 공통 상단메뉴 -->
	<div id="wrap">
		<header class="header cfixed">
			<h1 class="logo">
				<img src="/resources/images/travel.png"> <a href="">SUMMER</a>
			</h1>
			<nav>
				<ul class="gnb">
					<li><a href="/">HOME</a></li>
					<li><a href="#weare">WE ARE</a></li>
					<li><a href="#work">WORK</a></li>
					<li><a href="#blog">BLOG</a></li>
					<li><a href="#contactus">CONTACT US</a></li>
				</ul>
			</nav>
			<span class="menu-toggle-btn"> <span></span> <span></span> <span></span>
			</span>
		</header>

		<!-- HOME 더미 -->
		<article class="slider">
			<img src="/resources/images/summer.jpg" alt="">
		</article>

		<!-- WE ARE 더미 -->
		<section class="content">
			<section class="display-section">
				<div class="container">
					<h2 class="sec-tit" id="weare">WE ARE</h2>
					<p class="desc">
						"휴먼 교육센터 디지털 컨버전스 과정 입니다." <br> "그리고, 지금은 화면 설계 시간 입니다."
					</p>
				</div>
			</section>
			<section class="promotion-section">
				<div class="container">
					<ul class="promo-list">
						<li><a href="#" onclick="return false"> <img
								src="/resources/images/summer.jpg" alt="">
								<h3>HOME</h3>
								<p>미안하다 이거 보여주려고 어그로 끌었다.</p>
						</a></li>
						<li><a href="#" onclick="return false"> <img
								src="/resources/images/beach.jpg" alt="">
								<h3>WE ARE</h3>
								<p>미안하다 이거 보여주려고 어그로 끌었다.</p>
						</a></li>
						<li><a href="#" onclick="return false"> <img
								src="/resources/images/water.jpg" alt="">
								<h3>WORK</h3>
								<p>미안하다 이거 보여주려고 어그로 끌었다.</p>
						</a></li>
						<li><a href="#" onclick="return false"> <img
								src="/resources/images/leaf.jpg" alt="">
								<h3>BLOG</h3>
								<p>미안하다 이거 보여주려고 어그로 끌었다.</p>
						</a></li>
					</ul>
				</div>
			</section>
		</section>

		<!-- WORK 더미 -->
		<section class="work-section cfixed">
			<h2 class="sec-tit" id="work">WORK</h2>
			<ul class="work-list">
				<li><a href="#" onclick="return false">
						<div class="info">
							<h3>작업1</h3>
							<span>소스/작업1</span>
						</div> <img src="/resources/images/summer.jpg" alt="">
				</a>
				<li><a href="#" onclick="return false">
						<div class="info">
							<h3>작업2</h3>
							<span>소스/작업2</span>
						</div> <img src="/resources/images/summer.jpg" alt="">
				</a>
				<li><a href="#" onclick="return false">
						<div class="info">
							<h3>작업3</h3>
							<span>소스/작업3</span>
						</div> <img src="/resources/images/summer.jpg" alt="">
				</a>
				<li><a href="#" onclick="return false">
						<div class="info">
							<h3>작업4</h3>
							<span>소스/작업4</span>
						</div> <img src="/resources/images/summer.jpg" alt="">
				</a>
				<li><a href="#" onclick="return false">
						<div class="info">
							<h3>작업5</h3>
							<span>소스/작업5</span>
						</div> <img src="/resources/images/summer.jpg" alt="">
				</a>
				<li><a href="#" onclick="return false">
						<div class="info">
							<h3>작업6</h3>
							<span>소스/작업6</span>
						</div> <img src="/resources/images/summer.jpg" alt="">
				</a>
				<li><a href="#" onclick="return false">
						<div class="info">
							<h3>작업7</h3>
							<span>소스/작업7</span>
						</div> <img src="/resources/images/summer.jpg" alt="">
				</a>
				<li><a href="#" onclick="return false">
						<div class="info">
							<h3>작업8</h3>
							<span>소스/작업8</span>
						</div> <img src="/resources/images/summer.jpg" alt="">
				</a>
			</ul>
		</section>

		<!-- BLOG 더미 -->
		<section class="blog-section">
			<div class="container">
				<h2 class="sec-tit" id="blog">BLOG</h2>
				<ul class="blog-list">
					<li><a href="#" onclick="return false"> <img
							src="/resources/images/summer.jpg" alt=""></a> <time
							datetime="2020-05-26">MAY 5, 2020</time> <a href=""><h3>
								타임스페이스는 사용자 중심의 웹페이지 제작 회사입니다 <br>안녕하세요 감사해요 잘있어요 다시만나요
							</h3> </a></li>
					<li><a href="#" onclick="return false"> <img
							src="/resources/images/summer.jpg" alt=""></a> <time
							datetime="2020-05-26">MAY 5, 2020</time> <a href=""><h3>타임스페이스는
								사용자 중심의 웹페이지 제작 회사입니다</h3> </a></li>
					<li><a href="#" onclick="return false"> <img
							src="/resources/images/summer.jpg" alt=""></a> <time
							datetime="2020-05-26">MAY 5, 2020</time> <a href=""><h3>타임스페이스는
								사용자 중심의 웹페이지 제작 회사입니다</h3> </a></li>
				</ul>
			</div>
		</section>

		<!-- CONTACT US 더미 -->
		<section class="contact-section">
			<div class="container">
				<h2 class="sec-tit" id="contactus">CONTACT</h2>
				<div class="form-box">
					<form action="" method="">
						<fieldset class="cfixed">
							<legend class="blind">CONTACT US</legend>
							<div class="form">
								<label for="name" class="blind">name</label> <input type="text"
									id="name" placeholder="Name"> <label for="phone"
									class="blind">phone</label> <input type="tel" id="phone"
									placeholder="Phone"> <label for="email" class="blind">email</label>
								<input type="email" id="email" placeholder="Email Address">
							</div>
							<div class="textarea">
								<label for="message" class="blind">message</label>
								<textarea name="message" id="message" placeholder="Message"></textarea>
							</div>
						</fieldset>
						<div class="send-btn">
							<button type="button" class="" data-toggle="modal"
								data-target="#exampleModal">메세지 보내기</button>
						</div>
					</form>
				</div>
			</div>
		</section>

		<footer class="footer">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3315.074067146276!2d-117.92505714919277!3d33.81040163778826!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80dcd7da84d77583%3A0x7efd02b2f50ccd51!2z65SU7KaI64uI656c65OcIOumrOyhsO2KuA!5e0!3m2!1sko!2skr!4v1591236621464!5m2!1sko!2skr"
				width="600" height="450" frameborder="0" style="border: 0;"
				allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
			" <img src="/resources/images/travel.png">
			<p class="copyright">SUMMER</p>
		</footer>
	</div>
	<a href="#" class="s_point"><p class="go_top">TOP</p></a>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">메세지 보내기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<input class="form-control" type="text" id="message"
						placeholder="메세지 내용 입력">
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
</body>
</html>