package com.weddingplanner.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import com.weddingplanner.module.BookingDetails;
import com.weddingplanner.module.Services;
import com.weddingplanner.util.ConnectionUtil;

public class BookingDetailsDaoimpl {
	
	public void insertBooking(BookingDetails bookingdetails) {
		String walletQuery="select wallet from user_details where user_id='"+bookingdetails.getUserId()+"')";
		String insertQuery="insert into booking_details(user_id,total_package)values(?,?)";
	     ConnectionUtil conUtil=new ConnectionUtil();
	     Connection con=conUtil.getDbConnection();
	     try {
			PreparedStatement prstmt=con.prepareStatement(insertQuery);
			prstmt.setInt(1,bookingdetails.getUserId() );
			prstmt.setDouble(2, bookingdetails.getTotal_package());
			prstmt.executeUpdate();
			System.out.println("service added successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 public void cancelServiceBooking(int userId) {
			String updateQuery="update booking_services set status='cancelled' where user_id=? ";
			Connection con=ConnectionUtil.getDbConnection();
			PreparedStatement prstmt=null;
			try {
				prstmt=con.prepareStatement(updateQuery);
				prstmt.setInt(1, userId);
			    prstmt.executeUpdate();
				prstmt.executeUpdate("commit");
				System.out.println("profile edited successfully");
			} catch (SQLException e) {
				// TODO Auto-generated cat;
				e.printStackTrace();
			}
	 }

}
