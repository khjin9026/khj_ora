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
					<h1 class="m-0 text-dark">DashBoard Management</h1>
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
								<h3 class="card-title">CREATE Board</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<form role="form" action="/admin/board/write" method="post" encType="multipart/form-data">
									<div class="row">
										<div class="col-sm-12">
											<!-- text input -->
											<div class="form-group">
												<label>Title</label> <input name="title" type="text"
													class="form-control" placeholder="제목 입력">
											</div>
										</div>
										<div class="col-sm-12">
											<!-- textarea -->
											<div class="form-group">
												<label>Content</label>
												<textarea name="content" class="form-control" rows="3"
													placeholder="내용 입력"></textarea>
											</div>
										</div>
										<div class="col-sm-12">
											<!-- text input -->
											<div class="form-group">
												<label>Writer</label> <input name="writer" type="text"
													class="form-control" placeholder="작성자 입력">
											</div>
										</div>
										<div class="col-sm-12">
										<div class="form-group">
											<label>아래 영역에 파일을 드래그 해서 업로드 가능</label>
											<div class="col-sm-12">
												<!-- textarea -->
												<div class="form-group">
													<textarea class="form-control" rows="3" disabled=""></textarea>
												</div>
											</div>
											<div class="custom-file">
												<tr>
													<label>아래 기존 파일 업로드 창 사용가능</label>
													<br>
													<td><input type="file" value="파일 선택" name="file" /></td>
												</tr>
											</div>
										</div>
									
									</div>
									<!-- /.row -->
									<div class="box-footer" style="padding: 10px;">

										<div>
											<hr>
										</div>
										<ul class="mailbox-attachments clearfix uploadedList">
										</ul>
										<!-- submit -> form안의 내용을 입력해주는 역할 so, form태그 안쪽에 있어야 작동 됨! -->
										<button type="submit" class="btn btn-warning">작성하기</button>
										<a href="/admin/board/list" class="btn btn-primary">전체목록</a>
									</div>
								</div>
								</form>
							</div>



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
<!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp"%>
