<%@page import="com.code.jutsu.entities.User"%>
<%@page import="com.code.jutsu.dao.LikeDao"%>
<%@page import="java.util.*"%>
<%@page import="com.code.jutsu.helper.ConnectionProvider"%>
<%@page import="com.code.jutsu.dao.PostDao"%>
<%@page import="com.code.jutsu.entities.Post" %>

<div class="row">
<% 
	User user = (User)session.getAttribute("currentUser");
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	
	List<Post> posts = null;
	if(cid==0){
		posts = dao.getPosts();
		
	}
	else{
		posts = dao.getPostsByCid(cid);
	}
	
	if(posts.size()==0){
		out.println("<h3 class='display-3 text-center'>No post regarding this language</h3>");
		return;
	}
	
	for(Post p: posts){
%>
	<div class="col-md-5 mt-2">
		<div class="card">
		<img class="card-img-top" src="blog_pic/<%=p.getpPic() %>" alt="Card image cap">
			<div class="card-body">
				<b><%= p.getpTitle() %></b>
				<p><%= p.getpContent() %></p>
				
							
			</div>
			<div class="card-footer text-center">
				<a href="ShowBlog.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-danger btn-sm">Read More</a>
				<%
					LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
				%>
				<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm primary-background"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLikeOnPost(p.getPid()) %></span></i></a>
				<a href="#!" class="btn btn-outline-light btn-sm primary-background"><i class="fa fa-commenting-o"><span>10</span></i></a>
				
			</div>
			
		</div>
	</div>

<%
	}

%>

</div>