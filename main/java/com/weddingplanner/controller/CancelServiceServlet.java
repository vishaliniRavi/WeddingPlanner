package com.weddingplanner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingplanner.daoimpl.BookingDetailsDaoimpl;
import com.weddingplanner.daoimpl.UserDaoimpl;
import com.weddingplanner.module.BookingDetails;

/**
 * Servlet implementation class CancelServiceServlet
 */
@WebServlet("/serviceBooking")
public class CancelServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelServiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		BookingDetailsDaoimpl book = new BookingDetailsDaoimpl();
		HttpSession session = request.getSession();
        UserDaoimpl userdao=new UserDaoimpl();
		int userId=(int) session.getAttribute("id");
		double totalPackage=(double)session.getAttribute("totalPackage");
		int walletBalance=0;
		walletBalance=userdao.walletbal(userId);
		int payWallet=(int) (walletBalance-totalPackage);
		if(totalPackage<=walletBalance) {
			int balance=0;
			balance=userdao.updatewallet(payWallet, userId);
			if(balance>0) {
				BookingDetails bookDetail=new BookingDetails(userId,totalPackage);
				book.cancelServiceBooking(userId);
				 response.sendRedirect("servicebook.jsp");
				 session.setAttribute("servicebooked", "Your services are successfully booked");
			}
			else
				
			{
				System.out.println("low balance");

			
			}
			
			
		}else {
	      	 session.setAttribute("booked", "This service is already booked on this date");
	      	 response.sendRedirect("service1.jsp");
	
	}
	
		

		}
	

}
