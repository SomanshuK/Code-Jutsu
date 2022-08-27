<%@page import="com.code.jutsu.entities.Post"%>
<%@page import="com.code.jutsu.dao.PostDao"%>
<%@page import="com.code.jutsu.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Code Jutsu</title>

<!--  css-->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
	<!-- <style>
		.banner-background{
			-webkit-clip-path: circle(60.0% at 50% 10%);
			clip-path: circle(50.0% at 50% 50%);
	
		}
	</style>  -->


</head>
<body>
	<!-- navbar -->
	<%@include file="navbar.jsp"%>

	<!-- banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron text-white banner-background" style="background-color: #E53935">
			<div class="container">
				<h3 class="display-3">Welcome to Code Jutsu</h3>
				<p>Learn. Build. Help.</p>


				<a href="register_page.jsp" class="btn btn-outline-light btn-lg">Get Started</a>
				 <a href="login_page.jsp" class="btn btn-outline-light btn-lg">Login</a>

			</div>

		</div>

	</div>


	<!-- cards -->

	<div class="container">

		<div class="row mb-4">

			<div class="col-md-4">
				<div class="card">
				
					<%
						PostDao dao = new PostDao(ConnectionProvider.getConnection());
						Post p = dao.getRandomPost();
						
					
					%>
					<div class="card-body">
						<h5 class="card-title"><%=p.getpTitle() %></h5>
						<p class="card-text"><%=p.getpContent() %></p>
						<a href="ShowBlog.jsp?post_id=<%= p.getPid() %>" class="btn btn-primary primary-background">Read More</a>
					</div>
				</div>

			</div>
			
			<div class="col-md-4">
				<div class="card">
				
					<%
						/* PostDao dao2 = new PostDao(ConnectionProvider.getConnection()); */
						Post p2 = dao.getRandomPost();
						
					
					%>
					<div class="card-body">
						<h5 class="card-title"><%=p2.getpTitle() %></h5>
						<p class="card-text"><%=p2.getpContent() %></p>
						<a href="ShowBlog.jsp?post_id=<%= p2.getPid() %>" class="btn btn-primary primary-background">Read More</a>
					</div>
				</div>


			</div>
			
			<div class="col-md-4">
				<div class="card">
				
					<%
						/* PostDao dao = new PostDao(ConnectionProvider.getConnection()); */
						Post p3 = dao.getRandomPost();
						
					
					%>
					<div class="card-body">
						<h5 class="card-title"><%=p3.getpTitle() %></h5>
						<p class="card-text"><%=p3.getpContent() %></p>
						<a href="ShowBlog.jsp?post_id=<%= p3.getPid() %>" class="btn btn-primary primary-background">Read More</a>
					</div>
				</div>


			</div>

		</div>
		
		<!-- next row -->
		
		<div class="row mb-2">

			<div class="col-md-4">
				<div class="card">
				
					<%
						/* PostDao dao = new PostDao(ConnectionProvider.getConnection()); */
						Post p4 = dao.getRandomPost();
						
					
					%>
					<div class="card-body">
						<h5 class="card-title"><%=p4.getpTitle() %></h5>
						<p class="card-text"><%=p4.getpContent() %></p>
						<a href="ShowBlog.jsp?post_id=<%= p4.getPid() %>" class="btn btn-primary primary-background">Read More</a>
					</div>
				</div>


			</div>
			
			<div class="col-md-4">
				<div class="card">
				
					<%
						/* PostDao dao = new PostDao(ConnectionProvider.getConnection()); */
						Post p5 = dao.getRandomPost();
						
					
					%>
					<div class="card-body">
						<h5 class="card-title"><%=p5.getpTitle() %></h5>
						<p class="card-text"><%=p5.getpContent() %></p>
						<a href="ShowBlog.jsp?post_id=<%= p5.getPid() %>" class="btn btn-primary primary-background">Read More</a>
					</div>
				</div>

			</div>
			
			<div class="col-md-4">
				<div class="card">
				
					<%
						/* PostDao dao = new PostDao(ConnectionProvider.getConnection()); */
						Post p6 = dao.getRandomPost();
						
					
					%>
					<div class="card-body">
						<h5 class="card-title"><%=p6.getpTitle() %></h5>
						<p class="card-text"><%=p6.getpContent() %></p>
						<a href="ShowBlog.jsp?post_id=<%= p6.getPid() %>" class="btn btn-primary primary-background">Read More</a>
					</div>
				</div>


			</div>

		</div>


	</div>













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
</body>
</html>