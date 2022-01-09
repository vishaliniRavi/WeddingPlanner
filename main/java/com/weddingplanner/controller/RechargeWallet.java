package com.weddingplanner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingplanner.daoimpl.UserDaoimpl;
import com.weddingplanner.module.User;

/**
 * Servlet implementation class RechargeWallet
 */
@WebServlet("/rechargewallet")
public class RechargeWallet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		HttpSession session = request.getSession();	
		int userId=(int)session.getAttribute("id");
		String email = (String) session.getAttribute("email");
		int amount = Integer.parseInt(request.getParameter("amount"));
		Long cardnumber = Long.parseLong(request.getParameter("cardnumber"));
		int cvv = Integer.parseInt(request.getParameter("cvv"));
		UserDaoimpl userdao = new UserDaoimpl();
		int wallet = userdao.updatewallet(amount, userId);
		
	}

}
