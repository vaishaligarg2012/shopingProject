package com.MVCStart.Daos;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.MVCStart.Models.Payment;

@Transactional
@Repository("PaymentDao")
public class PaymentDaoImpl implements PaymentDao {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addPayments(Payment payment) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(payment);
			return true; 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
