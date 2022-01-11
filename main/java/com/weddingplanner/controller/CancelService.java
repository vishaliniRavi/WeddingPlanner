package com.weddingplanner.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingplanner.daoimpl.BookingDetailsDaoimpl;
import com.weddingplanner.daoimpl.BookingServicesDaoimpl;
import com.weddingplanner.daoimpl.UserDaoimpl;

/**
 * Servlet implementation class CancelService
 */
@WebServlet("/cancelService")
public class CancelService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelService() {
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
		BookingServicesDaoimpl book = new BookingServicesDaoimpl();
		HttpSession session = request.getSession();
        UserDaoimpl userdao=new UserDaoimpl();
		int userId=(int) session.getAttribute("id");
		String servicename = (String) session.getAttribute("serviceBookingName");
		System.out.println(servicename);
        LocalDate eventDate=(LocalDate)session.getAttribute("serviceEventDate");
        System.out.println(eventDate);
		Double servicePackage=(Double) session.getAttribute("servicePackageName");
	       int bookingServiceid=(int) session.getAttribute("serviceBooking");
	       System.out.println(bookingServiceid);

	    int days=book.validateCancelBooking(bookingServiceid);

		if(days>0) {
		int walletBalance=0;
		walletBalance=userdao.walletbal(userId);
		session.setAttribute("cancelWallet",walletBalance);
		int payWallet=(int) (walletBalance+(servicePackage-(servicePackage*0.2)));
		session.setAttribute("RefundBalance",payWallet);

			int balance=userdao.updatewalletBalance(payWallet, userId);
			
				book.cancelServiceBooking(userId, servicename, eventDate);
				 response.sendRedirect("ServiceCancel.jsp");
				 session.setAttribute("serviceCancelled", "Your services are successfully cancelled");
			}
			
			
			
		 else
	       {
	    	   session.setAttribute("notCancelled","Nope!You can't cancel the order" );
	    	   response.sendRedirect("CancelVenueDate.jsp");
	       }
	}
	
		

		}
	
	