package com.weddingplanner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingplanner.daoimpl.ServicesDaoimpl;
import com.weddingplanner.daoimpl.VenuesDaoimpl;
import com.weddingplanner.module.Services;
import com.weddingplanner.module.Venues;

/**
 * Servlet implementation class UpdateServiecServlet
 */
@WebServlet("/updateService")
public class UpdateServiecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServiecServlet() {
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
		String serviceName=request.getParameter("serviceName");
	    Double servicePackage=Double.parseDouble(request.getParameter("servicePackage"));
	    String serviceImage=request.getParameter("serviceImage");
	    String serviceType=request.getParameter("type");
		String serviceDescription=request.getParameter("description");
		String serviceTypeImage=request.getParameter("serviceTypeImage");
		Services service=new Services(serviceName,servicePackage,serviceType,serviceDescription,serviceTypeImage,null,null);
		ServicesDaoimpl serviceDao=new ServicesDaoimpl();
		serviceDao.updateService(service);
		
         

	}

}
