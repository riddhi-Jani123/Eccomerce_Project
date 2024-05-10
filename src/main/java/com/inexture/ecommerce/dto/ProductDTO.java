package com.inexture.ecommerce.dto;

import com.inexture.ecommerce.model.Brand;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
    private long productId;
    private String name;
    private String description;
    private BigDecimal price;
    private int quantity;
    private BigDecimal discount;
    private Brand brand;
    private String image;
}
