package com.code.jutsu.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.jutsu.dao.UserDao;
import com.code.jutsu.entities.User;
import com.code.jutsu.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */


@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String check=request.getParameter("check");
		
		if (check == null) {
			out.println("please agree terms and conditions");
			
		}
		else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String about = request.getParameter("about");
			
			
			User user = new User(name,email,password,about);
			
			//creating object of userdao
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)) {
				out.println("done");
			}
			else {
				out.println("error");
			}
		}
		
		
		doGet(request, response);
	}

}
