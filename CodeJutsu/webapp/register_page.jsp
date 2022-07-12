<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

<!--  css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<!-- navbar -->

	<%@include file="navbar.jsp"%>
	
	<style>
    .card {
      box-shadow: 0 0 60px 0 rgba(100, 100, 100, 0.50);
    }
    
	</style>


	<main class="d-flex align-items-center"
		style="height: 85vh;">
		<div class="container">

			<div class="col-md-6 offset-md-3">
				<div class="card">

					<div class="card-header primary-background text-white text-center">
						<h5>
							<span class="fa fa-user-plus "></span>Register Here
						</h5>

					</div>

					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="POST">
							<div class="form-group">
								<label for="user_name">User Name</label> <input type="text"
									name="user_name" class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="Enter name">

							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="user_email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>



							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="user_password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<div class="form-group">
								<textarea class="form-control" name="about" rows="3"
									placeholder="Enter something about yourself"></textarea>

							</div>


							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree terms and conditions</label>
							</div>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-2x fa-spin"></span>
								<h4>Please Wait...</h4>
							</div>
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>


				</div>

			</div>
		</div>

	</main>









	<!-- JAVASCRIPT -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/js.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
		$(document).ready(function(){
			console.log("loaded...");
			
			$('#reg-form').on('submit',function(event){
				event.preventDefault();
				
				let form = new FormData(this);
				
				$("#submit-btn").hide();
				$("#loader").show();
				
				
				$.ajax({
					url: "RegisterServlet",
					type: 'POST',
					data: form,
					
					success: function (data, textStatus, jqXHR){
						console.log(data)
						
						
						$("#submit-btn").show();
						$("#loader").hide();
						if(data.trim()==='done'){
						swal("Successfully Registered. Redirecting to login page...")
						.then((value) => {
						  window.location = "login_page.jsp";
						});
						}
						else{
							swal(data);
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
						
						$("#submit-btn").show();
						$("#loader").hide();
						swal("Something went wrong. Please try again...")
						
					},
					processData: false,
					contentType: false
				});
			});
		});
	</script>

</body>
</html>