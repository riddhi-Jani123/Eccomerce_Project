package com.inexture.ecommerce.dto;

import com.inexture.ecommerce.model.Product;
import com.inexture.ecommerce.model.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {
    private long cartId;
    private User user;
    private Product product;
    private int quantity;
}
