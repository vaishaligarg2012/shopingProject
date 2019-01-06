package com.MVCStart.Daos;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.MVCStart.Models.User;

@Repository("UserDao")
@Transactional
public class UserDaoImpl implements UserDao {

	@Qualifier("sessionFactory")
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean addUsers(User user) {
		// TODO Auto-generated method stub
		try {
		Session session = sessionFactory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		session.save(user);
		tr.commit();
		session.close();
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
