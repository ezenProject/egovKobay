<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="utf-8">
  <head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kobay 모두가 판매자이자 구매자이다.</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="../../../css/kobay.css" >
	  
<!-- 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- 	<link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  	<script>
		  $(function(){
			
			$("#saveBtn").click(function(){
						
			var form = new FormData(document.getElementById('frm'));
// 			var form = $("#frm").serialize();
			alert(form);
					
			$.ajax({
				type: 'POST',
				data: form,
				url: "<c:url value='/uploadFileSave'/>",
				dataType: "json",
				processData: false,
				contentType: false,
		
				success: function(data){                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
					if(data.cnt>0){
						alert("저장됐습니다.");
						location.href = "<c:url value='/Write'/>";
					}else{
						alert("저장에실패");
					}
				},
				error: function(error){
					alert("error : " + error);
				}
			});
			
			
		});
		});
	  </script>
  <style type="text/css">
	.filebox input[type="file"] {
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
	}

	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	}

	/* named upload */
	.filebox .upload-name {
		display: inline-block;
		padding: .5em .75em;
		font-size: inherit;
		font-family: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #f5f5f5;
		border: 1px solid #ebebeb;
		border-bottom-color: #e2e2e                                                                                                                               2;
		border-radius: .25em;
		-webkit-appearance: none; /* 네이티브 외형 감추기 */
		-moz-appearance: none;
		appearance: none;
	}
	
	/* imaged preview */
	.filebox .upload-display {
	    margin-bottom: 5px;
	    
	}
	
	@media(min-width: 768px) {
	    .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
	    }
	}
	
	.filebox .upload-thumb-wrap {
	    display: inline-block;
	    width: 240px;
	    padding: 2px;
	    vertical-align: middle;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    background-color: #fff;
	}
	
	.filebox .upload-display img {
	    display: block;
	    max-width: 100%;
	    width: 100% \9;
	    height: auto;
	}
	
	.filebox.bs3-primary label {
		color: #fff;
		background-color: #337ab7;
		border-color: #2e6da4;
	}
		
	
	
	</style>
  
  <script>

	$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');
	
	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 
	
	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };
	
	        $(this).siblings('.upload-name').val(filename);
	    });
	
	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');
	
	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();
	
	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }
	
	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
	
	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});
	
	</script>
  

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-default fixed-top navbar-static-top bg-blue" role="navigation" style="margin-bottom: 0">
		<div class="container" style="width: 100%;">
			<div class="row justify-content-between align-items-center" style="width: 100%;">
				<div class="col-12 col-sm-auto order-sm-1 text-center">
					<a class="navbar-brand" href="index.jsp"><label class="logo">Kobay</label></a>
				</div>
				<div class="col-4 order-sm-2">
				    <div class="input-group">
				      <span class="input-group-btn">
				        <button class="btn search-btn" type="button"><i class="fa fa-search fa-lg" style="color: #0080ff"></i></button>
				      </span>
				      <input type="text" class="form-control search-input" placeholder="검색어를 입력하세요.">
				    </div><!-- /input-group -->
			  	</div>
				<div class="col-6 col-sm-auto order-sm-3" >
					 <span class="top-icon"><i class="fa fa-user-circle-o fa-2x" aria-hidden="true" style="color: #ffffff"></i></span>
					 <span class="top-icon"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true" style="color: #ffffff"></i></span>
				</div>
			</div>
			
		</div> 
	<!-- /.navbar-top -->
   
    </nav>
    <nav class="navbar navbar-expand-lg navbar-light bg-light subnav">
      <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">Contact</a>
            </li>
            <li class="nav-item px-lg-4 dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Portfolio
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="#">1 Column Portfolio</a>
                <a class="dropdown-item" href="#">2 Column Portfolio</a>
                <a class="dropdown-item" href="#">3 Column Portfolio</a>
                <a class="dropdown-item" href="#">4 Column Portfolio</a>
                <a class="dropdown-item" href="#">Single Portfolio Item</a>
              </div>
            </li>
            <li class="nav-item px-lg-4 dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Blog
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="#">Blog Home 1</a>
                <a class="dropdown-item" href="#">Blog Home 2</a>
                <a class="dropdown-item" href="#">Blog Post</a>
              </div>
            </li>
            <li class="nav-item px-lg-4 dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Other Pages
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="#">Full Width Page</a>
                <a class="dropdown-item" href="#">Sidebar Page</a>
                <a class="dropdown-item" href="#">FAQ</a>
                <a class="dropdown-item" href="#">404</a>
                <a class="dropdown-item" href="#">Pricing Table</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	

    <!-- Page Content -->
    <!-- 각자페이지에서 변경할 부분 -->
    <div class="container">
		<form name="frm" method="post" id="frm" enctype="multipart/form-data"  action="">	
	      <div class="row">
	        <div class="col-lg-8 mb-4">
	          <h3>상품등록</h3>
	          <p></p>
	          <form name="sentMessage" id="contactForm" novalidate>
	            <div class="control-group form-group">
	              <div class="controls">
	                <label>카테고리:</label>
	                	<br>
	               		<input type="radio" name="category" value="pants">바지
						<input type="radio" name="category" value="Tshirts">티셔츠
						<input type="radio" name="category" value="accesory">악세서리
	                <p class="help-block"></p>
	              </div>
	            </div>
	            <div class="control-group form-group">
	              <div class="controls">
	              
	                <label>등록기간:</label>
	               
	                <input type="text" class="form-control" name="sdate" id="sdate" style="width:30%;"> ~ 
	               
	               
	                <input type="text" class="form-control" name="edate" id="edate" style="width:30%;">
	             	
	              </div>
	            </div>
	           
	            <div class="control-group form-group">
	              <div class="controls">
	                <label>상품명:</label>
	                <input type="text" class="form-control" name="title" id="title">
	              </div>
	            </div>
	            
	            <div class="control-group form-group">
	              <div class="controls">
	                <label>상품이미지:</label>
	             	   <div class="filebox bs3-primary preview-image"> 
							<input class="upload-name" value="파일선택" disabled="disabled" style="width:200px;">
							<label for="file1">업로드</label> 
							<input type="file" name="file1" id="file1" class="upload-hidden"> 
						</div>   
	              </div>
	            </div>
	            
	            <div class="control-group form-group">
	              <div class="controls">
	                <label>상품가격:</label>
	                <input type="text" class="form-control" name="sprice" id="sprice">
	              </div>
	            </div>
	            
	            <div class="control-group form-group">
	              <div class="controls">
	                <label>배송방법:</label>
	                	<select name="deliveryway" id="deliveryway">
							<option value="delivery">택배</option>
							<option value="pickup">직접수령</option>
						</select>
	              </div>
	            </div>
	            
	            <div class="control-group form-group">
	              <div class="controls">
	                <label>배송료:</label>
	                <input type="text" class="form-control" name="deliverypee" id="deliverypee">
	              </div>
	            </div>
	            
	             <div class="control-group form-group">
	              <div class="controls">
	                <label>판매자:</label>
	                <input type="text" class="form-control" name="seller" id="seller">
	              </div>
	            </div>
	            
	            <div class="control-group form-group">
	              <div class="controls">
	                <label>판매자연락처:</label>
	                <input type="text" class="form-control" id="sellerphone" name="sellerphone">
	              </div>
	            </div>
	            
	           <div class="control-group form-group">
	              <div class="controls">
	                <label>상세정보:</label>
	                <textarea rows="10" cols="100" class="form-control" name="detail" id="detail" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
	              </div>
	           </div>
	            
	           <div class="control-group form-group">
	              <div class="controls">
	                <label>노출여부:</label>
	                	<select name="auction_del" id="auction_del">
							<option value="1">노출</option>
							<option value="2">비노출</option>
						</select>
	              </div>
	            </div>
	            
	            <div id="success"></div>
	            <!-- For success/fail messages -->
	            <button type="button" class="btn btn-primary" id="saveBtn">등록</button>
	          </form>
	        </div>

      </div>
      </form>
    </div>
    <!-- /.container -->
    <!-- /.Page Content -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>

  </body>

</html>
