package com.weddingplanner.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingplanner.daoimpl.UserDaoimpl;
import com.weddingplanner.module.User;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		UserDaoimpl userDetailDao=new  UserDaoimpl();
		
		User validAdmin=userDetailDao.validateAdmin(email,password);
		User validUser=userDetailDao.validateUser(email, password);
		int userId=userDetailDao.findUserId(email);
		System.out.println(userId);
		
		session.setAttribute("id", userId);
		session.setAttribute("email", email);
		

//		 RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
//		   rd.forward(request, response);
		if (validAdmin !=null)
		   {
			//user_id=validUser.getUser_id();
			RequestDispatcher rq=request.getRequestDispatcher("admin.jsp");

			 rq.forward(request, response);
//			response.sendRedirect("index.jsp");
//		out.println("welcome");
//			 
		   }
		 else if(validUser != null) 
		 {
			 //out.println("WELCOME\t" + validAdmin.getUserName() + " as Admin!" );
			 RequestDispatcher rq=request.getRequestDispatcher("index.jsp");
			 rq.forward(request, response);
         }
		 else {
			 session.setAttribute("login", "! invalid user");
		RequestDispatcher rq=request.getRequestDispatcher("login.jsp");
		 rq.forward(request, response);
		 }
		     
			 
		
	} 
	}


