package com.inexture.ecommerce.service.impl;

import com.inexture.ecommerce.dto.ProductDTO;
import com.inexture.ecommerce.model.Product;
import com.inexture.ecommerce.model.ProductImage;
import com.inexture.ecommerce.repository.ProductImageRepository;
import com.inexture.ecommerce.repository.ProductRepository;
import com.inexture.ecommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductImageRepository productImageRepository;

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public List<ProductDTO> findAllProductsWithImages(){
        List<Product> productList = productRepository.findAll();
        List<ProductDTO> productDTOList = new ArrayList<>();

        for (Product product : productList) {
            ProductDTO productDTO = new ProductDTO();
            productDTO.setProductId(product.getProductId());
            productDTO.setName(product.getName());
            productDTO.setDescription(product.getDescription());
            productDTO.setPrice(product.getPrice());
            productDTO.setQuantity(product.getQuantity());
            productDTO.setDiscount(product.getDiscount());
            productDTO.setBrand(product.getBrand());

            // Fetch image for the product and set it in the DTO
            ProductImage productImage = productImageRepository.findByProduct(product);
            if (productImage != null) {
                productDTO.setImage(Base64.getEncoder().encodeToString(productImage.getImage()));
            }
            productDTOList.add(productDTO);
        }
        return productDTOList;
    }

}
