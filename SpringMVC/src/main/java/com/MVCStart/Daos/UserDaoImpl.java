package com.MVCStart.Daos;


import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.MVCStart.Models.User;

@Repository("UserDao")
@Transactional
public class UserDaoImpl implements UserDao {

	
	@Autowired
	PasswordEncoder passwordEncoder;

	@Qualifier("sessionFactory")
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean addUsers(User user) {
		// TODO Auto-generated method stub
		try {
		Session session = sessionFactory.getCurrentSession();
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		session.save(user);
		
		return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User validateUser(String email, String pass) {
		// TODO Auto-generated method stub
		return null;
	}

}
