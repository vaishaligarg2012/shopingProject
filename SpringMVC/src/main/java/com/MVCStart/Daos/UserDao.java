package com.MVCStart.Daos;

import java.util.List;

import com.MVCStart.Models.User;
//import com.MVCStart.Models.UserAddress;
import com.MVCStart.Models.UserAddress;

public interface UserDao {
	  public boolean addUsers(User user);
      public boolean validateUser(String email,String pass);
      public User getUserById(String email);
      public boolean addNewAddress(UserAddress userAddress);
      public List<UserAddress> getAllAddressByUserId(String userId);
      public UserAddress getAddressById(int addressId);
      public boolean deleteUserAddress(UserAddress userAddress);
      public boolean updateUserAddress(UserAddress userAddress);

}
