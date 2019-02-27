package com.MVCStart.Daos;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.MVCStart.Models.Cart;


@Transactional
@Repository("cartDao")
public class CartDaoImpl implements CartDao {
 
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addCart(Cart cart) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(cart);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Cart getCartByCustomer(String customerId) {
		// TODO Auto-generated method stub
		try{
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from Cart where customerId=:c");
			query.setParameter("c",customerId);
			List<Cart> cList=query.getResultList();
			if(cList.size()==0){
				return null;
			}
			else {
			return cList.get(0);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
				return null;
	}

	@Override
	public boolean deleteCart(int cartId) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
			Cart cart = session.get(Cart.class, cartId);
			session.delete(cart);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
