<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</head>
<jsp:include page="/WEB-INF/views/nav.jsp"></jsp:include>
<title>My Page</title>

<style>
	#BtnDiv {
		margin:auto;
		margin-bottom: 10px;
	}
</style>

<div class="container" style="margin-top:2%;max-width:500px;">
	<form action="" method="post">
	    <div class="card">
	        <div class="header pt-3 blue darken-1">
	            <div class="row d-flex justify-content-start">
	                <h3 class="deep-grey-text mt-3 mb-4 pb-1 mx-5" style="color:white;">Modify</h3>
	            </div>
	
	        </div>
	        <div class="card-body mx-4 mt-4">
	            <div class="md-form">
	                <input type="email" name="id" id="Form-email4" class="form-control"/>
	                <label for="Form-email4">Your email</label>
			
	            </div>
	
	            <div class="md-form">
		            <input type="password" name="passwd" id="Form-pass4"  class="form-control" />
			        <label for="Form-pass4">Your password</label>
	            </div>
	            
	            <div class="md-form">
	            <input type="password" name="password" class="form-control" />
	            <label for="Form-pass4">Confirm password</label>
				<i class="passErr"></i>
				</div>
				
				<div class="md-form">
				<input type="text" name="name" class="form-control"/>
				<label for="Form-text4">Your Name </label>
				</div>
				
				<div class="md-form">
				<input type="text" name="phone" id="phone" class="form-control" /> 
				<label for="Form-text4">Your Phone</label>
				</div>
				
				</div>
	            <div class="row" id="BtnDiv">
	                <div class="col"><button type="button" class="btn btn-primary btn-block z-depth-2" id="modifyBtn">MODIFY</button></div>
					<div class="col"><input type="button" value="Back" id="modifyCancelBtn" class="btn btn-primary btn-block z-depth-2"/></div>
	            </div>
	        </div>
	        </form> 
	    </div>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>