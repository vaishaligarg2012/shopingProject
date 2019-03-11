package com.MVCStart.Models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="OrderTable")
public class Order {



	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int orderId;

	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="email",referencedColumnName="email")
	private User user; //one user can give multiple orders


	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="addressId",referencedColumnName="userAddressId")
	private UserAddress address;

	private double totalAmountPaid;

	public double getTotalAmountPaid() {
		return totalAmountPaid;
	}


	public void setTotalAmountPaid(double totalAmountPaid) {
		this.totalAmountPaid = totalAmountPaid;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public UserAddress getAddress() {
		return address;
	}


	public void setAddress(UserAddress address) {
		this.address = address;
	}





}