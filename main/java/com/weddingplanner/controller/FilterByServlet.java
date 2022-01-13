package com.weddingplanner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingplanner.daoimpl.ServicesDaoimpl;
import com.weddingplanner.daoimpl.VenuesDaoimpl;

/**
 * Servlet implementation class FilterByServlet
 */
@WebServlet("/filterPrice")
public class FilterByServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterByServlet() {
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
		Double servicePackage=Double.parseDouble(request.getParameter("byPrice"));
		System.out.println(servicePackage);
		HttpSession session=request.getSession();
		ServicesDaoimpl venue=new ServicesDaoimpl();
		;
		session.setAttribute("serviceBookPackage", servicePackage);
		response.sendRedirect("FilterPrice.jsp");
	}

}
