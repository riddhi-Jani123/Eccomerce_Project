package com.inexture.ecommerce.service;

import com.inexture.ecommerce.model.Brand;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.MethodArgumentNotValidException;

import java.util.List;
import java.util.Optional;

@Service
public interface BrandService {


    public List<Brand> findAll();

    public Optional<Brand> findById(Long id);

    public Brand createBrand(Brand brand);

    public ResponseEntity<String> handleValidationExceptions(MethodArgumentNotValidException ex);

    public Brand updateBrand(Long id, Brand brand);

    public void deleteBrand(Long id);


}
