package com.weddingplanner.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.weddingplanner.module.Ratings;
import com.weddingplanner.module.Services;
import com.weddingplanner.module.User;
import com.weddingplanner.module.Venues;
import com.weddingplanner.util.ConnectionUtil;

public class RatingsDaoimpl {
	public void insertRating(Ratings rating) {
		String insertQuery="insert into rating_details(user_id,service_name,rating)values(?,?,?)";
	     ConnectionUtil conUtil=new ConnectionUtil();
	     Connection con=conUtil.getDbConnection();
	     try {
			PreparedStatement prstmt=con.prepareStatement(insertQuery);
			prstmt.setInt(1, rating.getUserId());
			prstmt.setString(2, rating.getServiceName());
			prstmt.setInt(3, rating.getRating());
			prstmt.executeUpdate();
			System.out.println("thank you !!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public double fetchRating(String serviceName) {
		ConnectionUtil conUtil=new ConnectionUtil();
	     Connection con=conUtil.getDbConnection();
		String query ="select trunc(avg(rating),2) from rating_details where service_name =?";
		try {
			PreparedStatement pst =con.prepareStatement(query);
			pst.setString(1,serviceName);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getDouble(1));
				return rs.getDouble(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
}
