package com.inexture.ecommerce.service;

import com.inexture.ecommerce.dto.CartDTO;

public interface CartService {

    CartDTO addToCart(CartDTO cartDTO);
}
