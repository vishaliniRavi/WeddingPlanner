package com.weddingplanner.module;

import java.time.LocalDate;
import java.util.Objects;

public class BookingServices {
	
	  private int userId;
	  private int serviceId;
	  private String serviceName;
	  private LocalDate bookingDate;
	  private LocalDate eventDate;
	  private double servicePackage;
	  private String serviceStatus;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	
	public LocalDate getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(LocalDate bookingDate) {
		this.bookingDate = bookingDate;
	}
	public LocalDate getEventDate() {
		return eventDate;
	}
	public void setEventDate(LocalDate eventDate) {
		this.eventDate = eventDate;
	}
	public double getServicePackage() {
		return servicePackage;
	}
	public void setServicePackage(double servicePackage) {
		this.servicePackage = servicePackage;
	}
	
	
	public String getServiceStatus() {
		return serviceStatus;
	}
	public void setServiceStatus(String serviceStatus) {
		this.serviceStatus = serviceStatus;
	}
	
	
	
	public BookingServices(int userId, int serviceId, String serviceName, LocalDate bookingDate, LocalDate eventDate,
			double servicePackage, String serviceStatus) {
		super();
		this.userId = userId;
		this.serviceId = serviceId;
		this.serviceName = serviceName;
		this.bookingDate = bookingDate;
		this.eventDate = eventDate;
		this.servicePackage = servicePackage;
		this.serviceStatus = serviceStatus;
	}
	public BookingServices(int userId, int serviceId, String serviceName, LocalDate eventDate, double servicePackage) {
		super();
		this.userId = userId;
		this.serviceId = serviceId;
		this.serviceName = serviceName;
		this.eventDate = eventDate;
		this.servicePackage = servicePackage;
	}
	public BookingServices() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "BookingServices [userId=" + userId + ", serviceId=" + serviceId + ", serviceName=" + serviceName
				+ ", eventDate=" + eventDate + ", servicePackage=" + servicePackage + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(eventDate, serviceId, serviceName, servicePackage, userId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookingServices other = (BookingServices) obj;
		return Objects.equals(eventDate, other.eventDate) && serviceId == other.serviceId
				&& Objects.equals(serviceName, other.serviceName)
				&& Double.doubleToLongBits(servicePackage) == Double.doubleToLongBits(other.servicePackage)
				&& userId == other.userId;
	}
	
	  

}
