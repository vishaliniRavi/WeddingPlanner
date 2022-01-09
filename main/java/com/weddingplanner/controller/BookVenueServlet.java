package com.weddingplanner.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingplanner.daoimpl.BookingVenuesDaoimpl;
import com.weddingplanner.daoimpl.UserDaoimpl;
import com.weddingplanner.module.BookingDetails;
import com.weddingplanner.module.BookingVenues;
import com.weddingplanner.module.Services;

import oracle.net.ano.Service;

/**
 * Servlet implementation class BookVenueServlet
 */
@WebServlet("/book")

public class BookVenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookVenueServlet() {
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
		HttpSession session=request.getSession();
		SimpleDateFormat sdf=new SimpleDateFormat();
		int userId=(int) session.getAttribute("id");
		int venueId=(int) session.getAttribute("venueId");
		String venuename = request.getParameter("venuename");
		
		int noOfGuest =Integer.parseInt( request.getParameter("noOfGuest"));
		//String functionTiming = request.getParameter("functionTiming");
		Double venuePackage=(Double) session.getAttribute("venuepackage");
        LocalDate eventDate=LocalDate.parse(request.getParameter("eventDate"));
        session.setAttribute("eventdate", eventDate);
            Services service=new Services();
	         BookingVenuesDaoimpl bookVenue=new BookingVenuesDaoimpl();

	         boolean flag = bookVenue.checkDate(venuename, eventDate);
	         
	        if(flag==false)
	        {
	        	 
		         UserDaoimpl userdao=new UserDaoimpl();

		 		int walletBalance=0;
		 		walletBalance=userdao.walletbal(userId);
		 		int payWallet=(int) (walletBalance-venuePackage);
		 		if(venuePackage<=walletBalance) {
		 			int balance=0;
		 			balance=userdao.updatewalletBalance(payWallet, userId);
		 			if(balance>0) {
		 				BookingVenues book=new BookingVenues(userId,venueId,venuename,noOfGuest,eventDate,venuePackage);
				         bookVenue.bookVenue(book);
				         session.setAttribute("booked", "venue sucessfully booked");
				         response.sendRedirect("bookvenue2.jsp");
				         
		 			}else
			 			System.out.println("low balance");
		 		}else {
		 			
		 		}
		 		
		 		
		 	
		 	}
		        
	}

	         }
	         

		
         	


