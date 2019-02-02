package com.MVCStart.Daos;

import com.MVCStart.Models.User;

public interface UserDao {
	  public boolean addUsers(User user);
      public boolean validateUser(String email,String pass);

}
