package com.weddingplanner.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.weddingplanner.dao.BookingServiceDao;
import com.weddingplanner.module.BookingServices;
import com.weddingplanner.module.BookingVenues;
import com.weddingplanner.module.Services;
import com.weddingplanner.util.ConnectionUtil;

public class BookingServicesDaoimpl implements BookingServiceDao{
	public void bookService(BookingServices bookService) {
		System.out.println("dao method");
		String insert = "insert into booking_services (user_id,service_id,service_name,event_date,service_package)values(?,?,?,?,?) ";

		ConnectionUtil conUtil = new ConnectionUtil();
		Connection con = conUtil.getDbConnection();
		PreparedStatement prstmt = null;

		try {
			prstmt = con.prepareStatement(insert);
			prstmt.setInt(1, bookService.getUserId());
			prstmt.setInt(2, bookService.getServiceId());
			prstmt.setString(3, bookService.getServiceName());
			prstmt.setDate(4, java.sql.Date.valueOf(bookService.getEventDate()));
			prstmt.setDouble(5, bookService.getServicePackage());
			prstmt.executeUpdate();
			System.out.println("Your services are Successfully booked");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Value not inserted in the table");
		}
		
}
	public int totalPackage(int userId){
		String query="select sum(service_package) from booking_services where user_id='"+userId+"'group by user_id";
		Connection con=ConnectionUtil.getDbConnection();
		Statement stmt;
		int totalPackage=0;
		try {
			stmt=con.createStatement();
			
			ResultSet rs=stmt.executeQuery(query);
			
			if(rs.next())
			{
				totalPackage=rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return totalPackage;
		
	}
	public List<BookingServices> MyBooking(int userId){
		List<BookingServices> serviceList =new ArrayList<BookingServices>();
		String viewQuery="select * from Booking_services where user_id='"+userId+"'";
		Connection con=ConnectionUtil.getDbConnection();
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(viewQuery);
			while(rs.next()) {
			BookingServices service=new BookingServices(rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getDate(6).toLocalDate(),rs.getDouble(7));
			serviceList.add(service);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
     return serviceList;
	}
	
	public boolean checkDate(String servicename,LocalDate eventdate) {
		 String findVenue="select * from booking_services where service_name='"+servicename+ "'and to_char(event_date,'yyyy-mm-dd')='"+eventdate+"'";
		 System.out.println(findVenue);
		 Connection con=ConnectionUtil.getDbConnection();
			boolean flag=true;
			
			Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs=stmt.executeQuery(findVenue);
				if(rs.next()) {
					BookingServices service=new BookingServices(rs.getInt(2),rs.getInt(3),servicename,eventdate,rs.getDouble(7));
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
	
	public boolean checkService(String servicename,int userId) {
		 String findVenue="select * from booking_services where service_name='"+servicename+ "'and user_id='"+userId+"'";
		 System.out.println(findVenue);
		 Connection con=ConnectionUtil.getDbConnection();
			boolean flag=true;
			
			Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs=stmt.executeQuery(findVenue);
				if(rs.next()) {
					BookingServices service=new BookingServices(rs.getInt(2),rs.getInt(3),servicename,rs.getDate(6).toLocalDate(),rs.getDouble(7));
                
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
	 public void removeService(String serviceName,LocalDate eventDate) {
			String updateQuery="delete from booking_services where service_Name=? and to_char(event_date,'dd-mm-yyyy')=?";
			Connection con=ConnectionUtil.getDbConnection();
			PreparedStatement prstmt=null;
			try {
				prstmt=con.prepareStatement(updateQuery);
				prstmt.setString(1, serviceName);
				prstmt.setDate(2, java.sql.Date.valueOf(eventDate));
				prstmt.executeUpdate();
				prstmt.executeUpdate("commit");
				System.out.println("profile edited successfully");
			} catch (SQLException e) {
				// TODO Auto-generated cat;
				e.printStackTrace();
			}
	 }
	 public void cancelServiceBooking(int userId,String serviceName,LocalDate eventDate) {
			String updateQuery="update booking_services set status='cancelled' where user_id=? and service_name=? and event_date=?";
			Connection con=ConnectionUtil.getDbConnection();
			PreparedStatement prstmt=null;
			try {
				prstmt=con.prepareStatement(updateQuery);
				prstmt.setInt(1, userId);
				prstmt.setString(2, serviceName);
				prstmt.setDate(3, java.sql.Date.valueOf(eventDate));
				prstmt.executeUpdate();
				prstmt.executeUpdate("commit");
				System.out.println("profile edited successfully");
			} catch (SQLException e) {
				// TODO Auto-generated cat;
				e.printStackTrace();
			}
	 }
	 public LocalDate findBookingDate(int userId) {
		 String findVenue="select booking_Date from booking_services where user_id='"+userId+"'";
		 Connection con=ConnectionUtil.getDbConnection();
			LocalDate bookDate=null;
			Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs=stmt.executeQuery(findVenue);
				if(rs.next()) {
					bookDate=rs.getDate(1).toLocalDate();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		 return bookDate;
		 
	 }
	 
	
	 public String findStatus(String serviceName,LocalDate eventDate) {
		 String findVenue="select status from booking_services where  service_name='"+serviceName+"' and to_char(event_date,'yyyy-mm-dd')='"+eventDate+"'";
		 Connection con=ConnectionUtil.getDbConnection();
			String status=null;
			Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs=stmt.executeQuery(findVenue);
				if(rs.next()) {
					status=rs.getString(1);
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		 return status;
		 
	 }
	 
	 public int validateCancelBooking(int serviceBookingId) {
		 String findVenue="select floor((event_date)- to_date(sysdate)) as no_of_days from booking_services where service_booking_id='"+serviceBookingId+"'";
		 		
		 Connection con=ConnectionUtil.getDbConnection();
			int noOfDays=0;
			Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs=stmt.executeQuery(findVenue);
				if(rs.next()) {
					noOfDays=rs.getInt(1);
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		 return serviceBookingId;
		 
	}
	 public int findBookingServiceId(int userId,LocalDate eventDate) {
		 String findVenue="select service_booking_id from booking_services where user_id='"+userId+"' and to_char(event_date,'yyyy-mm-dd')='"+eventDate+"'";
		 Connection con=ConnectionUtil.getDbConnection();
			int serviceBookingId=0;
			Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs=stmt.executeQuery(findVenue);
				if(rs.next()) {
					serviceBookingId=rs.getInt(1);
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		 return serviceBookingId;
		 
	}
	 public Boolean checkCancelServiceBooking(int userId,String serviceName,LocalDate eventdate) {
		 String findVenue="select * from booking_services where status='cancelled' and service_name='"+serviceName+"' and to_char(event_date,'yyyy-mm-dd')='"+eventdate+"'";
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
	 public List<BookingServices> allServiceBooking(){
			List<BookingServices> serviceList =new ArrayList<BookingServices>();
			String viewQuery="select * from Booking_services";
			Connection con=ConnectionUtil.getDbConnection();
			try {
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(viewQuery);
				while(rs.next()) {
				BookingServices service=new BookingServices(rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getDate(5).toLocalDate(),rs.getDate(6).toLocalDate(),rs.getDouble(7),rs.getString(8));
				serviceList.add(service);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	     return serviceList;
		}
	 
	 
	 }


  