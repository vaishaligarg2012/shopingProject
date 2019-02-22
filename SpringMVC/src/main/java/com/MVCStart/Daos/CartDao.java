package com.MVCStart.Daos;

import com.MVCStart.Models.Cart;

public interface CartDao {
               public boolean addCart(Cart cart);
               public Cart getCartByCustomer(String customerId);
               public boolean deleteCart(int cartId);
}
