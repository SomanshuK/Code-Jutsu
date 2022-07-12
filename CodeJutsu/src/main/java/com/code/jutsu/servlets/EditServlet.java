package com.code.jutsu.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.code.jutsu.dao.UserDao;
import com.code.jutsu.entities.User;
import com.code.jutsu.helper.ConnectionProvider;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text.html");
		PrintWriter out = response.getWriter();
		
		//fetching data
		
		String userName = request.getParameter("user_name");
		String userPssword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");
		
		Part part = request.getPart("image");
		
		String imageName = part.getSubmittedFileName();
		
		//get user from session
		
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		user.setName(userName);
		user.setPassword(userPssword);
		user.setAbout(userAbout);
		user.setProfile(imageName);
		
		//updating in database
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		boolean ans = dao.updateUser(user);
		
		if(ans) {
			out.println("updated");
		}
		else {
			out.println("error");
		}
		
		
		
		
		
		doGet(request, response);
	}

}
