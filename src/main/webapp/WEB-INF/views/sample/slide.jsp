<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- 위 뷰포트 메타태그 값은 모바일 기기에서 화면을 최적화 시키는 기능이 있음(필수) -->
<title>SIMPSONS</title>
<style>
/* 공통 css */
.center { margin: 0 auto; }
    .row {
      /* overflow: hidden; */
      width: 100%;
      max-width: 960px;
      min-width: 748px;
      margin: 0 auto;
    }
    .col-1, .col-2, .col-3, .col-4, .col-5, .col-6, .col-7, .col-8, .col-9, .col-10, .col-11 {
      float: left;
      margin-right: 3.8%;
      min-height: 1px;
    }
    .row .col-1  { width: 4.85%;	}
    .row .col-2  { width: 13.45%;	}
    .row .col-3  { width: 22.05%;	}
    .row .col-4  { width: 30.75%;	}
    .row .col-5  { width: 39.45%;	}
    .row .col-6  { width: 48%;	}
    .row .col-7  { width: 56.75%;	}
    .row .col-8  { width: 65.4%;	}
    .row .col-9  { width: 74.05%;	}
    .row .col-10 { width: 82.7%;	}
    .row .col-11 { width: 91.35%;	}
    .row .col-12 { width: 100%; float: left; }
    .last { margin-right: 0; } /* col 마지막 요소의 마진값을 없애서 레이아웃이 깨지는 것을 방지 */
    [class^=col]>:first-child { margin-top: 0; }
    img, object, embed, iframe { max-width: 100%; }
    img, iframe { height: auto; }
    .fr { float: right; }


    /* Tablet Size: 960px 이하 */
    @media all and (max-width: 960px) {
      body {
        font-size: 16px;
        line-height: 24px;
      }
      .row, body, .container {
        width: 100%;
        min-width: 0;
        margin-left: 0;
        margin-right: 0;
        padding-left: 0;
        padding-right: 0;
      }
      .row .col-1, .row .col-2, .row .col-3, .row .col-4, .row .col-5, .row .col-6, 
      .row .col-7, .row .col-8, .row .col-9, .row .col-10, .row .col-11, .row .col-12 {
        float: none;
        width: auto;
        margin-left: 0;
        margin-right: 0;
        padding-left: 20px;
        padding-right: 20px;
      }
    }
    .clearfix:after{
    content:"";
    display:block;
    clear:both;
    }
    .blind{
    visibility:hidden;
    position:absolute;
    top:-10000px;
    height:1px;
    width:1px;
    }
