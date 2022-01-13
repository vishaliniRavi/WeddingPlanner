package com.weddingplanner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingplanner.daoimpl.VenuesDaoimpl;
import com.weddingplanner.module.Venues;

/**
 * Servlet implementation class UpdateVenueServlet
 */
@WebServlet("/update")
public class UpdateVenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVenueServlet() {
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
		
		String venueName=request.getParameter("venueName");
		String venueVendorName=request.getParameter("venueVendorName");
		Long contactNumber=Long.parseLong(request.getParameter("contactNumber"));
		Double venuePackage=Double.parseDouble(request.getParameter("venuePackage"));
		String venueImage=request.getParameter("venueImage");
        Venues venue=new Venues(venueName,null,null,null,venueVendorName,contactNumber,venuePackage,null,venueImage);
		VenuesDaoimpl venueDao=new VenuesDaoimpl();
		venueDao.updateVenue(venue);
         
	}

}
