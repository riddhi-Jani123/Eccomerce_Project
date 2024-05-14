package com.inexture.ecommerce.service.impl;

import com.inexture.ecommerce.dto.CartDTO;
import com.inexture.ecommerce.dto.UserDTO;
import com.inexture.ecommerce.model.Cart;
import com.inexture.ecommerce.model.User;
import com.inexture.ecommerce.repository.CartRepository;
import com.inexture.ecommerce.service.CartService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartRepository cartRepository;

    @Override
    public CartDTO addToCart(CartDTO cartDTO) {
        Cart cart = cartRepository.save(convertToEntity(cartDTO));
        cartDTO.setCartId(cart.getCartId());
        return cartDTO;
    }

    private CartDTO convertToDTO(Cart cart) {
        CartDTO cartDTO = new CartDTO();
        BeanUtils.copyProperties(cart, cartDTO);
        return cartDTO;
    }

    private Cart convertToEntity(CartDTO cartDTO) {
        Cart cart = new Cart();
        BeanUtils.copyProperties(cartDTO, cart);
        return cart;
    }
}
