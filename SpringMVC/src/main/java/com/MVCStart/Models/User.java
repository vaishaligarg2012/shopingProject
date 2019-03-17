package com.MVCStart.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.MVCStart.CustomByAnnotation.PasswordValidation;

@Entity
@Table(name="User")
public class User {

	@Id  
	@Email
	@NotEmpty
	private String email;
	
	@NotEmpty
	private String fName;
	
	@NotEmpty
	private String lName;
	 
	@NotEmpty
	//@PasswordValidation()
	private String password;
	
	@NotEmpty
	@Transient
	//@PasswordValidation(value="DUV", message="Not match!!")
	private String confirmPassword;
	
	@NotEmpty
	private String phone;
	
	private String role;
	private String enabled;
	
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
}
