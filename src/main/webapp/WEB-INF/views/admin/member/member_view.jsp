<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">회원정보</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Starter Page</li>
					</ol>


				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<!-- /.col-md-6 -->
				<div class="col-lg-12">
					<!-- right column -->
					<div class="col-md-12">
						<!-- general form elements disabled -->
						<div class="card card-warning">
							<div class="card-header">
								<h3 class="card-title">READ Member</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<form role="form" action="/admin/member/delete" method="post">
									<div class="row">
										<div class="col-sm-12">
											<!-- text input -->
											<dt>user_ID</dt>
											<dd>${memberVO.user_id}</dd>
											<br>
											<dt>user_Name</dt>
											<dd>${memberVO.user_name}</dd>
											<br>
											<dt>Email</dt>
											<dd>${memberVO.email}</dd>
											<br>
											<dt>Point</dt>
											<dd>${memberVO.point}</dd>
											<br>
											<dt>Enabled</dt>
											<dd>${memberVO.enabled}</dd>
											<br>
											<dt>Level</dt>
											<dd>${memberVO.levels}</dd>

										</div>
									</div>
									<div class="box-footer">
										<div>
											<hr>
										</div>
										<a href="/admin/member/update?user_id=${memberVO.user_id}&page=${pageVO.page}" class="btn btn-warning">업데이트</a>
										<button type="submit" class="btn btn-danger">삭제</button>
										<a href="/admin/member/list?page=${pageVO.page}" class="btn btn-primary">전체목록</a>
									</div>
									<!-- box-footer 엔드 -->
								<input type="hidden" name="user_id" value="${memberVO.user_id}">
								</form>
							</div>
							<!-- /.card-body -->

						</div>
						<!-- /.card -->
						<!-- general form elements disabled -->

					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content -->

</div>
<!-- ./content-wrapper -->

<%@ include file="../include/footer.jsp"%>