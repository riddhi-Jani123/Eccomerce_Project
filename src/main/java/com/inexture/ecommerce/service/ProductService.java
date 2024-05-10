package com.inexture.ecommerce.service;

import com.inexture.ecommerce.dto.ProductDTO;
import com.inexture.ecommerce.model.Product;

import java.util.List;

public interface ProductService {

    public List<Product> findAll();

    public List<ProductDTO> findAllProductsWithImages();
}
