<%@page import="com.code.jutsu.dao.LikeDao"%>
<%@page import="com.code.jutsu.dao.UserDao"%>
<%@page import="com.code.jutsu.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.code.jutsu.helper.ConnectionProvider"%>
<%@page import="com.code.jutsu.dao.PostDao"%>
<%@page import="com.code.jutsu.entities.Post"%>
<%@page import="com.code.jutsu.entities.User"%>
<%@page errorPage="error.jsp" %>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");

}
%>
<%

	int postID = Integer.parseInt(request.getParameter("post_id"));
	PostDao d = new PostDao(ConnectionProvider.getConnection());
	
	Post p = d.getPostByPostId(postID);
	
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= p.getpTitle() %></title>
<!--  css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.post-title{
			font-weight:100; 
			font-szie: 30px; 
		}
		.post-content{
			font-weight: 100;
			font-size: 25px;
		}
		.post-date{
			font-style:italic;
			font-weight: bold;
		}
		.post-user-info{
			font-size: 20px;
			
		}
		.row-user{
			border: 1px solid #e2e2e2;
			padding-top:15px; 
		}
	
	</style>
</head>
<body>
<!-- <script src="js/js.js" type="text/javascript"></script> -->
	
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp">Code Jutsu</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fa fa-home"></span>Home <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="	fa fa-code"></span>Languages
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Java</a> <a
							class="dropdown-item" href="#">Python</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">C++</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link " href="#"><span
						class="fa fa-phone"></span>Contact</a></li>
				<li class="nav-item active"><a class="nav-link " href="#"
					data-toggle="modal" data-target="#post-modal"><span
						class="	fa fa-plus-square"></span>Post</a></li>



			</ul>

			<ul class="navbar-nav mr-right">
				<li class="nav-item active"><a class="nav-link " href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle"></span><%=user.getName()%></a></li>
				<li class="nav-item active"><a class="nav-link "
					href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
				</li>



			</ul>

		</div>
	</nav>


	<!-- navbar end -->
	

	<!-- main body -->
		<div class="container">
			<div class="row my-4">
				
				<div class="col-md-8 offset-md-2">
					
					<div class="card">
					
						<div class="card-header primary-background text-white">
							
							<h4 class="post-title"><%= p.getpTitle() %></h4>
						
						</div>
						
						<div class="card-body">
						
							<img class="card-img-top my-2" src="blog_pic/<%=p.getpPic() %>" alt="Card image cap">
							
							<div class="row my-3 row-user">
								<div class="col-md-8">
									<% UserDao dao = new UserDao(ConnectionProvider.getConnection()); %>
									<p class="post-user-info"> <a href="#!"><%= dao.getUserByUserId(p.getUserId()).getName() %></a> has posted</p>
								
								</div>
								
								
								<div class="col-md-4">
								
									<p class="post-date"><%= p.getpDate().toLocaleString() %></p>
								
								</div>
							
							
							</div>
							
							<p class="post-content"><%= p.getpContent() %></p>
							<br>
							<br>
						
							<div class="post-code">
								<pre><%= p.getpCode() %></pre>
							</div>
						
						</div>
						
						<div class="card-footer">
						
							<%
								LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
							%>
							<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm primary-background"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLikeOnPost(p.getPid()) %></span></i></a>
							<a href="#!" class="btn btn-outline-light btn-sm primary-background"><i class="fa fa-commenting-o"><span>10</span></i></a>
						
						</div>
						
					</div>
				
				</div>
			
			</div>
		
		</div>
	<!-- end main body -->
	
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">Code Jutsu</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">

						<img src="pic/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px;">
						<h5 class="mt-3"><%=user.getName()%></h5>

						<!-- details -->

						<div id="profile-details">

							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Status</th>
										<td><%=user.getAbout()%></td>

									</tr>

									<tr>
										<th scope="row">Registered onDate</th>
										<td><%=user.getReg_date().toString()%></td>

									</tr>

								</tbody>
							</table>

						</div>

						<!-- profile editing -->
						<div id="profile-edit" style="display: none;">
							<h4 class="mt-2">Edit your details</h4>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Name</th>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Password</th>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>

									</tr>
									<tr>
										<th scope="row">Status</th>
										<td><textarea rows="3" class="form-control"
												name="user_about"><%=user.getAbout()%></textarea></td>

									</tr>
									<tr>
										<th scope="row">Profile Picture</th>
										<td><input type="file" name="image" class="form-control">

										</td>

									</tr>

								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>

								</div>

							</form>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- post modal -->


	<!-- Modal -->
	<div class="modal fade" id="post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Post Details...</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="post-form" action="PostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Language---</option>
								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> lst = postd.getCategories();
								for (Category c : lst) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>

							</select>

						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post title"
								class="form-control" />
						</div>

						<div class="form-group">
							<textarea name="pContent" class="form-control"
								placeholder="Enter your content" style="height: 100px;"></textarea>


						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control"
								placeholder="Enter your code (if any)" style="height: 100px;"></textarea>
						</div>

						<div class="form-froup">
							<label>Add picture</label> <br> <input name="pic"
								type="file">

						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>



					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- end post modal -->

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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/js.js" type="text/javascript"></script>

	<script>
		$(document).ready(function() {

			let edit_status = false;

			$('#edit-profile-button').click(function() {

				if (edit_status == false) {
					$("#profile-details").hide()

					$("#profile-edit").show();

					edit_status = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show()

					$("#profile-edit").hide();

					edit_status = false;
					$(this).text("Edit")
				}
			})
		});
	</script>

	<!-- post js -->
	<script>
		$(document).ready(function(e) {
			$("#post-form").on("submit",function(event) {
				event.preventDefault();
				console.log("you have clicked on submit...")
				let form = new FormData(this);
				
				//requesting server
				
				$.ajax({url : "PostServlet",
						type : 'POST',
						data : form,
						
						success : function(data,textStatus,jqXHR) {
							console.log(data);
							if (data.trim() == 'done') {
								swal("Done!","Post saved successfully","success")
								 .then((value) => {
									  window.location = "profile.jsp";
									});
								
							} 
							else {
								swal("Error!","Something went wrong","error");
							}
						},
						error : function(jqXHR,textStatus,errorThrown) {
							swal("Error!","Something went wrong","error");
						},
						processData : false,
						contentType : false
				})
			})
		})
	</script>

</body>
</html>