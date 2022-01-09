package com.weddingplanner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingplanner.daoimpl.BookingDetailsDaoimpl;
import com.weddingplanner.daoimpl.UserDaoimpl;
import com.weddingplanner.module.BookingDetails;
import com.weddingplanner.module.BookingServices;

/**
 * Servlet implementation class MyBookServlet
 */
@WebServlet("/serviceBooking")
public class MyBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBookServlet() {
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
		doGet(request, response);
		HttpSession session = request.getSession();
        UserDaoimpl userdao=new UserDaoimpl();
		List<BookingServices> myBooking=(List<BookingServices>)session.getAttribute("booking");
		double total_price=0;
		
		for(BookingServices book:myBooking) {
			total_price+=book.getServicePackage();
			}
		BookingDetailsDaoimpl book = new BookingDetailsDaoimpl();
		int userId=(int) session.getAttribute("id");
		double totalPackage=total_price;
		session.setAttribute("totalPackage", totalPackage);
		int walletBalance=0;
		walletBalance=userdao.walletbal(userId);
		int payWallet=(int) (walletBalance-totalPackage);
		if(totalPackage<=walletBalance) {
			int balance=0;
			balance=userdao.updatewallet(payWallet, userId);
			if(balance>0) {
				BookingDetails bookDetail=new BookingDetails(userId,totalPackage);
				book.insertBooking(bookDetail);
				 response.sendRedirect("servicebook.jsp");
				 session.setAttribute("servicebooked", "Your services are successfully booked");
			}
			else
				
			{
				System.out.println("low balance");
			System.out.println(total_price);
			
			}
			
			
		}else {
	      	 session.setAttribute("booked", "This service is already booked on this date");
	      	 response.sendRedirect("service1.jsp");
	
	}
	
		
	}
}


