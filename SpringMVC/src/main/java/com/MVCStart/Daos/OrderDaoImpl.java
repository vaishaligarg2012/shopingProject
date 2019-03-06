package com.MVCStart.Daos;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.MVCStart.Models.Order;


@Transactional
@Repository("OrderDao")
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SessionFactory sessionFactory;
	public boolean addOrder(Order order) {
		// TODO Auto-generated method stub
		try {
		Session session = sessionFactory.getCurrentSession();
		session.save(order);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
