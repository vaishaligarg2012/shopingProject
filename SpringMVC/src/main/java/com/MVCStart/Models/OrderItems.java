//package com.MVCStart.Models;
//
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.OneToMany;
//import javax.persistence.Table;
//
//@Entity
//@Table(name="OrderItem")
//public class OrderItems {
//	
//    @Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
//	private int orderItemId;
//    
//    @OneToMany(fetch=FetchType.EAGER)
//    @JoinColumn(name="productId")
//    private Product productId;      
//    
//    private int quantity;
//    private double itemPrice;
//    
//    @ManyToOne
//    @JoinColumn(name="orderId")
//    private Order orderObj;
//
//	public int getOrderItemId() {
//		return orderItemId;
//	}
//
//	public void setOrderItemId(int orderItemId) {
//		this.orderItemId = orderItemId;
//	}
// 
//	
//	public Product getProductId() {
//		return productId;
//	}
//
//	public void setProductId(Product productId) {
//		this.productId = productId;
//	}
//
//	public int getQuantity() {
//		return quantity;
//	}
//
//	public void setQuantity(int quantity) {
//		this.quantity = quantity;
//	}
//
//	public double getItemPrice() {
//		return itemPrice;
//	}
//
//	public void setItemPrice(double itemPrice) {
//		this.itemPrice = itemPrice;
//	}
//
//	public Order getOrderObj() {
//		return orderObj;
//	}
//
//	public void setOrderObj(Order orderObj) {
//		this.orderObj = orderObj;
//	}
//    
//    
//}
