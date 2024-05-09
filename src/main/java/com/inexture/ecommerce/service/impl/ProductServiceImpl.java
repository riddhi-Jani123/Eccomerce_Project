package com.inexture.ecommerce.service.impl;

import com.inexture.ecommerce.model.Product;
import com.inexture.ecommerce.repository.ProductRepository;
import com.inexture.ecommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }
}
