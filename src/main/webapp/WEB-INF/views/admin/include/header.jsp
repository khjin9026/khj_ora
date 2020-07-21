<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>AdminLTE 3 | 관리자 화면</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<script>
if('${msg}' !== ""){
	alert("${msg}에 성공하였습니다!");
	}
</script>

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>

</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"
					role="button"><i class="fas fa-th-large"></i></a></li>
			</ul>
		</nav>
		<!-- /.Navbar -->
		
				<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/admin" class="brand-link"> <img
				src="/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">Admin PROJECT</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="/resources/dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">User 02 <span
							class="right badge badge-danger">online</span>
						</a>

					</div>
				</div>
				<!-- SEARCH FORM -->
				<form class="form-inline ml-3">
					<div class="input-group input-group-sm">
						<input class="form-control form-control-navbar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-navbar" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</form>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

						<li class="nav-item has-treeview menu-open"><a href="/"
							class="nav-link active">
								<p>MAIN NAVIGATION</p>
						</a>

							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="/" class="nav-link">
										<p>
											사용자 홈 <i class="right fas fa-angle-left"></i>
										</p>
								</a></li>
							</ul></li>

						<li class="nav-item has-treeview menu-open"><a href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									Dash Board <i class="right fas fa-angle-left"></i>
								</p>
						</a>

							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="/admin/member/list" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>회원관리</p>
								</a></li>
								<li class="nav-item"><a href="/admin/board/list" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>게시판 관리</p>
								</a></li>
							</ul></li>

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>