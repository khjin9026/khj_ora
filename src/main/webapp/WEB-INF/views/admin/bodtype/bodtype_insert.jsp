<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">DashBoard Management</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Starter Page</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
	</div>
	
        <div class="col-12">
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">게시판생성 리스트</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              
				<form role="form" action="/admin/bodtype/write" method="post">
					<div class="row">
					
						<div class="col-sm-12">
							<!-- text input -->
							<div class="form-group">
								<label>보드타입</label>
								<input id="bod_type" value="${bodTypeVO.bod_type}" name="bod_type" type="text"
									class="form-control" placeholder="보드타입 입력" required>
								<span id="msg_validation"></span>
							</div>
						</div>
						<div class="col-sm-12">
							<!-- text input -->
							<div class="form-group">
								<label>보드이름</label>
								<input value="${bodTypeVO.bod_name}" name="bod_name" type="text"
									class="form-control" placeholder="보드이름 입력">
							</div>
						</div>
						<div class="col-sm-12">
							<!-- text input -->
							<div class="form-group">
								<label>출력순서</label>
								<input value="0" name="bod_sun" type="text"
									class="form-control" placeholder="출력순서는 숫자로 입력해주세요">
							</div>
						</div>
						
					</div>
					<hr>
				<!-- /.card-body -->
				<div class="box-footer">
					<!-- submit -> form안의 내용을 입력해주는 역할 so, form태그 안쪽에 있어야 작동 됨! -->
					<button id="submit_check" disabled type="submit" class="btn btn-warning">완료</button>
					<a href="/admin/bodtype/list" class="btn btn-primary">전체목록</a>
				</div>
				
			</form>
						
            </div>
            <!-- /.card -->
          </div>
 	</div>
    </div>
    <!-- ./Content Wrapper. Contains page content -->
    <script>
    $(document).ready(function(){
    	//.focus()초점 <-> .blur()흐리게
    	$("#bod_type").blur(function(){
    		var bod_type = $("#bod_type").val();
    		//Ajax => Asyn비동기 Javascript And Xml(Json데이터-key:value)
    		$.ajax({
    			type:'get',
    			url:'/admin/bodtype/bodtype_check?bod_type='+bod_type,
    			success:function(result){
    				if(result=='1'){
    					//alert("기존 게시판이 존재합니다");
    					$("#msg_validation").text("*기존 게시판이 존재합니다");
    					$("#msg_validation").css({"color":"red","font-size":"12px"});
    					$("#submit_check").attr("disabled",true); //disabled 활성화
    				}else{
    					$("#msg_validation").text("사용가능한 게시판입니다");
    					$("#msg_validation").css({"color":"red","font-size":"12px"});
    					$("#submit_check").attr("disabled",false); //disabled 비활
    				}
    			},
    			error:function(){
    				alert("RestAPI서버에서 에러가 발생되었습니다");
    			}
    		});
    	});
    });
    </script>
<%@ include file="../include/footer.jsp" %> 