package com.MVCStart.Daos;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.MVCStart.Models.Item;


@Transactional
@Repository("itemDao")
public class ItemDaoImpl implements ItemDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addItem(Item item) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(item);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateItem(Item item) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(item);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteItem(int itemId) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
			Item item = session.get(Item.class, itemId);
			session.delete(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Item getItemByProductIdAndCustomerId(int productId, String customerId) {
		// TODO Auto-generated method stub
		System.out.println(productId+" "+customerId);
		try{
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from Item where customerId=:a and product.productId=:b");
			query.setParameter("a",customerId);
			query.setParameter("b",productId);
			
			List<Item> items=query.getResultList();
			System.out.println("list = "+items);
			if(items.size()==0){
					return null;
			}
			else {
				return items.get(0);
			}
	}
	catch(Exception e){
		e.printStackTrace();
	}
			return null;
	}

	@Override
	public List<Item> getItemsListByCart(int cartId) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Item where cart.cartId=:d");
			query.setParameter("d", cartId);
			List<Item> lists = query.getResultList();
			if (lists.size() == 0) {
				return null;
			} else {
				return lists;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean increaseQuantity(int itemId) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
		    Item items=session.get(Item.class, itemId);
	        items.setQunatity(items.getQunatity()+1);
	        session.merge(items);
	        return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean decreaseQuantity(int itemId) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.getCurrentSession();
		    Item items=session.get(Item.class, itemId);
	        items.setQunatity(items.getQunatity()-1);
	        session.merge(items);
	        return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	@Override
	public Item getItemByItemId(int id) {
		try{
			Session session=sessionFactory.getCurrentSession();
			Item obj=(Item)session.get(Item.class, id);
			return obj;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
}
