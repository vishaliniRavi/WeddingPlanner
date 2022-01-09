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

import com.weddingplanner.daoimpl.BookingServicesDaoimpl;
import com.weddingplanner.daoimpl.BookingVenuesDaoimpl;
import com.weddingplanner.module.BookingServices;
import com.weddingplanner.module.BookingVenues;

/**
 * Servlet implementation class BookVenueServlet
 */
@WebServlet("/addToService")

public class addToService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("add service");
		HttpSession session=request.getSession();
		int userId=(int) session.getAttribute("id");
		int serviceId=(int) session.getAttribute("serviceId");
		
		String servicename = (String) session.getAttribute("serviceName");
		System.out.println(servicename);
        LocalDate eventDate=LocalDate.parse(request.getParameter("date"));

        System.out.println(eventDate);
		Double servicePackage=(Double) session.getAttribute("servicePackage");
		//LocalDate eventDat=LocalDate.parse(eventDate);
        BookingServicesDaoimpl book=new BookingServicesDaoimpl();
        boolean flag = book.checkDate(servicename, eventDate);
        boolean flag1=book.checkService(servicename, userId);
         if(flag==false) {
        	 BookingServices bookservice=new BookingServices(userId,serviceId,servicename,eventDate,servicePackage);

             book.bookService(bookservice);
        	 
         }else
        	 System.out.println("not available");
        	 //response.sendRedirect("serviceUnavailable");
		
			
       
		}
		
         


		}
