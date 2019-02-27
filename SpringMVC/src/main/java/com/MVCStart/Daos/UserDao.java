package com.MVCStart.Daos;

import com.MVCStart.Models.User;
import com.MVCStart.Models.UserAddress;

public interface UserDao {
	  public boolean addUsers(User user);
      public boolean validateUser(String email,String pass);
      public User getUserById(String email);
      public boolean addNewAddress(UserAddress userAddress);
      public UserAddress getAllAddressByUserId(String userId);

}