</style>
<style>
    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
    body, h1, h2, h3, h4, h5, h6, li, p { font-family:"Nanum Gothic","NanumGothic" !important ; font-size:14px;line-height:24px; }
    body { margin:0px; padding:0px; }
    /* 속성설명
    -webkit- : 구글, 사파리 브라우저에 적용
    -moz- : 파이어폭스 브라우저에 적용
    -ms- : 익스플로러에 적용, 보통 생략합니다.
    -o- : 오페라 브라우저에 적용
    */
    body header {
      background: url(/resources/images/simpson.jpg) no-repeat 50% 70%;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      background-size: cover;
      position:fixed;
      width:100%;
      top:0px;
      height:90px;
      z-index:999;
    }
    body > section {
      margin-top:90px; 
    }
    body ul, body ol {
      padding: 0;
      list-style: none;
    }
    body header .row #gnb,
    body header .row {
      position: relative;
      margin: 0 auto;
    }
    
    body header .row #brand {
      background: url(resources/images/nut.jpg) no-repeat 100% -50%;
      background-size: 80px 80px; 
      height: 75px;
      width: 75px;
      margin:0px;
      text-indent: -10000px;
    }
    body header .row #brand:hover {
      background-color: rgba(0, 0, 0, 0.1);
    }
    body header .row #brand:hover:before {
      top: 35px;
      -webkit-transform: rotate(360deg);
      -moz-transform: rotate(360deg);
      -ms-transform: rotate(360deg);
      transform: rotate(360deg);
    }
    body header .row #gnb {
      position: absolute;
      top: 35px;
      right: 0;
    }
    body header .row #gnb ul {
      margin: 0;
    }
    body header .row #gnb ul li {
      float: left;
      margin-right: 30px;
    }
    body header .row #gnb ul li:last-child { /*오른쪽 마진 값을 제거하지 않으면 float drop 현상이 발생*/
      margin-right: 0;
    }
    body header .row #gnb ul li a {
      font-size: 16px;
      color: #fff;
      text-decoration: none;
      text-shadow: 0 2px #282020;
    }
    body header .row #gnb ul li a:hover, body header .row #gnb ul li a:focus {
      color: #FB2A80;
      text-shadow: none;
      font-weight:bold;
    }
    

    body section#contents h2, body section#contents h3 {
      position: relative;
      margin-top:40px;
      margin-bottom: 40px;
      border-bottom: 1px solid #e1dcda;
      padding-bottom: 20px;
      font-size: 24px;
          font-weight: bold !important;
      line-height:34px;
      color: #3A4C9F;
      padding:20px;
    }
      body section#contents h2:before, body section#contents h3:before {
      content: '';
      position: absolute;
      width: 34px;
      height: 1px;
      background: #FB2A80;
      top: -10px;
      left: -36px;
      -webkit-transform: rotate(45deg);
      -moz-transform: rotate(45deg);
      -ms-transform: rotate(45deg);
      transform: rotate(45deg);
    }
    body section#contents li {
      margin-bottom: 60px;
    }
    body section#contents li img {
      border: 1px solid #e0e0e0;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
    }
    body section#contents li h4, body section#contents li h5 {
      font-size: 22px;
      font-weight: bold !important;
    }
    body section#contents li h5 {
      margin-top: 22px;
      margin-bottom: 32px;
    }
    body section#contents li p {
      font-size: 14px;
      line-height:24px;
      color: #818181;
    }
    body footer {
      border-top: 1px solid #e2e2e2;
      padding-top: 5px;
      background: url(/resources/images/pattern.jpg)
    }
    body footer p {
      padding-top: 30px;
      padding-bottom: 30px;
      background: url(/resources/images/nut.png) no-repeat 100% 50%;
      background-size: 75px 75px;
    }
    body footer p small {
      display: block;
      line-height: 1.2;
    }
  body footer p small a:link, body footer p small a:visited {
      color: #606060;
      text-decoration: none;
    }
    body footer p small a:hover, body footer p small a:active {
      color: #212121;
    }
    ::selection{
    background-color: #F3F194;
    color:#542e1c;
    }
    ::-moz-selection{
    background-color:#eee7dd;
    color: #542e1c;
    }
    
    /* Tablet Size: 960px 이하 */
    @media all and (max-width: 960px) {
    body section#contents li,
    .row .col-1, .row .col-2, .row .col-3, .row .col-4, .row .col-5, .row .col-6,
    .row .col-7, .row .col-8, .row .col-9, .row .col-10, .row .col-11, .row .col-12{
    text-align:center;
    }
    body header,
    body section#contents,
    body footer{
    width: 100%;
    padding-left: 0%;
    padding-right:0%;
    }
    section.banner_slider { display:none;}
    body section#contents {margin-top:90px;}
    /* nav > ul {display:none;} -> 메뉴바 처음에 안보이게 해주는 css */
    body header {z-index:999;}
    body header .hamberger {float:right;}
    body header a#pull {
    position:relative;
    top:-55px;
    }
    
    body section#contents h2 {
      margin-top:100px !important;
      }
      
    body header .row #brand {
      background: url(resources/images/nut.jpg) no-repeat 50% 50%;
      background-size: 70px 70px; 
      height: 70px;
      width: 70px;
      margin:0px;
      text-indent: -10000px;
    }
    body header a#pull:after{
    content:"";
    background:url('/resources/images/burger.png') no-repeat;
    width: 30px;
    height:30px;
    position:absolute;
    right:15px;
    }
    body header .row #gnb{
    position: static;
    }
    body header .row #gnb ul {
    background-color: #FB2A80;
    width:100%;
        display:none;
    }
    body header .row #gnb ul li {
    float: none;
    margin-right: 0;
    margin-bottom: 1px;
    border-top:1px solid #F3D201;
    border-bottom:1px solid #F3D201;
    padding: 10px 30px;
    background-color: #F3D201;
    }
    body header .row #gnb ul li:hover, body header .row #gnb ul li:active{
    background: #EE6847;
    }
    body header .row #gnb ul li a {
    color:#3A4C9F;
    text-shadow: none;
    }
    body header .row #gnb ul li a:hover, body header .row #gnb ul li a:focus {
      color: #3A4C9F;
      text-shadow: none;
      font-weight:extrabold;
    }
    section#contents #main img, section#contents #sub img{
    width:90%;
    padding: 10px;
    border: 1px solid #e0e0e0;
    background: #fff;
    }
    footer p{
    padding-top: 15px !important;
    padding-bottom: 15px !important;
    width: 90% !important;
    margin:0 auto !important;
    background: none !important;
    }
    }
    .nivo-caption { text-align:center !important;}
    .nivo-caption { background:#FB2A80 !important; }
    
    .row {
    margin: 0 auto !important;
    }
    .carousel-control .slide_arrow {
    position: absolute;
    top: 50% !important;
    color: #FB2A80 !important;
    }
    
    .carousel-control.left, .carousel-control.right {
    background-image: none !important;
    }
    
    .carousel-indicators li {
    border: 1px solid #FB2A80 !important;
    }
    
    .carousel-indicators .active {
    background-color: #FB2A80 !important;
    }
    
    .carousel-inner .item img {
    height: 550px !important;
    width: 100% !important;
    }
</style>
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	jQuery(function($) { //j쿼리 시작 : $(document).ready(function(){ }); == $(function(){ }); 과 동일
//모바일 메뉴 로딩시
		 var pull=$('#pull');
         var menu=$('nav > ul');
         $(pull).on('click', function(e){
           var w=$(window).width();
           if(w<960 )	{
             if(menu.is(':visible')){
                 //alert('닫을때');
                 menu.slideToggle("fast");
                 return;   	      		
             }
             if(menu.is(':hidden')){
                 //alert('열때');
                 menu.slideToggle("fast");
                 return;
             }
           }
     }); //클릭이벤트
   });
	//모바일 -> PC 원상복귀
	$(window).resize(function(){
		var w=$(window).width();
        var menu=$('nav > ul');
        if(w>960 )	{
          menu.removeAttr('style');
        }else{

        }
        return;
    });
</script>
</head>
<body>
	<header>
		<div class="row">
			<h1 id="brand">
				<a href="javascript:;">Time-Space.biz</a>
			</h1>
			<div class="hamberger">
				<a id="pull" href="javascript:;"></a>
			</div>
			<nav id="gnb">
				<a href="#contents" class="blind">skip navigation</a>
				<ul class="clearfix">
					<li><a href="javascript:;" title="Study CSS">Study CSS</a></li>
					<li><a href="javascript:;" title="Study LIB">Study LIB</a></li>
					<li><a href="javascript:;" title="Posts">Posts</a></li>
					<li><a href="javascript:;" title="WordPress">WordPress</a></li>
					<li><a href="javascript:;" title="Login">Login</a></li>
					<li><a href="javascript:;" title="Join">Join</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- e:header-->
	
	<!-- 니보 슬라이더 작동 스크립트
	<script src="/resources/js/jquery.nivo.slider.js"></script>
    <link href="/resources/css/nivo-slider.css" media="screen" rel="stylesheet" type="text/css">
    
    <script type="text/javascript">
	jQuery(function($){ //j쿼리 시작 : $(document).ready(function(){}); == $(function(){});와 동일
	$('#slider').nivoSlider({
		effect: 'slideInLeft',
	directionNav: true,
	controlNav: false,
	pauseOnHover:false,
	prevText: '<span style="font-size:30px; color:#FB2A80; padding-left:10px;"> &lt; </span>',
	nextText: '<span style="font-size:30px; color:#FB2A80; padding-right:10px;"> &gt; </span>',
	});
	$('.nivo-prevNav').on('mouseover',function(){
		$('#slider img').attr("data-transition","sliderInRight");
	});
	$('.nivo-nextNav').on('mouseover',function(){
		$('#slider img').attr("data-transition","sliderInLeft");
	});
	
	});

	</script>
	-->

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script>
	jQuery(function($) {
		$('.carousel').carousel({
			  interval: 2500,
			  pause: "hover"
			})
	});
	</script>
	<section class="banner_slider">
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="/resources/images/spring.JPG" class="d-block w-100" alt="...">
    </div>
    <div class="item">
      <img src="/resources/images/s1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="item">
      <img src="/resources/images/s2.png" class="d-block w-100" alt="...">
    </div>
    <div class="item">
      <img src="/resources/images/s3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  
  <!-- <a class="left carousel-control" href="#carouselExampleIndicators" data-slide="prev" onclick="$('#myCarousel').carousel('prev')">
	  <span class="slide_arrow" style="font-size:30px;font-weight:bold;">&lt;</span>
	  </a>
	  <a class="right carousel-control" href="#carouselExampleIndicators" data-slide="next" onclick="$('#myCarousel').carousel('next')">
	  <span class="slide_arrow" style="font-size:30px;font-weight:bold;">&gt;</span>
	  </a> -->
  
  
  <a class="left carousel-control" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color:#FB2A80;"></span>

  </a>
  <a class="right carousel-control" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color:#FB2A80;"></span>

  </a>    

    
</div>

	<!-- 니보 슬라이더용 비지니스 폼
	<div id="slider" class="nivoSlider">
		<img src="/resources/images/spring.JPG" title="SPRINGFIELD" />
		<img src="/resources/images/s1.jpg" title="Simpson Family" />
		<img src="/resources/images/s2.png" title="Simpson's House" />
		<img src="/resources/images/s3.jpg" title="Do'h!" />
	</div>
	-->
	
</section>
   
<section id="contents" class="row">
<article id="main">
	<h2>《The Simpsons》is an American sitcom animation created by Matt Graning and aired at Fox Broadcasting Company.</h2>
	<ul>
		<li class="clearfix"><img class="col-4"
			src="/resources/images/universe.jpg" alt="" width="296" height="206" />
			<div class="col-8 last">
				<h4>What is the Simpson?</h4>
				<p>The Simpsons is a family sitcom that depicts the daily life of the Simpsons and their neighbors in Homer,
				 Marge, Bart, Lisa and Maggie, who live in the city of Springfield, USA. It features unique yellow skin,
				 rounded paintings, and colorful drawings. The humorous and ridiculous life of the Simpsons and the residents
				 of Springfield is an animation that the whole family can sit down to see together in a way that ends with a
				 warm ending, and has a thick fan base from around the world. </p>
			</div></li>
		<li class="clearfix"><img class="col-8 fr last"
			src="/resources/images/fam.jpg" alt="" width="620" height="416" />
			<div class="col-4">
				<h4>Simpson Family</h4>
				<p>It began by satirizing and twisting the perfect home, the main theme of the existing American sitcom.
				And the material was gradually expanded to various areas. The main theme is to parody classical literature,
				modern movies and novels in addition to politics, excessive nationalism, and nationalism.</p>
			</div></li>
	</ul>
</article>
<!-- e:#main -->
<article id="sub" class="row clearfix">
	<h3>
	The Best scence of Simpson Episode
	</h3>
	<ul>
		<li class="col-3"><img src="/resources/images/pig.jpg"
			alt="" width="218" height="325" />
			<h5>Spider Pig</h5>
			<p><span style="color: #FB2A80;">Spider Pig! Spider Pig!</span>
			<br>Does whatever a spider pig does♪</p></li>					
		<li class="col-3"><img src="/resources/images/aa.jpg"
			alt="" width="218" height="326" />
			<h5>Chung-Gong-Ggaeng</h5>
			<p>That flag is mine! Don't MESS with Texas! Shock and awe, losers! Shock and awe!! </p></li>
		<li class="col-6 last"><img src="/resources/images/doh.jpg"
			alt="" width="459" height="324" />
			<h5>DO'h!</h5>
			<p>Eat all the doughnut in the world!</p></li>
	</ul>
</article>
<!-- e:#sub-->
</section>
<!-- e:#contents-->
<footer>
	<p class="row">
		<small> © SPRINGFIELD in Hommer Simpson's Family </small>
	</p>
	</footer><!-- e:footer-->
</body>
</html>