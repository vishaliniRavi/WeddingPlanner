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
       String venueName=(String)session.getAttribute("venueBookingName");
       System.out.println(venueName);
	   Double venuePackage=(Double) session.getAttribute("venueBookingPackage");
	   System.out.println(venuePackage);
       BookingVenuesDaoimpl bookVenue=new BookingVenuesDaoimpl();
       LocalDate eventDate=(LocalDate)session.getAttribute("venueBookingEventDate");
       int bookingVenueid=(int) session.getAttribute("venueBooking");
       int days=bookVenue.validateCancelBooking(bookingVenueid);
       UserDaoimpl userdao=new UserDaoimpl();
       if(days>0) {
    	   
       int walletBalance=0;
		walletBalance=userdao.walletbal(userId);
		session.setAttribute("cancelVenue",walletBalance);

		int payWallet=(int) (walletBalance+(venuePackage-(venuePackage*0.2)));
		session.setAttribute("cancelRefundVenue",payWallet);

		
		
			int balance=userdao.updatewalletBalance(payWallet, userId);
			
				bookVenue.cancelBooking(userId,venueName,eventDate);
		         session.setAttribute("cancelled", "venue sucessfully cancelled");
		         response.sendRedirect("cancelBookingMsg.jsp");
		         
			}
		
       else
       {
    	   session.setAttribute("notCancelled","Nope!You can't cancel the order" );
    	   response.sendRedirect("CancelVenueDate.jsp");
       }

	


	}
		         
		
	}


