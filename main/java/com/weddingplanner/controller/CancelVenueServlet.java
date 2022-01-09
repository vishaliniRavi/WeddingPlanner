package com.weddingplanner.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingplanner.daoimpl.BookingVenuesDaoimpl;
import com.weddingplanner.daoimpl.UserDaoimpl;
import com.weddingplanner.module.BookingVenues;

/**
 * Servlet implementation class CancelVenueServlet
 */
@WebServlet("/cancelVenue")
public class CancelVenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelVenueServlet() {
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
		HttpSession session=request.getSession();
       int userId=(int) session.getAttribute("id");
       String venueName=(String)session.getAttribute("venueName");
       System.out.println(venueName);
		Double venuePackage=(Double) session.getAttribute("venuepackage");
		System.out.println(venuePackage);
        BookingVenuesDaoimpl bookVenue=new BookingVenuesDaoimpl();
        LocalDate eventDate=(LocalDate)session.getAttribute("eventdate");
       UserDaoimpl userdao=new UserDaoimpl();
       int walletBalance=0;
		walletBalance=userdao.walletbal(userId);
		int payWallet=(int) (walletBalance+venuePackage);
		if(venuePackage<=walletBalance) {
			int balance=0;
			balance=userdao.updatewalletBalance(payWallet, userId);
			if(balance>0) {
				bookVenue.cancelBooking(userId,venueName);
		         session.setAttribute("booked", "venue sucessfully booked");
		         response.sendRedirect("cancelBookingMsg.jsp");
		         
			}else
	 			System.out.println("low balance");
		}else {
			
		}


	}

}
