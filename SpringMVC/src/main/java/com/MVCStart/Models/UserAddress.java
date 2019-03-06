package com.MVCStart.Models;
 
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="UserAddress")
public class UserAddress {
	    
	    @Id
	    @GeneratedValue(strategy=GenerationType.AUTO)
	    private int userAddressId;
	    
	    @NotEmpty	
	    private String userAddressLine;
	    
	    @NotEmpty
	    private String userCity;
	    
	    @NotEmpty 
	    private String userState;
	    
	   // @Pattern(regexp="^[a-zA-Z0-9]{5}", message="only 5 chars/digits")
	    @NotNull
		private Integer userPinCode;
		
	    @ManyToOne(fetch=FetchType.EAGER)
		@JoinColumn(name="userEmail")
		private User userObj;

		public int getUserAddressId() {
			return userAddressId;
		}

		public void setUserAddressId(int userAddressId) {
			this.userAddressId = userAddressId;
		}

		public String getUserAddressLine() {
			return userAddressLine;
		}

		public void setUserAddressLine(String userAddressLine) {
			this.userAddressLine = userAddressLine;
		}

		public String getUserCity() {
			return userCity;
		}

		public void setUserCity(String userCity) {
			this.userCity = userCity;
		}

		public String getUserState() {
			return userState;
		}

		public void setUserState(String userState) {
			this.userState = userState;
		}

		public Integer getUserPinCode() {
			return userPinCode;
		}

		public void setUserPinCode(Integer userPinCode) {
			this.userPinCode = userPinCode;
		}

		public User getUserObj() {
			return userObj;
		}

		public void setUserObj(User userObj) {
			this.userObj = userObj;
		}
		
		
		
}
