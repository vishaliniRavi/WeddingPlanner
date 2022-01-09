package com.weddingplanner.module;

import java.util.Objects;

public class BookingDetails {
	
	private int userId;
	private double total_package;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public double getTotal_package() {
		return total_package;
	}
	public void setTotal_package(double total_package) {
		this.total_package = total_package;
	}
	public BookingDetails(int userId, double total_package) {
		super();
		this.userId = userId;
		this.total_package = total_package;
	}
	public BookingDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "BookingDetails [userId=" + userId + ", total_package=" + total_package + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(total_package, userId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookingDetails other = (BookingDetails) obj;
		return Double.doubleToLongBits(total_package) == Double.doubleToLongBits(other.total_package)
				&& userId == other.userId;
	}
	
	

}
