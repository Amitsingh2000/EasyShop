package com.easyshop.app.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity 
public class User 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userPhone;
	private String userPic;
	private String userAddress;
	private String userRole;
	
	@OneToMany(mappedBy = "user")
	private List<Order> userOrders;
	
	
	

	public User() 
	{
		
	}
	
	



	public User(String userName, String userPassword, String userRole) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.userRole = userRole;
	}





	public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPic,
			String userAddress, String userRole) 
	{	
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userRole = userRole;
	}



	public List<Order> getUserOrders() {
		return userOrders;
	}

	public void setUserOrders(List<Order> userOrders) {
		this.userOrders = userOrders;
	}



	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

}
