package com.weddingplanner.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingplanner.daoimpl.BookingServicesDaoimpl;
import com.weddingplanner.daoimpl.ServicesDaoimpl;
import com.weddingplanner.module.Services;

/**
 * Servlet implementation class RemoveServiceServlet
 */
@WebServlet("/RemoveService")
public class RemoveServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveServiceServlet() {
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
       
		BookingServicesDaoimpl bookService=new BookingServicesDaoimpl();
		String serviceName=(String)session.getAttribute("serviceName");
		System.out.println(serviceName);

		double servicePackage=(double)session.getAttribute("servicePackage");
        LocalDate eventDate=(LocalDate)(session.getAttribute("eventDate"));
        System.out.println(eventDate);
        bookService.removeService(serviceName, eventDate);
        
		
	}

}
