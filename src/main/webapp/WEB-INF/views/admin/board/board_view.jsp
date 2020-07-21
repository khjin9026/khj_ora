<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>

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
										<h3 class="card-title">READ Board</h3>
									</div>
									<!-- /.card-header -->
									<div class="card-body">
										<form role="form" action="/admin/board/delete" method="post">
											<div class="row">
												<div class="col-sm-12">
													<!-- text input -->
													<div class="form-group">
														<label>Title</label>
														<br>${boardVO.title}
													</div>
												</div>
												<div class="col-sm-12">
													<!-- textarea -->
													<div class="form-group">
														<label>Content</label>
														<br>
														<textarea name="content" class="form-control" rows="3"
													placeholder="내용 입력" disabled>${boardVO.content}</textarea>
														
													</div>
												</div>
												<div class="col-sm-12">
													<!-- text input -->
													<div class="form-group">
														<label>Writer</label>
														<br>${boardVO.writer}
													</div>
												</div>
												<div class="col-sm-12">
													<!-- text input -->
													<div class="form-group">
														<label>FileDownload</label>
														<br>
														<a href="/download?filename=${boardVO.files[0]}">${boardVO.files[0]}</a>
													</div>
												</div>

											</div>
											<div class="box-footer">
										    <a href="/admin/board/update?bno=${boardVO.bno}&page=${pageVO.page}" class="btn btn-warning">업데이트</a>
											<button type="submit" class="btn btn-danger">삭제</button>
											<a href="/admin/board/list?page=${pageVO.page}" class="btn btn-primary">전체목록</a>
									</div>
									<input type="hidden" name="bno" value="${boardVO.bno}">
										</form>
									</div>
									<!-- /.card-body -->
									
									<!-- box-footer 엔드 -->
									
								</div>
								<!-- /.card -->

								<div class="card card-success">
									<div class="card-header">
										<h3 class="card-title">Add New Reply</h3>
									</div>
									
									<div class="card-body">
									<form role="form">
										<div class="col-sm-12">
											<!-- text input -->
											<div class="form-group">
												<label>Writer</label> <input id="replyerInput" type="text"
													class="form-control" placeholder="아이디">
											</div>
										</div>
										<div class="col-sm-12">
											<!-- text input -->
											<div class="form-group">
												<label>Reply Text</label> <input id="replytextInput" type="text"
													class="form-control" placeholder="댓글입력">
											</div>
											
										</div>
						                <div class="box-footer">
										<a href="javascript:;" id="insertApplyBtn" class="btn btn-info">댓글 추가</a>
										</div>
										<div><hr></div>
									    <!-- box-footer 엔드 -->
						                 
										</form>
										</div>
										<!-- /.card-body -->
										
										<div class="card-body">
										<div class="timeline">
											<div class="time-label" id="replyDiv" style="paddig-left:20px;">
												<span class="bg-green">Replies List [<span id="countRno"></span>]</span>
											</div>
											
											<!-- <div>
												<i class="fas fa-comments bg-yellow"></i>
												<div class="timeline-item">
													<span class="time"><i class="fas fa-clock"></i> 27mins ago</span>
													<h3 class="timeline-header">
														<a href="#">26-test</a>
													</h3>
													<div class="timeline-body">댓글 테스트 입니다</div>
													<div class="timeline-footer">

														<a class="btn btn-primary btn-sm">수정</a>
													</div>
												</div>
											</div>
											END timeline-item -->
											
										<ul class="pagination pagination-sm m-0 float-right">
													<li class="page-item"><a class="page-link" href="#">«</a></li>
													<li class="page-item"><a class="page-link" href="#">1</a></li>
													<li class="page-item"><a class="page-link" href="#">2</a></li>
													<li class="page-item"><a class="page-link" href="#">3</a></li>
													<li class="page-item"><a class="page-link" href="#">»</a></li>
												</ul>
										</div>
										<!-- 타임라인 엔드 -->
										</div>
										<!-- 타임라인 카드바디 엔드 -->
								</div>
							</div>
							<!-- /.col-md-12 -->
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<!-- /.container-fluid -->
				</div>
				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->
			</div>
			
			<!-- 댓글 관련 자바 스크립트 시작 -->
			
			<!-- 댓글 리스트 반복문용 JQuery 라이브러리 == jstl의 forEach와 같은 역할 -->
			<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
			
			<!-- 댓글 템플릿(빵틀) 만들기 -->
			<script id="template" type="text/x-handlebars-template">
				{{#each .}}
					<div class="replyLi" data-rno={{rno}}>
						<i class="fas fa-comments bg-yellow"></i>
						<div class="timeline-item">
							<span class="time"><i class="fas fa-clock"></i> {{prettifyDate regdate}} </span>
							<h3 class="timeline-header"> {{replyer}} </h3>
							<div class="timeline-body">{{replytext}}</div>
							<div class="timeline-footer">
								<a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modifyModal">수정</a>
							</div>
						</div>
					</div>
				{{/each}}
			</script>
			
			<!-- 댓글에 사용되는 변수, 함수 초기화 + 댓글템플릿(빵틀) 출력 -->
			<script>
				//댓글 변수 + 함수 초기화
				var bno = ${boardVO.bno};
				var page = 1; //페이징 변수 초기값
				//replyArr -> JSON배열데이터, target -> 출력위치, templateObject -> 댓글목록 반복처리
				
				Handlebars.registerHelper("prettifyDate", function(timeValue) {
				var dateObj = new Date(timeValue);
				var year = dateObj.getFullYear();
				var month = dateObj.getMonth() + 1;
				var date = dateObj.getDate();
				return year + "/" + month + "/" + date;
			});
				var printReplyList = function(replyArr, target, templateObject) {
					var template = Handlebars.compile(templateObject.html());
					var html = template(replyArr);
					$(".replyLi").remove();
					target.after(html);
				}
				//pageVO를 파싱하는 함수(아래)
				var printPageVO = function(pageVO, target) {
					var paging = "";
					//console.log(pageVO); //디버그
					//게시판은 jstl로, 댓글은 자바스크립트로 처리함 (로직은 똑같음)
					if(pageVO.prev){
						paging = paging + '<li class="page-item"><a class="page-link" href="'+(pageVO.startPage-1)+'">이전</a></li>';
						
					}
					for(var cnt=pageVO.startPage;cnt<=pageVO.endPage;cnt++){
						var active = (cnt==pageVO.page)?"active":"";
						paging = paging + '<li class="page-item '+active+'"><a class="page-link" href="'+cnt+'">'+cnt+'</a></li>'; 
					}
					if(pageVO.next) {
						paging = paging + '<li class="page-item"><a class="page-link" href="'+(pageVO.endPage+1)+'">다음</a></li>';
					}
					target.html(paging);
				}
				function getPage(pageInfo) {
					$.getJSON(pageInfo, function(data){
						//alert(pageInfo); //디버그
						printReplyList(data.replyList, $("#replyDiv"), $("#template"));
						printPageVO(data.pageVO, $(".pagination"));
						
						//pageVO.totalCount 변수 출력
						$("#countRno").text(data.pageVO.totalCount);
						$("#modifyModal").modal('hide'); //수정,삭제 후 모달창 없애는 명령
					});
				}
				//여기까지는 변수+함수 정의하고, 실제 사용은 아래부터 실행
				//댓글 리스트 출력실행
				$(document).ready(function(){
					//최초 페이지 로딩시 아래 명령 실행
					getPage("/reply/select/" + bno + "/" + page);
					
					//페이징번호 클릭시 페이지이동이 아니고, getPage함수 실행이 되면 OK.
					$(".pagination").on("click", "li a", function(event){
						event.preventDefault(); //기본 a href 이동 이벤트 금지
						page = $(this).attr("href"); //페이지번호 1, 2, 3...
						getPage("/reply/select/"+ bno + "/" + page);
					});
				});
			</script>
			
			<script>
			//댓글 입력, 수정, 삭제 버튼 이벤트 처리(Ajax를 활용해 URL호출 = JSON 데이터 get-set)
			$(document).ready(function() {
				$("#replyDelBtn").on("click", function(){
					var replytext = $("#replytext").val();
					var rno = $("#rno").val();
					//ajax -> json형식 키:값
					$.ajax({
						type:'delete',
						url:'/reply/delete/' + rno,
						headers: {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"DELETE"
						},
						success:function(result){
							if(result == 'SUCCESS'){
								alert("삭제되었습니다");
								getPage("/reply/select/"+ bno + "/" + page);
							}
						}	
					});
				});
				$("#replyModBtn").on("click", function(){
					var replytext = $("#replytext").val();
					var rno = $("#rno").val();
					//alert(replytext + rno);
					//return false; //디버그 : 여기까지 실행 끝내기
					//ajax -> json형식 키:값
					$.ajax({
						type:'put',
						url:'/reply/update/' + rno,
						headers: {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"PUT"
						},
						dataType:'text',
						data:JSON.stringify({
							replytext:replytext
							}),
						success:function(result){
							if(result == 'SUCCESS'){
								alert("수정되었습니다");
								getPage("/reply/select/"+ bno + "/" + page);
							}
						}	
					});
				});
				$("#insertApplyBtn").bind("click", function(){
					var replyer = $("#replyerInput").val();
					var replytext = $("#replytextInput").val();
					//입력값 유효성 검사(validation)처리
					if(replyer == "" || replytext == ""){
						alert("작성자와 댓글내용은 필수 입력값 입니다");
						return false;
					}
					//ajax -> json형식 키:값
					$.ajax({
						type:'post',
						url:'/reply/insert',
						headers: {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						dataType:'text',
						data:JSON.stringify({
							bno:bno,
							replyer:replyer,
							replytext:replytext
							}),
						success:function(result){
							if(result == 'SUCCESS'){
								alert("등록되었습니다");
								getPage("/reply/select/"+ bno + "/" + page);
								$("#replyerInput").val("");
								$("#replytextInput").val("");
							}
						}	
					});
				});
			});
			</script>
			
			<!-- 댓글 수정/삭제용 모달팝업창 -->
			<div id="modifyModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
			<div class="modal-header" style="display:block;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" data-rno>
				<input type="hidden" id="rno" class="from-control">
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
				<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			</div>
			</div>
			</div>
			
			<script>
			//댓글 리스트에서 댓글 수정버튼 클릭시 모달창 내용에 바인딩 시키는 코딩
			//제이쿼리 사용할 준비(콜백함수로)
			$(document).ready(function(){
				//선택한 댓글(template:빵틀)의 데이터를 모달창의 id, 클래스에 데이터 바인딩
				$(".timeline").on("click", ".replyLi", function(event){
					var reply = $(this);
					$("#rno").val(reply.attr("data-rno")); //input 타입은 value로 바인딩
					$(".modal-title").html(reply.find(".timeline-header").text()); //일반 h태그류는 html로 바인딩
					$("#replytext").val(reply.find(".timeline-body").text());
				});
			});
			</script>
			
			<!-- 댓글 관련 자바 스크립트 끝 -->
			
<%@ include file="../include/footer.jsp" %> 