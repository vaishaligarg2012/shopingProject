package com.MVCStart.Daos;


import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.MVCStart.Models.User;
//import com.MVCStart.Models.UserAddress;
import com.MVCStart.Models.UserAddress;

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
	public boolean validateUser(String email, String pass) {
		// TODO Auto-generated method stub
         	try {
         		Session session = sessionFactory.getCurrentSession();
         		Query query = session.createQuery("from User");
         		List<User> list = query.getResultList();
         		for(User u: list) {
         			if(u.getEmail().equals(email) && u.getPassword().equals(pass)) {
         				return true;
         			}else {
         				return false;
         			}
         		}
         	}catch(Exception e) {
         		e.printStackTrace();
         	}
 		return false;
	}

	@Override
	public User getUserById(String email) {
		try {
		Session session=sessionFactory.getCurrentSession();
		User obj=session.get(User.class,email);
		return obj;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean addNewAddress(UserAddress userAddress) {
		// TODO Auto-generated method stub
		try {
			Session session= sessionFactory.getCurrentSession();
			session.save(userAddress);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<UserAddress> getAllAddressByUserId(String userId) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query=session.createQuery("From UserAddress where userObj.email=:x");
			query.setParameter("x",userId);
			return query.getResultList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public UserAddress getAddressById(int addressId) {
		try {
			Session session = sessionFactory.getCurrentSession();
			UserAddress adr=session.get(UserAddress.class, addressId);
			return adr;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean deleteUserAddress(UserAddress userAddress) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
			session.delete(userAddress);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean updateUserAddress(UserAddress userAddress) {
		// TODO Auto-generated method stub
		try {
			Session session =sessionFactory.getCurrentSession();
			session.update(userAddress);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
