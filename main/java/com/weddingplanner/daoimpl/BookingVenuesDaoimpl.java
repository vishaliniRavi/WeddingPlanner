package com.weddingplanner.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Date;

import com.weddingplanner.dao.BookingVenueDao;
import com.weddingplanner.module.BookingVenues;
import com.weddingplanner.module.Venues;
import com.weddingplanner.util.ConnectionUtil;

public class BookingVenuesDaoimpl implements BookingVenueDao{
	
	public boolean bookVenue(BookingVenues bookVenues) {
//		String bookQuery="insert into booking_venues (user_id,venue_id,venue_name,no_of_guest,function_time,event_date,venue_package) values(?,?,?,?,?,?,?)";
//		ConnectionUtil conUtil=new ConnectionUtil();
//	   	Connection con=conUtil.getDbConnection();
//	   	PreparedStatement prstmt=null;
//	   	UserDao.findUserId(bookQuery);
//	    try {
//			prstmt=con.prepareStatement(bookQuery);
//			String emailId;
//			prstmt.setInt(1, bookVenues.getUserId());
//			prstmt.setInt(2, bookVenues.getVenueId());
//			prstmt.setString(3, bookVenues.getVenueName());
//			prstmt.setInt(4, bookVenues.getNoOfGuest());
//			prstmt.setString(5, bookVenues.getFunctionTiming());
//			prstmt.setString(6,bookVenues.getEventDate());
//			prstmt.setDouble(7,bookVenues.getVenuePackage());
//			prstmt.executeUpdate();
//			System.out.println("Registered successfully");
//		} catch (SQLException e) {
//			e.printStackTrace();
//			System.out.println("values not inserted");
//			
//		}
		
//   	 
	String insert = "INSERT INTO Booking_venues (user_id,venue_id,venue_name,no_of_guest,event_date,venue_package) VALUES(?,?,?,?,?,?) ";

	ConnectionUtil conUtil = new ConnectionUtil();
	Connection con = conUtil.getDbConnection();
	PreparedStatement prstmt = null;
	boolean flag=false;
	try {
		prstmt = con.prepareStatement(insert);
		prstmt.setInt(1, bookVenues.getUser_id());
		prstmt.setInt(2, bookVenues.getVenue_id());
		prstmt.setString(3, bookVenues.getVenueName());
		prstmt.setInt(4, bookVenues.getNoOfGuest());
		
		prstmt.setDate(5,  java.sql.Date.valueOf(bookVenues.getEventDate()));
		prstmt.setDouble(6,bookVenues.getVenuePackage());
		if(prstmt.executeUpdate()>0);
		{
		    flag=true;
		}
		System.out.println("Your venue Successfully booked");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Value not inserted in the table");
	}
	return flag;
	   	
	}  
	public boolean checkDate(String venuename,LocalDate eventdate) {
		 String findVenue="select * from booking_venues where venue_name='"+venuename+"' and to_char(event_date,'yyyy-mm-dd')='"+eventdate+"'";
		 System.out.println(findVenue);
		 Connection con=ConnectionUtil.getDbConnection();
			boolean flag=true;
			Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs=stmt.executeQuery(findVenue);
				if(rs.next()) {
					System.out.println("hlo"+rs.getString(4));
					BookingVenues venue=new BookingVenues(rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getDate(7).toLocalDate(),rs.getDouble(8));
					
				}
				else {
					flag=false;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return flag;
		
	}
	
	 public void cancelBooking(int userId,String venueName) {
			String updateQuery="update booking_venues set status='cancelled' where user_id=? and venue_name=?";
			Connection con=ConnectionUtil.getDbConnection();
			PreparedStatement prstmt=null;
			try {
				prstmt=con.prepareStatement(updateQuery);
				prstmt.setInt(1, userId);
				prstmt.setString(2, venueName);
				prstmt.executeUpdate();
				prstmt.executeUpdate("commit");
				System.out.println("profile edited successfully");
			} catch (SQLException e) {
				// TODO Auto-generated cat;
				e.printStackTrace();
			}
	 }
   	
}  	
	   	
	   	


			
	   	
	
	
	
	
	
	
	


