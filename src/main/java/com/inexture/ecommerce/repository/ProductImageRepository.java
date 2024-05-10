package com.inexture.ecommerce.repository;

import com.inexture.ecommerce.model.Product;
import com.inexture.ecommerce.model.ProductImage;
import com.inexture.ecommerce.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage, Long> {

    ProductImage findByProduct(@Param("productId") Product productId);
}
